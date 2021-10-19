package mall.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import mall.model.QNABean;
import mall.model.QNADao;
import member.model.MemberBean;

@Controller
public class QNADetailViewController {
	
	private final String command = "/detail.mall";
	private final String getPage = "qnaDetailView";
	private final String gotoPage = "redirect:/detailViewAdmin.mall";
	
	@Autowired
	QNADao qdao;
	
	// 1대1 문의에서 제목 눌렀을때 상세페이지로 이동
	@RequestMapping(value = command)
	public ModelAndView doAction(@RequestParam("QNUM") int QNUM, HttpSession session,
							@RequestParam(value="pageNumber", required = false) String pageNumber,
							HttpServletResponse response, ModelAndView mav) throws IOException {
		
		System.out.println("---- QNADetailViewController ----");
		
		MemberBean member = (MemberBean)session.getAttribute("loginInfo");
		
		QNABean qna =  qdao.getQNA(QNUM);
		
		//관리자로 로그인 했을 경우 		
		if(member.getMID().equals("ADMIN")) {
			System.out.println("관리자 입니다.");
					
			mav.addObject("qna", qna);
			mav.addObject("pageNumber", pageNumber);
			mav.addObject("QNUM", QNUM);
			mav.setViewName(gotoPage);
		}
		//사용자로 로그인 했을 경우 
		else {
			//QNA에서 제목 클릭해서 detailView로 넘어갈 때 관리자 답변이면 		
			if(qna.getQID().equals("ADMIN")) {
				System.out.println("관리자 답변입니다.");
				
				mav.addObject("qna", qna);
				mav.addObject("pageNumber", pageNumber);
				mav.addObject("QNUM", QNUM);
				mav.setViewName(gotoPage);
			}
			//QNA에서 제목 클릭해서 detailView로 넘어갈 때 사용자 작성글이면
			else {
				// 작성자와 로그인한 아이디 일치
				if(qna.getQID().equals(member.getMID())) {
					System.out.println("아이디 일치");
					System.out.println("작성자" + qna.getQID());
					System.out.println("로그인한 id: " + member.getMID() );
					
					mav.addObject("qna", qna);
					mav.addObject("pageNumber", pageNumber);
					mav.setViewName(getPage);			
				}		
			}

		}
		return mav;		
	}
	
}
