package mall.cart;

import java.util.ArrayList;
import java.util.HashMap;
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

import admin.model.Coupon;
import admin.model.CouponDao;
import member.model.MemberBean;
import member.model.MemberDao;
import order.model.OrderBean;
import order.model.OrderDao;
import order.model.OrderDetailBean;
import order.model.OrderDetailDao;
import product.model.ProductBean;
import product.model.ProductDao;

@Controller
public class PaymentController {
	private final String command = "/payment.mall";
	private final String paymentPage = "paymentPage";
	private final String gotoPage = "redirect:/mypageOrderList.mp";
	
	@Autowired
	private MemberDao MDao;
	
	@Autowired
	private ProductDao PDao;
	
	@Autowired
	private OrderDao ODao;
	
	@Autowired
	private OrderDetailDao ODDao;
	
	@Autowired
	private CouponDao CDao;
	
	@RequestMapping(value=command, method=RequestMethod.GET)
	public ModelAndView doAction(
			HttpSession session,
			ModelAndView mav) {
		
		System.out.println("<결제 page요청>");
		
		CartList cart = (CartList)session.getAttribute("cart");
		
		Map<Integer,Integer> cartlists = cart.getAllList();  //상품번호, 수량 
		Set<Integer> productInfo = cartlists.keySet();  	 //상품 번호(key만 가져오겠다)
		
		List<CartInfo> cartList = new ArrayList<CartInfo>(); //CartInfo를 하나하나 cartList에 담겠다.
		
		int totalPrice=0;
		int totalPoint=0;
		
		for(Integer PNUM : productInfo) {
			ProductBean productbean = PDao.getSelectNum(String.valueOf(PNUM));
				System.out.println("productbean.getPSUBCATEGORY():"+productbean.getPSUBCATEGORY());
				System.out.println("productbean.getPIMG1():"+productbean.getPIMG1());
			Integer ORDERPQTY = cartlists.get(PNUM);  //해당 번호상품의 주문수량 = ORDERPQTY
			
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
			
			mav.addObject("totalPrice", totalPrice);
			mav.addObject("totalPoint", totalPoint);
		}
		mav.addObject("cartList", cartList);
		
		MemberBean mbean = (MemberBean) session.getAttribute("loginInfo");
			System.out.println("로그인한 id: "+ mbean.getMID());
			System.out.println("로그인한 id 쿠폰: "+ mbean.getMCOUPON());
			System.out.println("로그인한 id 포인트: "+ mbean.getMPOINT());
		
		int CNUM = mbean.getMCOUPON();
		int MPOINT = mbean.getMPOINT();

		if(CNUM != 0) { //쿠폰이 있으면
			Coupon cbean = CDao.oneData(CNUM);  
			mav.addObject("MCouponName", cbean.getCNAME()); //쿠폰의 이름 들어감
			mav.addObject("MCOUPON", cbean.getCPRICE());    //쿠폰의 적용 가격들어감    
		}
		else {  //쿠폰이 없으면
			mav.addObject("MCouponName", "쿠폰 없음");
			mav.addObject("MCOUPON", 0);
		}
		
		mav.addObject("MPOINT", MPOINT);
		
		mav.setViewName(paymentPage);
		return mav;
	}
	
	@RequestMapping(value=command, method=RequestMethod.POST)
	public ModelAndView doActionPayment(
			@RequestParam(value="useCoupon", required = false) int useCoupon,
			@RequestParam(value="useMPOINT", required = false) int useMPOINT,
			@RequestParam(value="totalPaymentPoint") int totalPaymentPoint,
			@RequestParam(value="totalPaymentPrice") int totalPaymentPrice,
			HttpSession session, 
			ModelAndView mav) {
		
		System.out.println("<결제 요청>");
		System.out.println("useCoupon: " + useCoupon);
		System.out.println("useMPOINT: " + useMPOINT);
		System.out.println("totalPaymentPoint: " + totalPaymentPoint);
		System.out.println("totalPaymentPrice: " + totalPaymentPrice);
		
		//로그인정보 확인
		MemberBean mbean = (MemberBean) session.getAttribute("loginInfo");
			System.out.println("로그인한 num: "+ mbean.getMNUM());
			System.out.println("로그인한 id: "+ mbean.getMID());
			System.out.println("쿠폰: "+mbean.getMCOUPON());	
		MDao.mpointMinus(mbean.getMID(), useMPOINT); 		       //구매자 보유  POINT를 해당 useMPOINT 만큼 -
		MDao.mpointPlus(mbean.getMID(), totalPaymentPoint);        //구매자 보유  POINT를 해당 AMOUNTPOINT 만큼 +
		
		//쿠폰을 사용했다면 - 사용자의 쿠폰 삭제하기
		if(useCoupon != 0) { 
			int resetCoupon =0;
			MDao.updateMcoupon(mbean.getMNUM(), resetCoupon); 	
			
			MemberBean dbMember = MDao.getData(mbean.getMID());
			session.setAttribute("loginInfo", dbMember);
			
			MemberBean rembean = (MemberBean) session.getAttribute("loginInfo");
			
			System.out.println("로그인한 num: "+ rembean.getMNUM());
			System.out.println("쿠폰사용했다면 쿠폰 0으로: "+rembean.getMCOUPON());
		}
		
		//장바구니에 담았던 내용 가져오기
		CartList cart = (CartList)session.getAttribute("cart"); 
		Map<Integer,Integer> cartlists = cart.getAllList();  
		
		Set<Integer> keylists = cartlists.keySet();
		
		//송장만들기
		OrderBean obean = new OrderBean();
		obean.setOMID(mbean.getMID());
		obean.setOUSECOUPON(useCoupon);
		obean.setOUSEPOINT(useMPOINT);
		ODao.insertData(obean);
		
		int maxOINVOICE = ODao.getMaxOrderOINVOICE();
			System.out.println("maxOINVOICE: "+ maxOINVOICE);
		
		//송장에 해당하는 주문 상품-수량 디테일에 입력
		for(Integer key : keylists) {
			Integer value = cartlists.get(key);    
	
			PDao.stockDecrease(key, value);  //결제 : 해당상품 수량감소
			
			OrderDetailBean odBean = new OrderDetailBean();
			odBean.setODOINVOICE(maxOINVOICE);
			odBean.setODPNUM(key);
			odBean.setODQTY(value);
			
			ODDao.insertData(odBean);
		}	
		session.removeAttribute("cart");
		
		mav.setViewName(gotoPage);
		
		return mav;
	}
	
}
