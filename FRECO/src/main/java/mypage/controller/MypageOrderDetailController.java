package mypage.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import admin.model.Coupon;
import admin.model.CouponDao;
import order.model.DetailView;
import order.model.OrderBean;
import order.model.OrderDao;
import order.model.OrderDetailBean;
import order.model.OrderDetailDao;
import product.model.ProductBean;
import product.model.ProductDao;

@Controller
public class MypageOrderDetailController {
	private final String command = "/mypageODetailList.mp";
	private final String gotoPage = "mypageODetailList";
	
	@Autowired
	private OrderDao ODao;
	
	@Autowired
	private OrderDetailDao ODDao;
	
	@Autowired
	private ProductDao PDao;
	
	@Autowired
	private CouponDao CDao;
	
	@RequestMapping(value=command, method=RequestMethod.GET)
	public ModelAndView doAction(
			@RequestParam(value="pageNumber", required = false) String pageNumber,
			@RequestParam(value="OINVOICE") int OINVOICE,
			@RequestParam(value="OREFUND") String OREFUND,
			HttpSession session, 
			ModelAndView mav) {
		
		System.out.println("<주문내역 - 상세보기>");
		System.out.println("OINVOICE : "+ OINVOICE);
		System.out.println("OREFUND : "+ OREFUND);
		
		//송장에 해당하는 o정보
		OrderBean obean = ODao.oneSelect(OINVOICE);
		
		System.out.println("쿠폰" + obean.getOUSECOUPON());
		
		int CPRICE = obean.getOUSECOUPON();
		
		if(CPRICE != 0) { //쿠폰통한 결제액이 있으면
			System.out.println("쿠폰적용액"+ CPRICE);
			mav.addObject("couprice", CPRICE);  	//쿠폰적용가격
		}
		else {
			int couprice= 0;
			mav.addObject("couprice", couprice);  	//쿠폰적용가격
		}
		
		//송장에 해당하는 od정보
		List<OrderDetailBean> odblists = ODDao.oneSelect(OINVOICE);  
		
		List<DetailView> dvList = new ArrayList<DetailView>();
		
		int allPrice=0;
		int allPoint=0;
		int i =0;
		
		for(OrderDetailBean ob : odblists) {
			int PNUM = ob.getODPNUM();
			
			//주문내역 상세보기를 위한 상품정보가져오기
			ProductBean pbean = PDao.odGetPnum(PNUM);
			
			System.out.println("==넘어갈 PNUM : "+pbean.getPNUM());
			
			DetailView dv = new DetailView();
			
			i = i+1;
			
			dv.setDvnum(i);
			dv.setDvpimg(pbean.getPIMG1()); //상품 이미지
			dv.setDvpname(pbean.getPNAME()); //상품 이름
			dv.setDvpsubcategory(pbean.getPSUBCATEGORY()); //상품 상세카테고리
			dv.setDvpprice(pbean.getPPRICE()); //상품 단가
			dv.setDvppoint(pbean.getPPOINT()); //상품별 포인트
			dv.setDvoqty(ob.getODQTY()); //주문수량
			dv.setDvodreview(ob.getODREVIEW());  //상품 리뷰여부
			dv.setDvpnum(pbean.getPNUM()); //상품 번호
			
			dvList.add(dv);
			
			allPrice += pbean.getPPRICE()*ob.getODQTY();
			allPoint += pbean.getPPOINT()*ob.getODQTY();
		}
		mav.addObject("OINVOICE", OINVOICE);  	//송장번호
		mav.addObject("OREFUND", OREFUND);  	//환불여부
		
		mav.addObject("dvList", dvList);  		//셀렉한 디테일 리스트

		mav.addObject("allPrice", allPrice);  	//토탈 가격
		mav.addObject("allPoint", allPoint);  	//토탈 적립된 포인트
		
		mav.addObject("obean", obean);  		//사용된 포인트, 쿠폰정보
		mav.addObject("pageNumber", pageNumber);
		
		mav.setViewName(gotoPage);
		return mav;
	}
	
}
