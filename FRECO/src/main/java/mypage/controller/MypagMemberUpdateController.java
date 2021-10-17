package mypage.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


@Controller
public class MypagMemberUpdateController {

	private final String command = "mypageMemberUpdate.mp";
	private final String getPage = "mypageMemberUpdateForm";
	
	
	@RequestMapping(value=command, method=RequestMethod.GET)
	public String doActionGet() {
		
		return getPage;
	}
	
}
