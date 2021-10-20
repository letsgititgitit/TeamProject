package product.controller;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import member.model.MemberBean;
import order.model.OrderDetailDao;
import product.model.ProductBean;
import product.model.ProductDao;
import product.model.ReviewBean;
import product.model.ReviewDao;

@Controller
public class ReviewInsertController {
	
	private final String command = "/reviewinsert.product";
	
	private final String getPage = "ReviewInsertForm";
	private final String gotoPage = "redirect:/pdetail.product";
	
	private final String failPage = "redirect:/reviewinsert.product";
	
	@Autowired
	private ProductDao PDao;
	
	@Autowired
	private ReviewDao RDao;
	
	@Autowired
	private OrderDetailDao ODDao;
	
	@Autowired
	ServletContext servletContext;
	
	@RequestMapping(value=command, method=RequestMethod.GET)
	public ModelAndView doAction(
			@RequestParam(value="PNUM") int PNUM,
			@RequestParam(value="OINVOICE") int OINVOICE,
			HttpSession session, 
			ModelAndView mav) {

		System.out.println();
		System.out.println("<리뷰 INSERT FORM 요청>");
		System.out.println("작성될 OINVOICE: " + OINVOICE);
		System.out.println("작성될 PNUM: " + PNUM);
		
		//로그인정보
		MemberBean mbean = (MemberBean) session.getAttribute("loginInfo");
		String mid = mbean.getMID();
			System.out.println("로그인된 아이디: "+ mid);
			
		//리뷰상품정보	
		ProductBean pbean = PDao.odGetPnum(PNUM);
		
		mav.addObject("mbean", mbean);
		mav.addObject("OINVOICE", OINVOICE);
		mav.addObject("pbean", pbean);
		
		mav.setViewName(getPage);
		return mav;
	}
		
	@RequestMapping(value=command, method=RequestMethod.POST)
	public ModelAndView doAction2(
			ReviewBean rbean, 
			ModelAndView mav) {
		
		System.out.println();
		System.out.println("<리뷰 INSERT 요청>");
		System.out.println("넘어온 id : " + rbean.getRID());
		System.out.println("넘어온 별점 : " + rbean.getRRATING());
		System.out.println("넘어온 이미지 : " + rbean.getUploadRIMG());
		
		
		if(rbean.getRIMG().equals("") == false) { //false라면 (이미지를 추가한것)
			System.out.println("getRealPath(/): "+ servletContext.getRealPath("/resources"));
			String uploadPath =  servletContext.getRealPath("/resources"); 
			System.out.println(rbean.getRIMG());
			
			String RREPLY = "답글대기";
			rbean.setRREPLY(RREPLY);
			
			int cnt = -1;
			cnt = RDao.insertDataWithImg(rbean);
			
			MultipartFile multi = rbean.getUploadRIMG();
			
			if(cnt != -1) {
				System.out.println("이미지삽입성공");
				
				mav.addObject("PNUM", rbean.getRSUBJECT());
				mav.setViewName(gotoPage); //pnum만 챙겨가면 됨
				
				File destination = new File(uploadPath+"\\"+ rbean.getRIMG());
				try { 
					multi.transferTo(destination);
				} catch (IllegalStateException e) {
					e.printStackTrace();
				} catch (IOException e) {
					e.printStackTrace();
				}
				
				System.out.println("RIMG : " + rbean.getRIMG());
				
				//리뷰작성시 -> 리뷰여부 update하기 
				Map<String,Integer> map = new HashMap<String,Integer>();
				map.put("ODOINVOICE", rbean.getRINVOICE());
				map.put("ODPNUM", rbean.getRSUBJECT());
				
				ODDao.updateWhether(map);
				
				return mav;
			}
			else {  //삽입에 실패했다면
				System.out.println("이미지삽입실패");
				
				mav.addObject("PNUM", rbean.getRSUBJECT());
				mav.addObject("OINVOICE", rbean.getRINVOICE());
				mav.setViewName(failPage);
				return mav;
			}
			
		}//
		else { //true라면 (이미지를 추가하지 않았다면)
			String RREPLY = "답글대기";
			rbean.setRREPLY(RREPLY);
			
			int cnt = -1;
			cnt = RDao.insertData(rbean);
			
			if(cnt != -1) {
				System.out.println("이미지 없는 / 리뷰작성 성공");
				
				//리뷰작성시 -> 리뷰여부 update하기 
				Map<String,Integer> map = new HashMap<String,Integer>();
				map.put("ODOINVOICE", rbean.getRINVOICE());
				map.put("ODPNUM", rbean.getRSUBJECT());
				
				ODDao.updateWhether(map);
				
				mav.addObject("PNUM", rbean.getRSUBJECT());
				mav.setViewName(gotoPage); 
				
				mav.setViewName(gotoPage);
				return mav;
			}
			else {
				System.out.println("이미지 없는 / 리뷰작성 실패");
				
				mav.addObject("PNUM", rbean.getRSUBJECT());
				mav.addObject("OINVOICE", rbean.getRINVOICE());
				
				mav.setViewName(failPage);
				return mav;
			}
		}//
		
	}
}
