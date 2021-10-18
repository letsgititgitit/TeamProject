package mall.controller;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import mall.model.QNABean;
import mall.model.QNADao;

@Controller
public class QNAReplyController {
	private final String command = "/reply.mall";
	private final String getPage = "replyForm";
	private final String gotoPage = "redirect:/qna.mall";
	
	@Autowired
	QNADao qdao;
	
	@RequestMapping(value = command)
	public String reply(@RequestParam(value = "pageNumber") int pageNumber, 
						@RequestParam("QREF") int QREF, @RequestParam("QRESTEP") int QRESTEP, 
						@RequestParam("QRELEVEL") int QRELEVEL, Model model) {
		
		System.out.println("---- replyForm으로 이동 ----");
		
		model.addAttribute("pageNumber",pageNumber);
		model.addAttribute("QREF",QREF);
		model.addAttribute("QRESTEP",QRESTEP);
		model.addAttribute("QRELEVEL",QRELEVEL);
		
		return getPage;
	}
	
	
	@RequestMapping(value = command, method = RequestMethod.POST)
	public String doAction(@Valid QNABean qna, BindingResult result, ModelAndView mav,
						@RequestParam(value = "pageNumber") int pageNumber) {
		
		System.out.println("---- replyForm에서 답글달기 클릭 ----");
		
		System.out.println("QNA 답글 입력한것 확인 : " + qna.getQID() + " " + qna.getQSUBJECT() + " " + qna.getQCONTENT());
		System.out.println("QNA 답글 : " + qna.getQREF() + " " + qna.getQRESTEP() + " " + qna.getQRELEVEL());
		
		System.out.println("update 전: " + qna.getQRESTEP());
		int cnt = qdao.replyQNAUpdate(qna);
		System.out.println("update 후: " + qna.getQRESTEP());
		int cnt2 = qdao.replyQNAInsert(qna);
		System.out.println("insert cnt2 : " + cnt2);
		
		mav.addObject("pageNumber", pageNumber);
		
		return gotoPage;
	}
	
	
	
}

























