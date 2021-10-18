package mall.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import mall.model.QNABean;
import mall.model.QNADao;

@Controller
public class QNADeleteController {
	
	private final String command = "/delete.mall";
	private final String getPage = "/deleteForm";
	private final String gotoPage = "redirect:/qna.mall";
	
	@Autowired
	QNADao qdao;
	
	@RequestMapping(value = command)
	public String doAction(@RequestParam("QNUM") int QNUM, Model model
				 ,@RequestParam("pageNumber") int pageNumber ) {
		
		System.out.println("---- deleteForm  ----");
		
		model.addAttribute("QNUM", QNUM);
		model.addAttribute("pageNumber", pageNumber);
		
		return getPage;
	}
	
	
	@RequestMapping(value = command, method = RequestMethod.POST)
	public ModelAndView doActionP(@RequestParam("QNUM") int QNUM, HttpServletResponse response, 
							@RequestParam("QPW") String QPW, ModelAndView mav, 
							@RequestParam("pageNumber") int pageNumber) throws IOException {
		
		System.out.println("---- delete POST ----");
		
		QNABean qnaOne = qdao.getQNA(QNUM);
		System.out.println("db 비번 " + qnaOne.getQPW());
		System.out.println("입력비번 " + QPW);
		
		if(QPW.equals(qnaOne.getQPW())) {
			System.out.println("비밀번호 일치");
			
			qdao.deleteQNA(QNUM);
			
			System.out.println("레코드 삭제");
			
			mav.addObject("QNUM", QNUM);
			mav.addObject("pageNumber", pageNumber);
			mav.setViewName(gotoPage);
		}
		else {
			System.out.println("비밀번호 틀림");
			
			response.setCharacterEncoding("UTF-8"); 
			response.setContentType("text/html; charset=UTF-8");
			
			PrintWriter pw = response.getWriter();
			pw.println("<script>alert('비밀번호가 틀렸습니다.');</script>");
			pw.flush();
			
			mav.addObject("QNUM", QNUM);
			mav.addObject("pageNumber", pageNumber);
			mav.setViewName(getPage);
		}
		return mav;
	}
	
}
