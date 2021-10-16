package admin.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import admin.model.CouponDao;

@Controller
public class AdminMainController {

	private final String command="/main.admin";
	private final String getPage="AdminMain";
	
	@Autowired
	CouponDao couponDao;
	
	@RequestMapping(value=command)
	public ModelAndView doAction(ModelAndView mav) {
		
		mav.setViewName(getPage);
		return mav;
	}
	
}
