package mall.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import mall.model.FAQBean;
import mall.model.FAQDao;

@Controller
public class FAQController {
	
	private final String command = "/faq.mall";
	private final String gotoPage = "faq";
	
	@Autowired
	FAQDao fdao;
	
	@RequestMapping(value=command)
	public ModelAndView doAction(HttpServletRequest request, ModelAndView mav) {
		
		System.out.println(" ----- FAQController ---- ");
		
		List<FAQBean> lists = fdao.getFAQList();
		System.out.println("lists 갯수 : " + lists.size());
		
		mav.addObject("lists", lists);
		mav.setViewName(gotoPage);
		
		return mav;
	}
	
}
































