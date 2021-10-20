package product.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import member.model.MemberBean;
import order.model.DetailView;
import product.model.ProductBean;
import product.model.ProductDao;
import product.model.ReviewBean;
import product.model.ReviewDao;
import utility.ReviewPaging;

@Controller
public class ProductDetailController {
	private final String command = "/pdetail.product";
	
	private final String gotoPage = "productDetail";
	
	@Autowired
	@Qualifier("myProductDao")
	private ProductDao PDao;
	
	@Autowired
	@Qualifier("myReviewDao")
	private ReviewDao RDao;
	
	@RequestMapping(value=command)
	public ModelAndView doAction(
			@RequestParam(value="PNUM") String PNUM,
			@RequestParam(value="pageNumber", required = false) String pageNumber,
			HttpServletRequest request,
			HttpSession session,
			ModelAndView mav) {
		
		System.out.println("<상품디테일 요청>");
		System.out.println("넘어온 상품 PNUM: "+PNUM);
		System.out.println("넘어온 pageNumber: "+pageNumber);
		
		//상품디테일요청
		ProductBean pbean = PDao.getSelectNum(PNUM);
		System.out.println("받아온 상품 PNAME: "+ pbean.getPNAME());

		//상품디테일요청 : 해당상품 제외 추천상품 list출력
		Map<String,String> map = new HashMap<String,String>();
		map.put("whatCate", pbean.getPCATEGORY());
		map.put("number", PNUM);
		
		List<ProductBean> withoutPnum = PDao.getWithoutPnum(map);
		
		mav.addObject("pbean", pbean);
		mav.addObject("withoutPnum", withoutPnum);
		
		//상품 리뷰 리스트
		System.out.println("==상품 리뷰 리스트 포함 출력==");
		
			//레코드 총 갯수 구하기
		int totalCount = RDao.getTotalCount(Integer.valueOf(PNUM)); 
		System.out.println("레코드 갯수: "+totalCount );
		
			//페이징처리
		String url = request.getContextPath() + command + "?PNUM="+ PNUM;
		ReviewPaging pageInfo = new ReviewPaging(pageNumber, null, totalCount, url);    
		
			//리스트 불러오기
		List<ReviewBean> relists = RDao.getBoardList(pageInfo , Integer.valueOf(PNUM)); 
		mav.addObject("relists", relists);  
		
		int offset = pageInfo.getOffset();
		System.out.println("offset: "+ offset);
		
		int number = (totalCount - offset)+1 ;
		System.out.println("number: "+ number);
		
		mav.addObject("number", number);  
		mav.addObject("offset", offset); 
		mav.addObject("totalCount", totalCount);  //레코드 갯수
		mav.addObject("pageInfo", pageInfo); 
			
		double sum =0;
		for(ReviewBean rbean : relists) {
			System.out.println("==오류찾기 넘어온 relists는?: "+ rbean.getRNUM());
			System.out.println("별점 :"+ rbean.getRRATING());
			
			sum  += rbean.getRRATING();
			System.out.println("sum :"+ sum);
		}

			//평점평균구하기
		int totalCountRating = RDao.getTotalCountRating(Integer.valueOf(PNUM)); //관리자를 제외한 게시글수
		System.out.println("totalCountRating 관리자를 제외한 게시글수: "+totalCountRating);
		mav.addObject("totalCountRating", totalCountRating);
		
		double average = 0;
		if(totalCountRating != 0) {
			average = sum/totalCountRating;
			System.out.println("평점 평균: " + Math.round(average));
			System.out.println("평점 평균: " + Math.round(average));
		}
		System.out.println("average :"+ Math.round(average));
		mav.addObject("average", Math.round(average)); 
		
			//로그인 세션도 챙겨가기
		MemberBean mbean = (MemberBean) session.getAttribute("loginInfo");
		String OMID = mbean.getMID();
			System.out.println("로그인된 아이디: "+ OMID);
		mav.addObject(OMID);
		
		mav.setViewName(gotoPage);
		return mav;
	}
}
