package mall.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.view.RedirectView;

import mall.cart.CartList;


@Controller
public class CartDeleteController {

	private final String command="/cartdel.mall";
	private final String gotoPage="redirect:/cartlist.mall";
	
	
	@RequestMapping(value=command)
	public String doAction(@RequestParam("PNUM")int PNUM,
							RedirectView view,HttpSession session) {
			
		CartList cart = (CartList)session.getAttribute("cart");
		cart.cartDelete(PNUM);
		
		
		return gotoPage;
	}
	
}
