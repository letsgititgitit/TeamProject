package event.controller;


import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class EventController {
	private final String command = "/event.ev";
	private final String gotoPage = "event";
	
	@RequestMapping(value=command)
	public String doAction() {
		return gotoPage;
	}
	
	
	
}
