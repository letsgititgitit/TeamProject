package mall.controller;

import javax.servlet.http.HttpServletResponse;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import mall.model.FAQBean;
import mall.model.FAQDao;

@Controller
public class FAQUpdateController {
	
	private final String command = "/faqupdate.mall";
	private final String getPage = "faqUpdateForm";
	private final String gotoPage = "redirect:/faq.mall";
	
	@Autowired
	FAQDao fdao;
	
	@RequestMapping(value = command)
	public String doActionGet(@RequestParam("FNUM") int FNUM, 
			@RequestParam("pageNumber") int pageNumber, Model model) {
		
		System.out.println("---- FAQUpdateController ----");
		
		FAQBean faq = fdao.getFAQ(FNUM);
		
		model.addAttribute("faq", faq);
		model.addAttribute("FNUM", FNUM);
		model.addAttribute("pageNumber", pageNumber);
		
		return getPage;
	}
	
	
	@RequestMapping(value = command, method = RequestMethod.POST)
	public ModelAndView doActionPost( @RequestParam(value = "pageNumber") int pageNumber, 
			@ModelAttribute("faq") @Valid FAQBean faq, BindingResult result,
			@RequestParam(value = "FNUM") int FNUM,
			HttpServletResponse response, ModelAndView mav) {
		
		System.out.println("---- FAQ Update POST ----");
		
		if(result.hasErrors()) {  
			System.out.println("유효성 검사 실패");
			
			mav.addObject("pageNumber", pageNumber);
			System.out.println("FAQ : " + faq.getFNUM()+ " " + faq.getFCATEGORY() + " " + faq.getFSUBJECT() + " " + faq.getFCONTENT());
			
			mav.addObject("FNUM", FNUM);
			mav.setViewName(getPage); 
			
			return mav;
		}
		
		int cnt = -1;
		cnt = fdao.updateQNA(faq);
		
		if(cnt != -1) { 
			System.out.println("수정 성공");
			mav.setViewName(gotoPage);
			mav.addObject("pageNumber", pageNumber);
		}
		else { 
			System.out.println("수정 실패");
			mav.addObject("FNUM", FNUM);
			mav.setViewName(getPage + "?pageNumber="  + pageNumber ); 
		}		
		
		return mav;
	}

}//QNAUpdateController
















