package mall.controller;

import java.util.List;

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
	public ModelAndView doAction(ModelAndView mav) {
		
		System.out.println(" ----- QNA Controller ---- ");
		
		List<QNABean> lists = qdao.getQNAList();
		System.out.println("lists 갯수 : " + lists.size());
		
		mav.addObject("lists", lists);
		mav.setViewName(gotoPage);
		
		return mav;
	}
	
}
