package info.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class InfoController {
	private final String command = "/info.in";
	private final String gotoPage = "info";
	
	@RequestMapping(value=command)
	public String doAction(HttpSession session) {
		session.getAttribute("loginInfo");
		System.out.println("loginInfo뭐나오나: " + session.getAttribute("loginInfo"));
		return gotoPage;
	}
	
	
	
}
