package mypage.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import member.model.MemberDao;

@Controller
public class MypageWriteListController {

	private final String command = "mypageWriteList.mp";
	private final String getPage = "mypageWriteList";
	
	
	@RequestMapping(value=command, method=RequestMethod.GET)
	public String doActionGet() {
		
		return getPage;
	}
	
}
