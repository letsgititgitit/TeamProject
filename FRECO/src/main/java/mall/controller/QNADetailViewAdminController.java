package mall.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import mall.model.QNABean;
import mall.model.QNADao;
import member.model.MemberBean;

@Controller
public class QNADetailViewAdminController {
	
	private final String command = "/detailViewAdmin.mall";
	private final String getPage = "detailViewAdminForm";
	private final String gotoPage = "qnaDetailView";
	
	@Autowired
	QNADao qdao;
	
	@RequestMapping(value = command)
	public String doAction(@RequestParam("pageNumber") int pageNumber,
							@RequestParam("QNUM") int QNUM, Model model) {
		
		System.out.println("---- qna.jsp에서 ADMIN 답변 클릭 =>  detailViewAdminForm.jsp로 이동 ---");
		
		model.addAttribute("pageNumber", pageNumber);
		model.addAttribute("QNUM", QNUM);
		
		return getPage;
	}
	
	@RequestMapping(value = command, method = RequestMethod.POST)
	public ModelAndView doActionP(@RequestParam("pageNumber") int pageNumber, @RequestParam("QNUM") int QNUM, 
			ModelAndView mav, @RequestParam("QPW") String QPW, HttpServletResponse response) throws IOException {
		
		System.out.println("---- detailViewAdminForm.jsp에서 확인 버튼 클릭 -----");
		
		QNABean qnaOne = qdao.getQNA(QNUM);
		System.out.println("db 비번 " + qnaOne.getQPW());
		System.out.println("입력비번 " + QPW);
		
		if(QPW.equals(qnaOne.getQPW())) {
			System.out.println("비밀번호 일치");
			
			mav.addObject("QNUM", QNUM);
			mav.addObject("qna", qnaOne);
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














