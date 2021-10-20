package admin.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import product.model.ReviewBean;
import product.model.ReviewDao;

@Controller
public class AdminReviewController {
	
	private final String command="/review.admin";
	private final String gotoPage="AdminReviewList";
	
	@Autowired
	ReviewDao reviewDao;
	
	@RequestMapping(value=command,method=RequestMethod.GET)
	public ModelAndView doAction(ModelAndView mav) {
		
		List<ReviewBean> rlist = reviewDao.getAdminList();
		int count = reviewDao.replyCount();
		
		mav.addObject("count", count);		
		mav.addObject("rlist", rlist);
		mav.setViewName(gotoPage);
		return mav;
	}
	
	@RequestMapping(value=command,method=RequestMethod.POST)
	public ModelAndView doAction2(ModelAndView mav) {
		
		List<ReviewBean> rlist = reviewDao.getReplyWait();
		int count = reviewDao.replyCount();
		
		mav.addObject("count", count);
		mav.addObject("rlist", rlist);
		mav.setViewName(gotoPage);
		return mav;
	}
}
