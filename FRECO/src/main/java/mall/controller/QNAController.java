package mall.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import mall.model.QNABean;
import mall.model.QNADao;

@Controller
public class QNAController {
	
	private final String command = "/qna.mall";
	private final String gotoPage = "qna";
	
	@Autowired
	QNADao qdao;
	
	@RequestMapping(value=command)
	public ModelAndView doAction(HttpSession session, ModelAndView mav) {
		
		System.out.println(" ----- QNA Controller ---- ");
		
		//로그인 X
		if(session.getAttribute("loginInfo") == null) {
			session.setAttribute("destination", "redirect:/mypageOrderList.mp");
			mav.setViewName("redirect:/login.me");
			return mav;
		}
		//로그인 O
		else {			
			List<QNABean> lists = qdao.getQNAList();
			System.out.println("lists 갯수 : " + lists.size());
			
			mav.addObject("lists", lists);
			mav.setViewName(gotoPage);
			
			return mav;				
		}

	}	
}
