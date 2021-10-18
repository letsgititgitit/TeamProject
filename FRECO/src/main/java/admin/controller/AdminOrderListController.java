package admin.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import order.model.OrderBean;
import order.model.OrderDao;

@Controller
public class AdminOrderListController {

	private final String command="/order.admin";
	private final String getPage="AdminOrderList";
	
	@Autowired
	OrderDao orderDao;
	
	@RequestMapping(value=command)
	public ModelAndView doAction(ModelAndView mav) {
		
		List<OrderBean> orderlist = orderDao.getAllList();
		int refundcnt = orderDao.getRefundCount();
		
		mav.addObject("orderlist", orderlist);
		mav.addObject("refundcnt", refundcnt);
		mav.setViewName(getPage);
		return mav;
	}
	
	@RequestMapping(value=command,method=RequestMethod.POST)
	public ModelAndView doAction2(ModelAndView mav) {
		
		List<OrderBean> refundlist = orderDao.getRefundList();
		int refundcnt = orderDao.getRefundCount();
		
		mav.addObject("orderlist", refundlist);
		mav.addObject("refundcnt", refundcnt);
		mav.setViewName(getPage);
		return mav;
	}
}
