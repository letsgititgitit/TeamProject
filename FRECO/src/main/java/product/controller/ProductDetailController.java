package product.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import product.model.ProductBean;
import product.model.ProductDao;

@Controller
public class ProductDetailController {
	private final String command = "/pdetail.product";
	
	private final String gotoPage = "productDetail";
	
	@Autowired
	@Qualifier("myProductDao")
	private ProductDao PDao;
	
	@RequestMapping(value=command)
	public ModelAndView doAction(
			@RequestParam(value="PNUM") String PNUM,
			
			ModelAndView mav) {
		
		System.out.println("<상품디테일 요청>");
		System.out.println("넘어온 상품 PNUM: "+PNUM);
		
		//상품디테일요청
		ProductBean pbean = PDao.getSelectNum(PNUM);
		System.out.println("받아온 상품 PNAME: "+ pbean.getPNAME());

		//상품디테일요청 : 해당상품 제외 추천상품 list출력
		Map<String,String> map = new HashMap<String,String>();
		map.put("whatCate", pbean.getPCATEGORY());
		map.put("number", PNUM);
		
		List<ProductBean> withoutPnum = PDao.getWithoutPnum(map);
		
		mav.addObject("pbean", pbean);
		mav.addObject("withoutPnum", withoutPnum);
		
		mav.setViewName(gotoPage);
		
		return mav;
	}
}
