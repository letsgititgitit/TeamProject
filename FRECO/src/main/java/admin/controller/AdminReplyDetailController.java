package admin.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import mall.model.QNABean;
import mall.model.QNADao;

@Controller
public class AdminReplyDetailController {

	private final String command="/replyDetail.admin";
	private final String getPage="AdminReplyDetail";
	
	@Autowired
	QNADao qnaDao;
	
	@RequestMapping(value=command)
	public ModelAndView doAction(@RequestParam("QREF") int QREF,
								ModelAndView mav) {
		
		
		QNABean qna = qnaDao.getReplyByQREF(QREF);
		
		mav.addObject("qna", qna);
		mav.setViewName(getPage);
		return mav;
	}
}
