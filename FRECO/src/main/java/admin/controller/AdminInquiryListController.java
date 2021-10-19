package admin.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import mall.model.QNABean;
import mall.model.QNADao;

@Controller
public class AdminInquiryListController {

	private final String command="/inquiry.admin";
	private final String getPage="AdminInquiryList";
	
	@Autowired
	QNADao QnaDao;
	
	@RequestMapping(value=command,method=RequestMethod.GET)
	public ModelAndView doAction(ModelAndView mav) {
		
		List<QNABean> qlist = QnaDao.getAdminQNAList();
		int replyCount = QnaDao.getReplyCount();
		
		mav.addObject("qlist", qlist);
		mav.addObject("replyCount", replyCount);
		
		mav.setViewName(getPage);
		return mav;
	}
	
	@RequestMapping(value=command,method=RequestMethod.POST)
	public ModelAndView doAction2(ModelAndView mav) {
		
		List<QNABean> qlist = QnaDao.getNoReply();
		int replyCount = QnaDao.getReplyCount();
		
		mav.addObject("qlist", qlist);
		mav.addObject("replyCount", replyCount);
		
		mav.setViewName(getPage);
		return mav;
	}
}
