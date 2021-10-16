package info.controller;


import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class PrivacyController {

	private final String command = "/privacy.in";
	private final String gotoPage = "privacy";
	
	@RequestMapping(value=command)
	public String doAction() {
		
		return gotoPage;
	}
	
}
