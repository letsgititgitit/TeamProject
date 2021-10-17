package admin.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import order.model.OrderBean;
import order.model.OrderDao;

@Controller
public class AdminMainController {

	private final String command="/main.admin";
	private final String getPage="AdminMain";

	
	@Autowired
	OrderDao orderDao;
	
	@RequestMapping(value=command)
	public ModelAndView doAction(ModelAndView mav) {
		
		int ordercnt = orderDao.getCount();
		int refundcnt = orderDao.getRefundCount();
		
		int day7cnt = orderDao.day7cnt();
		int day6cnt = orderDao.day6cnt();
		int day5cnt = orderDao.day5cnt();
		int day4cnt = orderDao.day5cnt();
		int day3cnt = orderDao.day3cnt();
		int day2cnt = orderDao.day2cnt();
		int day1cnt = orderDao.day1cnt(); 
		
		OrderBean day7date = orderDao.day7date();
		OrderBean day6date = orderDao.day6date();
		OrderBean day5date = orderDao.day5date();
		OrderBean day4date = orderDao.day4date();
		OrderBean day3date = orderDao.day3date();
		OrderBean day2date = orderDao.day2date();
		OrderBean day1date = orderDao.day1date();
		
		mav.addObject("ordercnt", ordercnt);
		mav.addObject("refundcnt", refundcnt);
		
		mav.addObject("day7cnt", day7cnt);
		mav.addObject("day6cnt", day6cnt);
		mav.addObject("day5cnt", day5cnt);
		mav.addObject("day4cnt", day4cnt);
		mav.addObject("day3cnt", day3cnt);
		mav.addObject("day2cnt", day2cnt);
		mav.addObject("day1cnt", day1cnt);
		
		mav.addObject("day7date",day7date );
		mav.addObject("day6date",day6date );
		mav.addObject("day5date",day5date );
		mav.addObject("day4date",day4date );
		mav.addObject("day3date",day3date );
		mav.addObject("day2date",day2date );
		mav.addObject("day1date",day1date );
		 
		mav.setViewName(getPage);
		return mav;
	}
	
}
