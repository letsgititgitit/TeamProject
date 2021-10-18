package admin.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class AdminOrderDetailController {

	private final String command="/orderDetail.admin";
	private final String getPage="AdminOrderDetail";
	
	@RequestMapping(value=command)
	public ModelAndView doAction(@RequestParam(value="OINVOICE") int OINVOICE,
							ModelAndView mav) {
		
		mav.addObject("OINVOICE", OINVOICE);
		mav.setViewName(getPage);
		return mav;
	}
	
}
