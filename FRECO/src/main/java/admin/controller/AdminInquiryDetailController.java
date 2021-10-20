package admin.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import mall.model.QNABean;
import mall.model.QNADao;

@Controller
public class AdminInquiryDetailController {

	private final String command="detail.admin";
	private final String getPage="AdminInquiryDetail";

	@Autowired
	QNADao QnaDao;
	
	@RequestMapping(value=command)
	public ModelAndView doAction(@RequestParam(value="QNUM") int QNUM,								
								ModelAndView mav) {
		
		QNABean qna = QnaDao.getQNA(QNUM);
		
		mav.addObject("qna", qna);
		mav.setViewName(getPage);
		return mav;
	}
}
