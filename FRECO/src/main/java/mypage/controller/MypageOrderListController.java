package mypage.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import member.model.MemberBean;
import member.model.MemberDao;

@Controller
public class MypageOrderListController {

	private final String command = "mypageOrderList.mp";
	private final String getPage = "mypageOrderList";
	
	
	//메인페이지에서 마이페이지 아이콘을 클릭했을 경우
	@RequestMapping(value=command, method=RequestMethod.GET)
	public ModelAndView doActionGet(MemberBean memberBean, HttpSession session, ModelAndView mav, MemberDao mdao) {
		//로그인 X
		if(session.getAttribute("loginInfo")==null) {
			session.setAttribute("destination", "redirect:/mypageOrderList.mp");
			mav.setViewName("redirect:/login.me");
			return mav;
		}
		//로그인 O
		else {
			//운영자페이지
			

			
			//이용자페이지
				mav.setViewName(getPage);
				return mav;
			
		}
	}
	
	

}//
