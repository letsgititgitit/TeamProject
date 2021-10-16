package product.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import product.model.ProductBean;
import product.model.ProductDao;

@Controller
public class AdminProductListController {
	private final String command="plist.product";
	private final String getPage="AdminProductList";
	
	@Autowired
	ProductDao productDao;
	@RequestMapping(value=command,method=RequestMethod.GET)
	public ModelAndView doAction(ModelAndView mav) {
		
		//관리자 페이지 상품 목록 출력
		List<ProductBean> lists = productDao.getAllList();
		mav.addObject("lists", lists);
		
		//관리자 페이지 10개 이하 재고 갯수 출력
		int pqtyNum = productDao.getPqtyNum();
		mav.addObject("pqtyNum", pqtyNum);
		
		mav.setViewName(getPage);
		return mav;
	}
	
	@RequestMapping(value=command,method=RequestMethod.POST)
	public ModelAndView doAction2(ModelAndView mav) {
		
		//관리자 페이지 10개 이하 재고 목록 출력
		List<ProductBean> lists = productDao.checkPqty();
		mav.addObject("lists", lists);
		
		//관리자 페이지 10개 이하 재고 갯수 출력
		int pqtyNum = productDao.getPqtyNum();
		mav.addObject("pqtyNum", pqtyNum);
				
		mav.setViewName(getPage);
		return mav;
	}
}
