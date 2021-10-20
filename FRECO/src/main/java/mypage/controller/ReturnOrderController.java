package mypage.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import order.model.OrderBean;
import order.model.OrderDao;

@Controller
public class ReturnOrderController {

	private final String command = "/orderReturn.mp";
	private final String gotoPage = "redirect:/mypageOrderList.mp";
	
	@Autowired
	private OrderDao ODao;
	
	@RequestMapping(value=command, method=RequestMethod.GET)
	public ModelAndView doAction(
			@RequestParam(value="pageNumber", required = false) String pageNumber,
			@RequestParam(value="OINVOICE") int OINVOICE,
			HttpSession session, 
			ModelAndView mav) {
		
		System.out.println();
		System.out.println("<반품 요청>");
		System.out.println("수정될 OINVOICE: " + OINVOICE);
		
		ODao.updateInfo(OINVOICE);
		OrderBean obean = ODao.oneSelect(OINVOICE);
		System.out.println("환불 요청(NO): "+obean.getOREFUND());
		
		mav.addObject("pageNumber", pageNumber);
		mav.setViewName(gotoPage);
		return mav;
	}
	
}
