package mypage.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import member.model.MemberBean;
import member.model.MemberDao;
import order.model.OrderBean;
import order.model.OrderDao;
import order.model.OrderDetailDao;
import utility.OrderListPaging;

@Controller
public class MypageOrderListController {

	private final String command = "/mypageOrderList.mp";
	private final String getPage = "mypageOrderList";
	
	@Autowired
	private OrderDao ODao;
	
	@Autowired
	private OrderDetailDao ODDao;
	
	//메인페이지에서 마이페이지 아이콘을 클릭했을 경우
	@RequestMapping(value=command, method=RequestMethod.GET)
	public ModelAndView doActionGet(
			@RequestParam(value="pageNumber", required = false) String pageNumber,
			MemberBean memberBean, 
			HttpSession session, 
			ModelAndView mav, 
			MemberDao mdao,
			HttpServletRequest request) {
		System.out.println();
		
		//로그인 X
		if(session.getAttribute("loginInfo")==null) {
			session.setAttribute("destination", "redirect:/mypageOrderList.mp");
			mav.setViewName("redirect:/login.me");
			return mav;
		}
		//로그인 O
		else {
				System.out.println();
				System.out.println("<마이페이지 - 주문내역 요청>");
				
			MemberBean mbean = (MemberBean) session.getAttribute("loginInfo");
			String OMID = mbean.getMID();
				System.out.println("로그인된 아이디: "+ OMID);
			
			int totalCountOrder = ODao.getTotalCountOrder(OMID);
			String url = request.getContextPath() + command;

			OrderListPaging pageInfo = new OrderListPaging(pageNumber, null, totalCountOrder, url);  
			List<OrderBean> olists = ODao.getOrderList(pageInfo, OMID);   
				
			int offset = pageInfo.getOffset();
			System.out.println("offset: "+ offset);
			
			int number = (totalCountOrder - offset)+1 ;
			System.out.println("number: "+ number);
			
			mav.addObject("number", number);
			
			mav.addObject("olists", olists);
			mav.addObject("pageInfo", pageInfo);
			mav.addObject("pageNumber", pageNumber);
			
			mav.setViewName(getPage);
			return mav;
		}
	}
	
	

}//
