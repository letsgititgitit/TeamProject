package mall.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import mall.cart.CartInfo;
import mall.cart.CartList;
import product.model.ProductBean;
import product.model.ProductDao;

@Controller
public class CartInsertController {
	
	private final String command="/cartAdd.mall";
	private final String gotoPopup="cartPopup";
	/* private final String gotoPage="cartList"; */
	
	@Autowired
	ProductDao productDao;
	
	@RequestMapping(value=command,method=RequestMethod.GET)
	public String doAction(ProductBean product, HttpSession session) {
		System.out.println("카트 상품 번호:"+product.getPNUM());
		System.out.println("카트 상품 이름:"+product.getPNAME());
		System.out.println("카트 주문 상품 수량:"+product.getORDERPQTY());
		
		////////////로그인 관련 넣을 곳/////////////
		
		CartList cart  = (CartList)session.getAttribute("cart");
		
		if(cart == null) {
			cart = new CartList();
		}
		cart.addOrder(product.getPNUM(),product.getORDERPQTY());
		session.setAttribute("cart", cart);
		
		return gotoPopup;
	}

}
	