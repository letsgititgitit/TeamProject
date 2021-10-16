package admin.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class AdminOrderDetailController {

	private final String command="/orderDetail.admin";
	private final String getPage="AdminOrderDetail";
	
	@RequestMapping(value=command)
	public String doAction() {
		return getPage;
	}
	
}
