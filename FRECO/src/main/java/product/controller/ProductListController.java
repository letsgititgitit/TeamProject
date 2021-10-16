package product.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import product.model.ProductBean;
import product.model.ProductDao;
import utility.PagingPcategory;

@Controller
public class ProductListController {
	private final String command = "/list.product";
	
	private final String foodPage = "productList_food";
	private final String homePage = "productList_home";
	private final String babyPage = "productList_baby";
	private final String petPage = "productList_pet";
	
	@Autowired
	@Qualifier("myProductDao")
	private ProductDao PDao;
	
	@RequestMapping(value=command)
	public ModelAndView doAction(
			@RequestParam(value="pageNumber", required = false) String pageNumber,
			
			@RequestParam(value="PCATEGORY", required = false) String PCATEGORY,
			@RequestParam(value="PSUBCATEGORY", required = false) String PSUBCATEGORY,
			
			@RequestParam(value="lineUp", required = false) String lineUp,
			@RequestParam(value="lineUpPrice", required = false) String lineUpPrice,
			ModelAndView mav,
			HttpServletRequest request) {
		
		System.out.println();
		System.out.println("<상품List 요청>");
		
		if(PSUBCATEGORY == "") {
			PSUBCATEGORY = null;
		}
		if(lineUpPrice =="" || lineUpPrice == "전체 선택") {
			lineUpPrice = null;
		}
		
		System.out.println("pageNumber: "+pageNumber);
		System.out.println("PCATEGORY: "+PCATEGORY);
		System.out.println("PSUBCATEGORY: "+PSUBCATEGORY);
		System.out.println("lineUp: "+lineUp);
		System.out.println("lineUpPrice: "+lineUpPrice);
		System.out.println("-------------------------------");
		
		if(lineUpPrice != null) {
			System.out.println("==가격 선택을 통한 LIST요청 ==");
			
			if(PSUBCATEGORY != null) {
				System.out.println("++가격별(카테고리:세부일 때) : list출력++");
				Map<String,String> mapPriceSub = new HashMap<String,String>();
				mapPriceSub.put("whatSub", PSUBCATEGORY);
				
				mapPriceSub.put("lineUp", lineUp);
				mapPriceSub.put("lineUpPrice", lineUpPrice);
				
				int totalCount = PDao.getTotalCountPriceSub(mapPriceSub);
				String url = request.getContextPath() + command + "?lineUp=" + lineUp + "&lineUpPrice=" + lineUpPrice + "&PSUBCATEGORY=" + PSUBCATEGORY;
				
				PagingPcategory pageInfo = new PagingPcategory(pageNumber, null, totalCount, url, PCATEGORY);
				List<ProductBean> lists = PDao.getProductListPriceSub(pageInfo, mapPriceSub);
				
				mav.addObject("lists", lists);
				mav.addObject("pageInfo", pageInfo);
				mav.addObject("totalCount", totalCount);
				
				mav.addObject("lineUpPrice", lineUpPrice);
				
				System.out.println("=======PSUBCATEGORY: "+PSUBCATEGORY);
				mav.addObject("PSUBCATEGORY", PSUBCATEGORY);
			}
			else {
				System.out.println("++가격별(카테고리:ALL일 때) : list출력++");
				Map<String,String> mapPrice = new HashMap<String,String>();
				mapPrice.put("whatCate", PCATEGORY);
				
				mapPrice.put("lineUp", lineUp);
				mapPrice.put("lineUpPrice", lineUpPrice);
				
				int totalCount = PDao.getTotalCountPrice(mapPrice);
				String url = request.getContextPath() + command + "?lineUp=" + lineUp + "&lineUpPrice=" + lineUpPrice;
				
				PagingPcategory pageInfo = new PagingPcategory(pageNumber, null, totalCount, url, PCATEGORY);
				List<ProductBean> lists = PDao.getProductListPrice(pageInfo, mapPrice); 
				
				mav.addObject("lists", lists);
				mav.addObject("pageInfo", pageInfo);
				mav.addObject("totalCount", totalCount);
				
				mav.addObject("lineUpPrice", lineUpPrice);
			}
			
		}//
		else if(PSUBCATEGORY != null) {
			System.out.println("==세부 선택을 통한 LIST요청 ==");
			
			Map<String,String> mapSub = new HashMap<String,String>();
			mapSub.put("whatSub", PSUBCATEGORY);
			
			mapSub.put("lineUp", lineUp);
			
			int totalCount = PDao.getTotalCountSubCate(mapSub);
			String url = request.getContextPath() + command + "?lineUp=" + lineUp + "&PSUBCATEGORY=" + PSUBCATEGORY;
			
			PagingPcategory pageInfo = new PagingPcategory(pageNumber, null, totalCount, url, PCATEGORY);
			List<ProductBean> lists = PDao.getProductListSubCate(pageInfo, mapSub);  
			
			mav.addObject("lists", lists);
			mav.addObject("pageInfo", pageInfo);
			mav.addObject("totalCount", totalCount);
			
			mav.addObject("PSUBCATEGORY", PSUBCATEGORY);
		}//
		else {
			System.out.println("==카테고리 선택을 통한 LIST요청 ==");
			Map<String,String> map = new HashMap<String,String>();
			map.put("whatCate", PCATEGORY);
			
			map.put("lineUp", lineUp);
			
			int totalCount = PDao.getTotalCountCate(map);
			String url = request.getContextPath() + command + "?lineUp=" + lineUp ;
			
			PagingPcategory pageInfo = new PagingPcategory(pageNumber, null, totalCount, url, PCATEGORY);
			List<ProductBean> lists = PDao.getProductListCate(pageInfo, map); 
			
			mav.addObject("lists", lists);
			mav.addObject("pageInfo", pageInfo);
			mav.addObject("totalCount", totalCount);
		}//
		
		//////////////////////////////////////////////////////////////
		if(PCATEGORY.equals("식품")) {
			System.out.println("식품 선택");
			mav.setViewName(foodPage);
		}
		else if(PCATEGORY.equals("생활용품")){
			System.out.println("식품 선택");
			mav.setViewName(homePage);
		}
		else if(PCATEGORY.equals("베이비∙키즈")){
			System.out.println("식품 선택");
			mav.setViewName(babyPage);
		}
		else{
			System.out.println("반려동물 선택");
			mav.setViewName(petPage);
		}
		
		mav.addObject("PCATEGORY", PCATEGORY);
		mav.addObject("lineUp", lineUp);
		
		//카테고리별 : best상품순
		List<ProductBean> bestItem =PDao.getBestItem(PCATEGORY);
		mav.addObject("bestItem", bestItem);
		
		System.out.println("-------------------------------");
		System.out.println("pageNumber: "+pageNumber);
		System.out.println("PCATEGORY: "+PCATEGORY);
		System.out.println("PSUBCATEGORY: "+PSUBCATEGORY);
		System.out.println("lineUp: "+lineUp);
		System.out.println("lineUpPrice: "+lineUpPrice);
		System.out.println("-------------------------------");
		
		
		return mav;
	}//
	
}
