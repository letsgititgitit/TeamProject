package admin.controller;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import mall.model.QNABean;
import mall.model.QNADao;

@Controller
public class AdminReplyInsertController {

	private final String command="reply.admin";
	private final String gotoPage="AdminReplyInsert";
	private final String getPage="redirect:/inquiry.admin";
	
	@Autowired
	QNADao QnaDao;
	
	@RequestMapping(value=command,method=RequestMethod.GET)
	public ModelAndView doAction(@RequestParam("QREF") int QREF, 
								@RequestParam("QRESTEP") int QRESTEP, 
								@RequestParam("QRELEVEL") int QRELEVEL,
								@RequestParam("QCONTENT") String QCONTENT,
								@RequestParam("QPW") String QPW,
								@RequestParam("QNUM") int QNUM,
								ModelAndView mav) {
		
		mav.addObject("QREF",QREF);
		mav.addObject("QRESTEP",QRESTEP);
		mav.addObject("QRELEVEL",QRELEVEL);
		mav.addObject("QCONTENT",QCONTENT);
		mav.addObject("QPW",QPW);
		mav.addObject("QNUM",QNUM);
		
		mav.setViewName(gotoPage);		
		return mav;
	}
	
	@RequestMapping(value=command,method=RequestMethod.POST)
	public ModelAndView doAction(QNABean qna, ModelAndView mav) {
		
		int cnt = -1;
		cnt = QnaDao.replyQNAInsert(qna); 
		QnaDao.originalUpdate(qna);
		
		mav.setViewName(getPage);
		return mav;
	}
	
}
