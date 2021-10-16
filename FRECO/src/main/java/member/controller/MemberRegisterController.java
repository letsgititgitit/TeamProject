package member.controller;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import member.model.MemberBean;
import member.model.MemberDao;

@Controller
public class MemberRegisterController {

	private final String command = "/registerForm.me";
	private final String getPage = "memberRegisterForm";
	private final String gotoPage = "redirect:/main.mall";
	
	@Autowired
	MemberDao memberDao;
	
	//메인 상단에서 회원가입 눌렀을 때, 로그인폼에서 회원가입 눌렀을 때
	@RequestMapping(value=command,method=RequestMethod.GET)
	public String doActionGet() {
		
		return getPage;
	}
	
	//회원가입 폼에서 회원가입 눌렀을 때(submit)
	@RequestMapping(value=command, method=RequestMethod.POST) 
	public ModelAndView	doActionPost(@Valid MemberBean memberBean,BindingResult result ,ModelAndView mav) {
		
		//회원가입 내용 넘어오는지 체크
		System.out.println("MemberRegisterController POST");
		System.out.println("memberBean: " + memberBean);
		System.out.println("MID:" + memberBean.getMID());
		System.out.println("MPW:" + memberBean.getMPW());
		System.out.println("MBIRTH:" + memberBean.getMBIRTH());
		System.out.println("MPHONE:" + memberBean.getMPHONE());
		System.out.println("MADDRESS1:" + memberBean.getMADDRESS1());
		System.out.println("MADDRESS2:" + memberBean.getMADDRESS2());
		System.out.println("MADDRESS3:" + memberBean.getMADDRESS3());
		
		System.out.println("MNUM:" + memberBean.getMNUM());
		System.out.println("MCOUPON:" + memberBean.getMCOUPON());
		System.out.println("MPOINT:" + memberBean.getMPOINT());
		
		//유효성 검사 체크
		if(result.hasErrors()) {
			mav.setViewName(getPage);
			return mav;
		}
		else {
			int cnt = memberDao.insertMember(memberBean);
			System.out.println("cnt"+cnt);
		}
		mav.setViewName(gotoPage);
		return mav;
		

	}
	
	
}
