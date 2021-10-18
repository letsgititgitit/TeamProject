package mall.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import mall.model.FAQBean;
import mall.model.FAQDao;
import utility.Paging;
/*import utility.PagingFAQ;*/

@Controller
public class FAQController {
	
	private final String command = "/faq.mall";
	private final String getPage = "faq";
	
	@Autowired
	FAQDao fdao;
	
	@RequestMapping(value=command)
	public ModelAndView doAction(@RequestParam(value="whatColumn", required = false) String whatColumn, 
								@RequestParam(value="keyword", required = false) String keyword, 	
								@RequestParam(value="pageNumber", required = false) String pageNumber,
								HttpServletRequest request, ModelAndView mav) {
		
		System.out.println(" ----- FAQController ---- ");
		
		Map<String,String> map = new HashMap<String,String>();
		map.put("whatColumn", whatColumn);  
		map.put("keyword", "%"+keyword+"%");
		
		int totalCount = fdao.getTotalCount(map);
		String url = request.getContextPath() + command;
		
		Paging pageInfo = new Paging(pageNumber, null, totalCount, url, whatColumn, keyword, null);
		
		List<FAQBean> lists = fdao.getFAQList(pageInfo, map); 
		System.out.println("lists 갯수 : " + lists.size());
		
		mav.addObject("lists", lists);
		mav.addObject("pageInfo", pageInfo);

		mav.setViewName(getPage);
		
		return mav;
	}
	
}
































