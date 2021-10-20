package mall.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import mall.model.FAQDao;


@Controller
public class FAQDeleteController {
	
	private final String command = "/faqdelete.mall";
	private final String gotoPage = "redirect:/faq.mall";
	
	@Autowired
	FAQDao fdao;
	
	@RequestMapping(value = command, method = RequestMethod.GET)
	public ModelAndView doActionGet(@RequestParam("FNUM") int FNUM, ModelAndView mav,
			 					@RequestParam("pageNumber") int pageNumber) {
		
		System.out.println("---- FAQDeleteController ----");
		
		int cnt = fdao.deleteFAQ(FNUM);
		System.out.println("삭제 성공");
		
		mav.addObject("FNUM", FNUM);
		mav.addObject("pageNumber", pageNumber);
		mav.setViewName(gotoPage);
		
		return mav;
	}


}//FAQDeleteController
















