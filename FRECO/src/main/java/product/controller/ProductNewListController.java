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
public class ProductNewListController {
	private final String command = "/nlist.product";	
	private final String newPage = "productList_new";
	
	@Autowired
	@Qualifier("myProductDao")
	private ProductDao pdao;
	
	
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
			
			Map<String,String> mapPrice = new HashMap<String,String>();
			mapPrice.put("whatCate", PCATEGORY);
			
			mapPrice.put("lineUp", lineUp);
			mapPrice.put("lineUpPrice", lineUpPrice);
			
			int totalCount = pdao.getTotalCountPriceNew(mapPrice);
			String url = request.getContextPath() + command + "?lineUp=" + lineUp + "&lineUpPrice=" + lineUpPrice;
			
			PagingPcategory pageInfo = new PagingPcategory(pageNumber, null, totalCount, url, PCATEGORY);
			List<ProductBean> lists = pdao.getProductListPriceNew(pageInfo, mapPrice); 
			
			mav.addObject("lists", lists);
			mav.addObject("pageInfo", pageInfo);
			mav.addObject("totalCount", totalCount);
			
			mav.addObject("lineUpPrice", lineUpPrice);
		}//
		else {
			System.out.println("==카테고리 선택을 통한 LIST요청 ==");
			Map<String,String> map = new HashMap<String,String>();
			map.put("whatCate", PCATEGORY);			
			map.put("lineUp", lineUp);
			
			int totalCount = pdao.getTotalCountCateNew(map);
			String url = request.getContextPath() + command + "?lineUp=" + lineUp ;
			
			PagingPcategory pageInfo = new PagingPcategory(pageNumber, null, totalCount, url, PCATEGORY);
			List<ProductBean> lists = pdao.getProductListCateNew(pageInfo, map); 
			
			mav.addObject("lists", lists);
			mav.addObject("pageInfo", pageInfo);
			mav.addObject("totalCount", totalCount);
		}//
		
		//////////////////////////////////////////////////////////////
		
		if(PCATEGORY.equals("신상품")) {			
			System.out.println("신상품 선택");
			mav.setViewName(newPage);
		}
		
		mav.addObject("PCATEGORY", PCATEGORY);
		mav.addObject("lineUp", lineUp);
		
		//카테고리별 : New상품순
		List<ProductBean> NewItem =pdao.getRankListNew();
		mav.addObject("NewItem", NewItem);
		
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



/*


@RequestMapping(value=command)
	public ModelAndView doAction( @RequestParam(value="pageNumber", required = false) String pageNumber,			
							@RequestParam(value="PCATEGORY", required = false) String PCATEGORY, HttpServletRequest request,
							@RequestParam(value="PSUBCATEGORY", required = false) String PSUBCATEGORY, ModelAndView mav ) {
		
		if(PSUBCATEGORY == "") {
			PSUBCATEGORY = null;
		}
		
		System.out.println("pageNumber: " + pageNumber);
		System.out.println("PCATEGORY: " + PCATEGORY);
		System.out.println("PSUBCATEGORY: " + PSUBCATEGORY);
		System.out.println("-------------------------------");
		
		
		List<ProductBean> rlists = pdao.getRankList();
		System.out.println("rlists :" + rlists.size());
		mav.addObject("rlists", rlists);
		
//		PagingPcategory pageInfo = new PagingPcategory(pageNumber, null, totalCount, url, PCATEGORY);
				
///////////////////////////////////////////////////////////////////////////////////////		
		
		if(PCATEGORY.equals("베스트")) {
			System.out.println("베스트 선택");
			mav.setViewName(NewPage);
		}
		else if(PCATEGORY.equals("신상품")) {
			System.out.println("신상품 선택");
			mav.setViewName(newPage);
		}
		
		mav.addObject("PCATEGORY", PCATEGORY);
		
		System.out.println("-------------------------------");
		System.out.println("pageNumber: "+pageNumber);
		System.out.println("PCATEGORY: "+PCATEGORY);
		System.out.println("PSUBCATEGORY: "+PSUBCATEGORY);
		System.out.println("-------------------------------");
		
		return mav;
	}//



*/
























