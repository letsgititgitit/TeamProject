package admin.controller;

import java.io.File;
import java.io.IOException;

import javax.servlet.ServletContext;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import admin.model.Coupon;
import admin.model.CouponDao;

@Controller
public class AdminCouponUpdateController {

	private final String command="/cupdate.admin";
	private final String getPage="AdminCouponUpdate";
	private final String gotoPage="redirect:/clist.admin";
	
	@Autowired
	CouponDao couponDao;
	
	@Autowired
	ServletContext servletContext;
	
	@RequestMapping(value=command,method=RequestMethod.GET)
	public ModelAndView doAction(@RequestParam("CNUM") int CNUM,
							ModelAndView mav) {
		
		Coupon coupon = couponDao.oneData(CNUM);
		
		mav.addObject("coupon", coupon);
		mav.setViewName(getPage);
		return mav;
	}
	
	@RequestMapping(value=command,method=RequestMethod.POST)
	public ModelAndView doAction(@Valid Coupon coupon, BindingResult result) {
		
		
		ModelAndView mav = new ModelAndView();
		
		if(result.hasErrors()) {					
			mav.setViewName(getPage);
			return mav;
		}
		
		
		int cnt = -1;
		cnt = couponDao.updateData(coupon);
		System.out.println("cnt="+cnt);
		/*
		if(cnt != -1) {
			if(coupon.getCIMG()!=null && !coupon.getCIMG().equals("")) {
			
				String dataPath = servletContext.getRealPath("/img/coupon");
				File delFile = new File(dataPath+ File.separator +coupon.getUPLOADOLD());
				delFile.delete();
				
				MultipartFile multi = coupon.getUPLOAD();
				File uploadFile = new File(dataPath+"\\"+coupon.getCIMG());
				try {
					multi.transferTo(uploadFile);
				} catch (IllegalStateException e) {
					e.printStackTrace();
				} catch (IOException e) {
					e.printStackTrace();
				}
				
				mav.setViewName(gotoPage);
			}else {
				mav.setViewName(gotoPage);
			}
						
		}
		else {
			mav.setViewName(getPage);
		}
		*/	
		mav.setViewName(gotoPage);
		return mav;
	}
	
	
}
