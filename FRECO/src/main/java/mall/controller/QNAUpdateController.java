package mall.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
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

import mall.model.QNABean;
import mall.model.QNADao;

@Controller
public class QNAUpdateController {
	
	private final String command = "/update.mall";
	private final String getPage = "updateForm";
	private final String gotoPage = "redirect:/qna.mall";
	
	@Autowired
	QNADao qdao;
	
	@RequestMapping(value = command, method = RequestMethod.GET)
	public String doActionGet(@RequestParam(value = "QNUM") int QNUM,
			/* @RequestParam(value = "pageNumber") int pageNumber, */
								Model model) {
		
		System.out.println("---- updateForm ----");
		
		QNABean qna = qdao.getQNA(QNUM);
		
		model.addAttribute("qna", qna);
		model.addAttribute("QNUM", QNUM);
//		model.addAttribute("pageNumber", pageNumber);
		
		return getPage;
	}
	
	
	
	@RequestMapping(value = command, method = RequestMethod.POST)
	public ModelAndView doActionPost(/* @RequestParam(value = "pageNumber") int pageNumber, */
							@ModelAttribute("qna") @Valid QNABean qna, BindingResult result,
							@RequestParam(value = "QNUM") int QNUM,
							HttpServletResponse response, ModelAndView mav) throws IOException {
		
		System.out.println("---- update POST ----");
		
		if(result.hasErrors()) {  
			System.out.println("유효성 검사 실패");
//			mav.addObject("pageNumber", pageNumber);
			System.out.println("QNA : " +qna.getQPW()+" "+ qna.getQID() + " " + qna.getQSUBJECT() + " " + qna.getQCONTENT());
			mav.addObject("QNUM", QNUM);
			mav.setViewName(getPage);  
			return mav;
		}
		
		if(!qna.getQPW().equals("1234")) {
			System.out.println("비번 틀림 : " + qna.getQPW());
			
			PrintWriter pw = response.getWriter();
			pw.println("<script>alert('비밀번호가 틀렸습니다.');</script>");
			pw.flush();
			
			mav.addObject("QNUM", QNUM);
			mav.setViewName(getPage);  
		}
		else {
			System.out.println("비번 맞음");
			
			int cnt = -1;
			cnt = qdao.updateQNA(qna);
			
			if(cnt != -1) { 
				System.out.println("수정 성공");
				mav.setViewName(gotoPage);
//				mav.addObject("pageNumber", pageNumber);
			}
			else { 
				System.out.println("수정 실패");
				mav.addObject("QNUM", QNUM);
				mav.setViewName(getPage + "?pageNumber=" /* + pageNumber */); 
			}
		}
		return mav;		
	}//doActionPost
	

}//QNAUpdateController
















