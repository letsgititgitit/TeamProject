package admin.controller;



import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import member.model.MemberBean;
import member.model.MemberDao;

@Controller
public class AdminMemberListController {

	private final String command="/memberList.admin";
	private final String getPage="AdminMemberList";
	
	@Autowired
	
	MemberDao memberDao;
	
	@RequestMapping(value=command)
	public ModelAndView doAction(ModelAndView mav) {
		
		List<MemberBean> memlist = memberDao.getAllList();
		
		mav.addObject("memlist", memlist);
		
		mav.setViewName(getPage);
		return mav;
	}
	
}
