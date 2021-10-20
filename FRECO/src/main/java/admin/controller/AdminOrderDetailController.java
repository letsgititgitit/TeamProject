package admin.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import order.model.AdminOrderBean;
import order.model.OrderDao;

@Controller
public class AdminOrderDetailController {

	private final String command="/orderDetail.admin";
	private final String getPage="AdminOrderDetail";
	
	@Autowired
	OrderDao orderDao;
	
	@RequestMapping(value=command)
	public ModelAndView doAction(@RequestParam(value="OINVOICE") int OINVOICE,
								@RequestParam(value="OMID") String OMID,
							ModelAndView mav) {
		
		List<AdminOrderBean> olist = orderDao.getAdminOrderList(OINVOICE);

		String id="";
		String name="";
		String adress1="";
		String adress2="";
		String adress3="";
		String arefund="";
		int ausecoupon=0;
		int ausepoint=0;
		int apoin=0;
		
		int TotalPrice=0;
		
		for(AdminOrderBean bean : olist) {
			id = bean.getAID();
			name = bean.getAMNAME();
			adress1 = bean.getADRESS1();
			adress2 = bean.getADRESS2();
			adress3 = bean.getADRESS3();
			arefund = bean.getAREFUND();
			ausecoupon = bean.getAUSECOUPON();
			ausepoint = bean.getAUSEPOINT();
			apoin = bean.getAPOINT();
			TotalPrice += bean.getAMOUNT();
		}
		
		int FinalPrice=-1;
		FinalPrice=TotalPrice-(ausepoint+ausecoupon);
		
		mav.addObject("id", id);
		mav.addObject("name", name);
		mav.addObject("adress1", adress1);
		mav.addObject("adress2", adress2);
		mav.addObject("adress3", adress3);
		mav.addObject("AREFUND", arefund);
		mav.addObject("ausecoupon", ausecoupon);
		mav.addObject("ausepoint", ausepoint);
		mav.addObject("apoin", apoin);
		mav.addObject("TotalPrice", TotalPrice);
		mav.addObject("FinalPrice", FinalPrice);
		
		mav.addObject("OINVOICE", OINVOICE);
		mav.addObject("olist", olist);
		mav.setViewName(getPage);
		return mav;
	}
	
}
