package admin.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class AdminOrderListController {

	private final String command="/order.admin";
	private final String getPage="AdminOrderList";
	
	@RequestMapping(value=command)
	public String doAction() {
		return getPage;
	}
	
	@RequestMapping(value=command,method=RequestMethod.POST)
	public String doAction2() {
		//order 테이블에서 refund이 "환불"인 것만 출력
		return null;
	}
}
