package mall.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import mall.model.FAQBean;
import mall.model.FAQDao;
import mall.model.QNABean;
import mall.model.QNADao;

@Controller
public class FAQInsertController {
	private final String command = "/faqinsert.mall";
	private final String getPage = "faqinsert";
	private final String gotoPage = "redirect:/faq.mall";
	
	@Autowired
	FAQDao fdao;
	
	@RequestMapping(value=command)
	public String doAction() {
		System.out.println("---- FAQ Insert GET ----");
		
		return getPage;
	}
	
	
	@RequestMapping(value=command, method = RequestMethod.POST)
	public ModelAndView doActionPOST(@Valid FAQBean faq, BindingResult result, HttpSession session, 
										ModelAndView mav, HttpServletResponse response) {
		System.out.println("---- FAQ Insert POST ----");
		
		if(result.hasErrors()) { 
			System.out.println("유효성 검사 오류입니다.");
			mav.setViewName(getPage); 
			return mav; 
		}
		
		int cnt = fdao.insertFAQ(faq);
		System.out.println("cnt: " + cnt);
		
		mav.setViewName(gotoPage);
		return mav;
	
	}
	
	
	
	
	
}


