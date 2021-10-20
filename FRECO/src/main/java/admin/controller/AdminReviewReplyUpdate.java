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
public class AdminReviewReplyUpdate {

	private final String command="/reviewUpdate.admin";
	private final String gotoPage="AdminReviewReplyUpdate";
	private final String getPage="redirect:/reviewdetail.admin";
	
	@Autowired
	ReviewDao reviewDao;
	
	@RequestMapping(value=command,method=RequestMethod.GET)
	public ModelAndView doAction(@RequestParam(value="RNUM") int RNUM, ModelAndView mav) {
		
		ReviewBean rbean = reviewDao.getReplyByNum(RNUM);
		
		mav.addObject("rbean", rbean);
		mav.setViewName(gotoPage);
		return mav;
	}
	
	@RequestMapping(value=command,method=RequestMethod.POST)
	public ModelAndView doAction(ReviewBean rbean, ModelAndView mav) {
		
		reviewDao.updateReply(rbean);		
		
		mav.setViewName(getPage+"?RREF="+rbean.getRREF());
		return mav;
	}
	
	
}
