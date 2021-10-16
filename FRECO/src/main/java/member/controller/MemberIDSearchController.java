package member.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.catalina.connector.Response;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import member.model.MemberBean;
import member.model.MemberDao;

@Controller
public class MemberIDSearchController {

	private final String command = "/IDSearchForm.me";
	private final String getPage = "memberIDSearchForm";
	private final String gotoPage = "memberIDCheckForm";
	
	@Autowired
	MemberDao memberDao;
	
	//로그인 폼에서 아이디 찾기 클리
	@RequestMapping(value=command,method=RequestMethod.GET)
	public String doActionGet() {
		
		return getPage;
	}
	
	//아이디 찾기(submit)
	@RequestMapping(value=command,method=RequestMethod.POST)
	public String doActionPost(MemberBean memberBean, HttpServletResponse response,HttpSession session,Model model) throws IOException {

		System.out.println("memberBean.getMNAME(): " + memberBean.getMNAME());
		System.out.println("memberBean.getMPHONE(): " + memberBean.getMPHONE());
		
		MemberBean dbMember = memberDao.searchId(memberBean.getMPHONE());
		System.out.println("dbMember: " + dbMember);

		PrintWriter pw = response.getWriter();
		response.setContentType("text/html;charset=UTF-8");

		//일치하는 휴대폰 번호가 없으면
		if(dbMember == null) {
			System.out.println("회원이 아닙니다");
			pw.println("<script>alert('가입이력이 없는 휴대폰 번호입니다');</script>");
			pw.flush();
			return getPage; 
		}
		
		//일치하는 휴대폰 번호가 있으면
		else {
			System.out.println("회원입니다");
			// MPHONE O, MNAME X
			if(!memberBean.getMNAME().equals(dbMember.getMNAME()) ) { 
					pw.println("<script>alert('이름이 일치하지 않습니다');</script>");
					pw.flush();
					return getPage;
				}

			//MPHONE O,MNAME O	
			else{ 
				
				model.addAttribute("dbMember", dbMember);
				return gotoPage;

				}
			
		}//else
	
	}//post
		
}//전체	
	
	
	

	

