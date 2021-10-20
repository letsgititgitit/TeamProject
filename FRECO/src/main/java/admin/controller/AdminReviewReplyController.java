package admin.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import product.model.ReviewBean;
import product.model.ReviewDao;

@Controller
public class AdminReviewReplyController {
	
	private final String command="/reviewreply.admin";
	private final String gotoPage="AdminReviewReply";
	private final String getPage="redirect:/review.admin";
	 
	@Autowired
	ReviewDao reviewDao;

	@RequestMapping(value=command,method=RequestMethod.GET)
	public ModelAndView doAction(@RequestParam(value="RID") String RID,
								@RequestParam(value="RREF") int RREF,								
								@RequestParam(value="RCONTENT") String RCONTENT,
								@RequestParam(value="RSUBJECT") int RSUBJECT,
								ModelAndView mav) {
		
			
		mav.addObject("ORID", RID);
		mav.addObject("RREF", RREF);
		mav.addObject("ORCONTENT", RCONTENT);
		mav.addObject("RSUBJECT", RSUBJECT);
		mav.setViewName(gotoPage);
		return mav;
	}
	
	@RequestMapping(value=command,method=RequestMethod.POST)
	public ModelAndView doAction(ReviewBean bean, ModelAndView mav) {
						
		reviewDao.insertReply(bean);
		
		reviewDao.updateRREPLY(bean);
		
		mav.setViewName(getPage);
		return mav;
	}
	
	
}
