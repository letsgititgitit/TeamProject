package admin.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import mall.model.QNABean;
import mall.model.QNADao;

@Controller
public class AdminReplyUpdateController {

	private final String command="/replyUpdate.admin";
	private final String getPage="AdminReplyUpdateForm";
	private final String gotoPage="redirect:/replyDetail.admin";
	
	@Autowired
	QNADao qdao;
	
	@RequestMapping(value=command,method=RequestMethod.GET)
	public ModelAndView doAction(@RequestParam("QNUM") int QNUM, ModelAndView mav) {
		
		QNABean qna = qdao.getQNA(QNUM);
		mav.addObject("qna", qna);
		mav.setViewName(getPage);
		return mav;
	}
	
	@RequestMapping(value=command,method=RequestMethod.POST)
	public ModelAndView doAction(QNABean bean, ModelAndView mav) {
		
		
		qdao.getReplyUpdate(bean);
		
		mav.setViewName(gotoPage+"?QREF="+bean.getQREF());
		return mav;
	}
	
}
