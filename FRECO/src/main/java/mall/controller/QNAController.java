package mall.controller;

import java.util.ArrayList;
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
	private final String gotoPage = "qna";
	
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
/*			
			int pageSize = 10;
			
			if(pageNumber == 0){
				pageNumber = 1;  //어느 페이지부터 보이게 할것인지 지정
			}
			
			int currentPage = pageNumber;  //내가 클릭한 페이지번호
			int startRow = (currentPage - 1) * pageSize + 1;  // 시작하는 행번호 : 1 11 21
			int endRow = currentPage * pageSize; // 끝나는 행번호 : 10 20 30
			int count = 0;
			int number = 0;  //화면에 보여줄 번호
			
			List<QNABean> Qlist = null;
			count = qdao.getArticleCount();
			System.out.println("레코드갯수 count:" + count);
			if(count > 0){
				Qlist = qdao.getArticles(startRow, endRow);  // 답글쓰기 
		 	}
			number= count-(currentPage-1) * pageSize;
*/			
			int width = 0;
			
			Map<String,String> map = new HashMap<String,String>();
			map.put("whatColumn", whatColumn);  
			map.put("keyword", "%"+keyword+"%");
			
			int totalCount = qdao.getTotalCount(map);
			String url = request.getContextPath() + command;
			
			Paging pageInfo = new Paging(pageNumber, null, totalCount, url, whatColumn, keyword, null);
			
			List<QNABean> lists = qdao.getQNAList(pageInfo, map);
			System.out.println("lists 갯수 : " + lists.size());
			
			mav.addObject("lists", lists);
			mav.addObject("pageInfo", pageInfo);
			mav.addObject("width", width);
			
			mav.setViewName(gotoPage);
			
			return mav;				
		}

	}	
}
