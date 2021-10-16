package mall.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import mall.cart.CartList;

@Controller
public class CartUpdateController {

	private final String command="/cartupdate.mall";
	private final String getPage="redirect:/cartlist.mall";
	
	@RequestMapping(value=command)
	public String doAction(@RequestParam("PNUM") int PNUM,
							@RequestParam("ORDERPQTY") int ORDERPQTY,
							HttpSession session) {
		//System.out.println("======카트 업데이트 컨트롤PNUM:======="+PNUM);
		//System.out.println("======카트 업데이트 컨트롤ORDERPQTY:======="+ORDERPQTY);
		
		CartList cart = (CartList)session.getAttribute("cart");
		cart.updateCart(PNUM,ORDERPQTY);
		
		return getPage;
	}
	
}
