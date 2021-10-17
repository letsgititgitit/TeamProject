package event.controller;


import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class EventController {
	private final String command = "/event.ev";
	private final String getPage = "event";
	
	
	@RequestMapping(value=command)
	public String doAction() {
		return getPage;
	}
	
	@RequestMapping(value="eventToMypage.ev", method=RequestMethod.GET)
	public ModelAndView doAction2(HttpSession session,ModelAndView mav) {

		//로그인 X
		if(session.getAttribute("loginInfo")==null) {
			session.setAttribute("destination", "redirect:/mypageOrderList.mp");
			mav.setViewName("redirect:/login.me");
			return mav;
		}
		//로그인 O
		else {
				mav.setViewName(getPage);
				return mav;
			
		}
	
	}
	
}
