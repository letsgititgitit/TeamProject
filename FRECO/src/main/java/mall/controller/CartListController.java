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
import org.springframework.web.servlet.ModelAndView;

import mall.cart.CartInfo;
import mall.cart.CartList;
import product.model.ProductBean;
import product.model.ProductDao;

@Controller
public class CartListController {

	private final String command="/cartlist.mall";
	private final String gotoPage="cartList";
	
	@Autowired
	ProductDao productDao;
	
	@RequestMapping(value=command)
	public ModelAndView doAction(ModelAndView mav,HttpSession session) {
		
		CartList cart = (CartList)session.getAttribute("cart");
		
		if(cart != null) {
			Map<Integer,Integer> cartlists = cart.getAllList();
			
			Set<Integer> productInfo = cartlists.keySet();
			
			//System.out.println("productInfo"+productInfo);
			
			List<CartInfo> cartList = new ArrayList<CartInfo>(); 
			
			int totalPrice=0;
			int totalPoint=0;
			
			for(Integer PNUM : productInfo) {
				
				ProductBean productbean = productDao.getSelectNum(String.valueOf(PNUM));
				System.out.println("productbean.getPSUBCATEGORY():"+productbean.getPSUBCATEGORY());
				System.out.println("productbean.getPIMG1():"+productbean.getPIMG1());
				Integer ORDERPQTY = cartlists.get(PNUM);
				
				CartInfo cartInfo = new CartInfo();
				cartInfo.setPNUM(PNUM);
				cartInfo.setPNAME(productbean.getPNAME());
				cartInfo.setORDERPQTY(ORDERPQTY);
				cartInfo.setPPOINT(productbean.getPPOINT());
				cartInfo.setPPRICE(productbean.getPPRICE());
				cartInfo.setPSUBCATEGORY(productbean.getPSUBCATEGORY());
				cartInfo.setPIMG1(productbean.getPIMG1());
				cartInfo.setAMOUNTPOINT(ORDERPQTY*productbean.getPPOINT());
				cartInfo.setAMOUNTPRICE(ORDERPQTY*productbean.getPPRICE());
				
				cartList.add(cartInfo);
				totalPrice += ORDERPQTY*productbean.getPPRICE();
				totalPoint += ORDERPQTY*productbean.getPPOINT();
			}
			
			mav.addObject("cartList", cartList);
			mav.addObject("totalPrice", totalPrice);
			mav.addObject("totalPoint", totalPoint);
			
			mav.setViewName(gotoPage);

			
			
		}  
		else {
			mav.setViewName(gotoPage);
		}
		return mav;
	
	}
}
