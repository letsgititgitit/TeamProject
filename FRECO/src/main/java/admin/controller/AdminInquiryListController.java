package admin.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class AdminInquiryListController {

	private final String command="/inquiry.admin";
	private final String getPage="AdminInquiryList";
	
	@RequestMapping(value=command)
	public String doAction() {
		return getPage;
	}
}
