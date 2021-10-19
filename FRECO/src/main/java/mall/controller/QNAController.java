package mall.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import mall.model.QNABean;
import mall.model.QNADao;
import utility.Paging;

@Controller
public class QNAController {
	
	private final String command = "/qna.mall";
	private final String getPage = "qna";
	
	@Autowired
	QNADao qdao;
	
	@RequestMapping(value=command)
	public ModelAndView doAction(HttpSession session, ModelAndView mav, HttpServletRequest request,
			@RequestParam(value="whatColumn", required = false) String whatColumn, 
			@RequestParam(value="keyword", required = false) String keyword, 	
			@RequestParam(value="pageNumber", required = false) String pageNumber) {
		
		System.out.println(" ----- QNA Controller ---- ");
		
		//로그인 X
		if(session.getAttribute("loginInfo") == null) {
			session.setAttribute("destination", "redirect:/mypageOrderList.mp");
			mav.setViewName("redirect:/login.me");
			return mav;
		} 
		//로그인 O
		else {	
			int pageSize = 5;			
			if(pageNumber == null){
				pageNumber = "1";  //어느 페이지부터 보이게 할것인지 지정
			}			
			
			int currentPage = Integer.parseInt(pageNumber);
			int startRow = (currentPage - 1) * pageSize + 1;  // 시작하는 행번호
			int endRow = currentPage * pageSize; // 끝나는 행번호 
			int count = 0;  // 레코드 갯수
			int number = 0;  //화면에 보여줄 번호
/*
			List<QNABean> Qlists = null;
			Map<Integer,Integer> map2 = new HashMap<Integer,Integer>();
			map2.put(startRow, startRow) ;
			map2.put(endRow, endRow);
			
			
			if(count > 0){
				Qlists = qdao.getArticles(map2);  // 답글쓰기 
		 	}		 	
*/
			count = qdao.getArticleCount(); 
			System.out.println("count : " + count);
			number= count-(currentPage-1) * pageSize;
			System.out.println("number : " + number);
			
			Map<String,String> map = new HashMap<String,String>();
			map.put("whatColumn", whatColumn);  
			map.put("keyword", "%"+keyword+"%");
			
			int totalCount = qdao.getTotalCount(map);
			String url = request.getContextPath() + command;
			
			Paging pageInfo = new Paging(pageNumber, null, totalCount, url, whatColumn, keyword, null);
			
			List<QNABean> lists = qdao.getQNAList(pageInfo, map);
			System.out.println("lists 갯수 : " + lists.size());
			
			mav.addObject("lists", lists);
			mav.addObject("count", count);
			mav.addObject("pageInfo", pageInfo);
			
			mav.setViewName(getPage);
			
			return mav;				
		}

	}	
}
