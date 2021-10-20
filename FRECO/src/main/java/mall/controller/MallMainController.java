package mall.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import product.model.ProductBean;
import product.model.ProductDao;

@Controller
public class MallMainController {
	private final String command = "/main.mall";
	private final String gotoPage = "main";
	
	@Autowired
	ProductDao pdao;
	
	@RequestMapping(value=command)
	public ModelAndView doAction(ModelAndView mav) {		
		
		// 베스트 상품 출력
		List<ProductBean> bestItem =pdao.getRankList();
		mav.addObject("bestItem", bestItem);
		
		// 신상품 출력
		List<ProductBean> NewItem =pdao.getRankListNew();
		mav.addObject("NewItem", NewItem);
		
		mav.setViewName(gotoPage);
		return mav;
	}
}
