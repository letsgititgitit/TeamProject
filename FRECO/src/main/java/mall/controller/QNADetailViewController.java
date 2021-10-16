package mall.controller;

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
	
	@RequestMapping(value = command)
	public String doAction(@RequestParam("QNUM") int QNUM, Model model) {
		System.out.println("---- QNADetailViewController ----");
		QNABean qna =  qdao.getQNA(QNUM);
		
		model.addAttribute("qna", qna);
//		model.addAttribute("pageNumber", pageNumber);
		return getPage;
	}
	
	
}
