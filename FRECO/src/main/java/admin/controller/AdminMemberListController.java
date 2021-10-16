package admin.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class AdminMemberListController {

	private final String command="/memberList.admin";
	private final String getPage="AdminMemberList";
	
	@RequestMapping(value=command)
	public ModelAndView doAction(ModelAndView mav) {
		
		//멤버 테이블을 만들어야 되네.. 아나..
		mav.setViewName(getPage);
		return mav;
	}
	
}
