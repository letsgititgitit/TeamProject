package admin.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import product.model.ReviewBean;
import product.model.ReviewDao;

@Controller
public class AdminReviewReplyDetail {

	private final String command="/reviewdetail.admin";
	private final String getPage="AdminReviewReplyDetail";
	
	@Autowired
	ReviewDao reviewDao;
	
	@RequestMapping(value=command)
	public ModelAndView doAction(@RequestParam(value="RREF")int RREF, ModelAndView mav) {
		
		
		ReviewBean rbean = reviewDao.getReply(RREF);
		
		mav.addObject("rbean", rbean);
		mav.setViewName(getPage);
		return mav;
	}
	
	
}
