package member.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import member.model.MemberBean;
import member.model.MemberDao;

@Controller
public class MemberPWSearchController {

	private final String command = "/PWSearchForm.me";
	private final String getPage = "memberPWSearchForm";
	private final String gotoPage = "memberPWCheckForm";
	
	
	@Autowired
	MemberDao memberDao;
	
	@RequestMapping(value=command,method=RequestMethod.GET)
	public String doActionGet() {
		
		return getPage;
	}
	
	//아이디 찾기(submit)
	@RequestMapping(value=command,method=RequestMethod.POST)
	public String doActionPost(MemberBean memberBean, HttpServletResponse response,Model model) throws IOException {
		
		System.out.println("memberBean.getMNAME(): " + memberBean.getMID());
		System.out.println("memberBean.getMNAME(): " + memberBean.getMNAME());
		System.out.println("memberBean.getMPHONE(): " + memberBean.getMPHONE());
		
		MemberBean dbMember = memberDao.getData(memberBean.getMID());
		System.out.println("dbMember: " + dbMember);

		PrintWriter pw = response.getWriter();
		response.setContentType("text/html;charset=UTF-8");

		//일치하는 아이디 없으면
		if(dbMember == null) {
			System.out.println("회원이 아닙니다");
			pw.println("<script>alert('입력하신 아이디는 유효하지 않습니다');</script>");
			pw.flush();
			return getPage; 
		}
		//일치하는 아이디 있으면
		else {
			System.out.println("회원입니다");
			
			// MNAME O 
				// MPHONE O
			if(memberBean.getMNAME().equals(dbMember.getMNAME()) ) {
				if(memberBean.getMPHONE().equals(dbMember.getMPHONE())) {
					model.addAttribute("dbMember", dbMember);
					return gotoPage;
				}
				//MPHONE X
				else {
					pw.println("<script>alert('휴대폰 번호가 일치하지 않습니다');</script>");
					pw.flush();
					return getPage; 	
				}
			}
			// MNAME X
			else {
				if(memberBean.getMPHONE().equals(dbMember.getMPHONE())) {
					pw.println("<script>alert('이름이 일치하지 않습니다');</script>");
					pw.flush();					
					return getPage;
				}
				else{
					pw.println("<script>alert('입력하신 정보를 다시 확인해주세요');</script>");
					pw.flush();					
					return getPage;
				}
			}

		}//else
	
	}//post
	
	
}
