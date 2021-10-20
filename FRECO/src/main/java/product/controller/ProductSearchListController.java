package product.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import product.model.ProductBean;
import product.model.ProductDao;
import utility.Paging;

@Controller
public class ProductSearchListController {
	
	private final String command = "listSearh.product";
	private final String getPage = "productList_Search";
	private final String gotoPage = "redirect:/main.mall";
	
	@Autowired
	@Qualifier("myProductDao")
	private ProductDao pdao;
	
	@RequestMapping(value = command)
	public ModelAndView doAction(@RequestParam(value="whatColumn", required = false) String whatColumn, 
			@RequestParam(value="keyword", required = false) String keyword, 	
			@RequestParam(value="pageNumber", required = false) String pageNumber,
			HttpServletRequest request, ModelAndView mav, HttpServletResponse response) throws IOException {
		
		System.out.println("---- ProductSearchListController ----");
		
		Map<String,String> map = new HashMap<String,String>();
		map.put("whatColumn", whatColumn);  
		map.put("keyword", "%"+keyword+"%");
		
		System.out.println("whatColumn : "+ whatColumn);
		System.out.println("keyword : "+ keyword);
		
		if(keyword.equals("")) {
			System.out.println("검색어 입력 안함");
			
			response.setCharacterEncoding("UTF-8"); 
			response.setContentType("text/html; charset=UTF-8");
			
			PrintWriter pw = response.getWriter();
			pw.println("<script>alert('검색어를 입력하세요!');</script>");
			pw.flush(); 
			
			int totalCount = 0;
			List<ProductBean> searchLists = null;
			
			mav.addObject("searchLists", searchLists);
			mav.addObject("totalCount", totalCount);
			mav.setViewName(getPage);
		}
		else {
			System.out.println("검색어 입력 함");
			int totalCount = pdao.getTotalSearchCount(map);
			System.out.println("totalCount : " + totalCount);
			String url = request.getContextPath() + command;
			
			Paging pageInfo = new Paging(pageNumber, null, totalCount, url, whatColumn, keyword, null);
			
			List<ProductBean> searchLists = pdao.getProductSearchList(pageInfo, map);
			System.out.println("searchLists 갯수 : " + searchLists.size() );
			
			mav.addObject("searchLists", searchLists);
			mav.addObject("pageInfo", pageInfo);
			mav.addObject("totalCount", totalCount);
			mav.setViewName(getPage);
		}				
		
		return mav;
	}
	
}


























