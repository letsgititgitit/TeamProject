package admin.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import admin.model.Coupon;
import admin.model.CouponDao;

@Controller
public class AdminCouponListController {
	
	private final String command="/clist.admin";
	private final String getPage="AdminCouponList";
	
	@Autowired
	CouponDao couponDao;
	
	@RequestMapping(value=command,method = RequestMethod.GET)
	public ModelAndView doAction(ModelAndView mav) {
		
		
		List<Coupon> lists = couponDao.getList();
		mav.addObject("lists", lists);
		mav.setViewName(getPage);
		return mav;
	}
	
	
}
