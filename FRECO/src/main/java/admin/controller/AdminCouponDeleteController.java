package admin.controller;

import java.io.File;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import admin.model.Coupon;
import admin.model.CouponDao;

@Controller
public class AdminCouponDeleteController {

	private final String command="/cdelete.admin";
	private final String gotoPage="redirect:/clist.admin";
	
	@Autowired
	CouponDao couponDao;
	
	@Autowired
	ServletContext servletContext;
	
	@RequestMapping(value=command)
	public String doAction(@RequestParam("CNUM") int CNUM) {
		/*
		Coupon coupon = couponDao.oneData(CNUM);
		
		String delPath = servletContext.getRealPath("/img/coupon");
		File delFile = new File(delPath+"\\"+coupon.getCIMG());
		
		delFile.delete();
		*/
		couponDao.deleteData(CNUM);
		
		return gotoPage;
	}
	
	
}
