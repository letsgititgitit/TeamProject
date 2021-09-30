package mall.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MallMainController {
	private final String command = "/main.mall";
	private final String gotoPage = "main";
	
	@RequestMapping(value=command)
	public String doAction() {
		
		return gotoPage;
	}
}
