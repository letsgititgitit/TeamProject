package admin.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import member.model.MemberDao;
import order.model.AdminOrderBean;
import order.model.OrderDao;

@Controller
public class AdminRefundController {

	private final String command="/refund.admin";
	private final String gotoPage="redirect:/order.admin";
	
	@Autowired
	MemberDao memberDao;
	
	@Autowired
	OrderDao orderDao;
	
	@RequestMapping(value=command)
	public String doAction(@RequestParam(value="OINVOICE") int OINVOICE,
							AdminOrderBean bean){
		
		memberDao.updateByRefund(bean);		
		orderDao.deleteRefund(OINVOICE);
		
		return gotoPage;

	}	
}
