package mall.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import mall.model.QNABean;
import mall.model.QNADao;

@Controller
public class QNADetailViewController {
	
	private final String command = "/detail.mall";
	private final String getPage = "qnaDetailView";
	
	@Autowired
	QNADao qdao;
	
	// 1대1 문의에서 제목 눌렀을때 상세페이지로 이동
	@RequestMapping(value = command)
	public String doAction(@RequestParam("QNUM") int QNUM, Model model, HttpSession session) {
		
		System.out.println("---- QNADetailViewController ----");
		
		// session 정보 넘어왔나 확인
		System.out.println("session : " + session.getAttribute("loginInfo"));
		
		QNABean qna =  qdao.getQNA(QNUM);
		
		model.addAttribute("qna", qna);
//		model.addAttribute("pageNumber", pageNumber);
		return getPage;
	}
	
	
}
