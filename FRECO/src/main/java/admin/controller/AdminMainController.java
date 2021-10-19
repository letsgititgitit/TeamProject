package admin.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import mall.model.QNADao;
import order.model.OrderBean;
import order.model.OrderDao;

@Controller
public class AdminMainController {

	private final String command="/main.admin";
	private final String getPage="AdminMain";

	
	@Autowired
	OrderDao orderDao;
	
	@Autowired
	QNADao QnaDao;
	
	@RequestMapping(value=command)
	public ModelAndView doAction(ModelAndView mav) {
			
		List<OrderBean> orderlist = orderDao.getAllList();
		mav.addObject("orderlist", orderlist);
		
		int sysorder = orderDao.getOrderBySysdate();
		mav.addObject("sysorder", sysorder);
		
		int refundcnt = orderDao.getRefundCount();
		mav.addObject("refundcnt", refundcnt);
		
		int ordercnt = orderDao.getCount();
		mav.addObject("ordercnt", ordercnt);	
		
		int admincnt = QnaDao.getAdminCnt();
		mav.addObject("admincnt", admincnt);
		
		int adminrecnt = QnaDao.getAdminReCnt();
		mav.addObject("adminrecnt", adminrecnt);
		
		int day7cnt = orderDao.day7cnt();
		int day6cnt = orderDao.day6cnt();
		int day5cnt = orderDao.day5cnt();
		int day4cnt = orderDao.day5cnt();
		int day3cnt = orderDao.day3cnt();
		int day2cnt = orderDao.day2cnt();
		int day1cnt = orderDao.day1cnt(); 
				
		mav.addObject("day7cnt", day7cnt);
		mav.addObject("day6cnt", day6cnt);
		mav.addObject("day5cnt", day5cnt);
		mav.addObject("day4cnt", day4cnt);
		mav.addObject("day3cnt", day3cnt);
		mav.addObject("day2cnt", day2cnt);
		mav.addObject("day1cnt", day1cnt);
		
		mav.setViewName(getPage);
		return mav;
	}
	
}
