package info.controller;


import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class TermsController {

	private final String command = "/terms.in";
	private final String gotoPage = "terms";
	
	@RequestMapping(value=command)
	public String doAction() {
		
		return gotoPage;
	}
	
}
