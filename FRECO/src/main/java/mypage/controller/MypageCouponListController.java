package mypage.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import member.model.MemberDao;

@Controller
public class MypageCouponListController {

	private final String command = "mypageCouponList.mp";
	private final String getPage = "mypageCouponList";
		
	
	@RequestMapping(value=command, method=RequestMethod.GET)
	public String doActionGet() {
		
		return getPage;
	}
	
	
}
