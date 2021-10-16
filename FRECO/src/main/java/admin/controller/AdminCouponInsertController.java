package admin.controller;

import java.io.File;
import java.io.IOException;

import javax.servlet.ServletContext;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import admin.model.Coupon;
import admin.model.CouponDao;

@Controller
public class AdminCouponInsertController {

	private final String command="/cinsert.admin";
	private final String getPage="AdminCouponInsert";
	private final String gotoPage="redirect:/clist.admin";
	
	@Autowired
	CouponDao couponDao;
	
	@Autowired
	ServletContext servletContext;
	
	@RequestMapping(value=command,method=RequestMethod.GET)
	public String doAction() {
		return getPage;
	}
	
	@RequestMapping(value=command,method=RequestMethod.POST)
	public ModelAndView doAction(@Valid Coupon coupon, BindingResult result) {
		
		String uploadPath = servletContext.getRealPath("/img/coupon");
		
		ModelAndView mav = new ModelAndView();
		
		
		if(result.hasErrors()) {
			mav.setViewName(getPage);
			return mav;
		}
		
		
		int cnt = -1;
		cnt = couponDao.insertCoupon(coupon);

		if(cnt != -1) {
			
		couponDao.insertMemberByCoupon();
			
		/*
		MultipartFile multi = coupon.getUPLOAD();
		File destination = new File(uploadPath+"//"+coupon.getCIMG());
		try {
			multi.transferTo(destination);
		} catch (IllegalStateException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		*/
		
		mav.setViewName(gotoPage);
		return mav;
		}
		
		else {
			mav.setViewName(getPage);
			return mav;
		}
		
		
		
	}
	
}
