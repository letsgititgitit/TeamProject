package member.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import member.model.MemberBean;
import member.model.MemberDao;

@Controller
public class MemberLoginController {

	private final String command = "login.me";
	private final String getPage = "memberLoginForm";
	
	
	@Autowired
	MemberDao memberDao;
	
	//메인 상단에서 로그인 눌렀을 때
	@RequestMapping(value=command, method=RequestMethod.GET)
	public String doActionGet(HttpServletRequest request) {
		
		return getPage;
	}
	
	//로그인 폼에서 로그인 눌렀을 때(submit): 1. 메인상단 로그인 2. 마이페이지=>로그인
	@RequestMapping(value=command, method=RequestMethod.POST)
	public String doActionPost(MemberBean memberBean, HttpSession session, HttpServletResponse response, HttpServletRequest request) throws IOException{
			
			System.out.println("destination 뭐나오니?" + session.getAttribute("destination"));
			//memberBean MID,MPW 제대로 넘어오는지 확인
			System.out.println("memberBean.getMID(): " + memberBean.getMID());
			System.out.println("memberBean.getMPW(): " + memberBean.getMPW());
			
			//가입한 회원인지 체크(회원정보 없으면 null 출력)
			//입력한 id,pw=>memberBean 안에/ db에 있는 정보는 dbMember안에
			MemberBean dbMember = memberDao.getData(memberBean.getMID());
			System.out.println("LoginController dbMember: " + dbMember);

			//내보내는 데이터 한글 처리
			PrintWriter pw = response.getWriter();
			response.setContentType("text/html;charset=UTF-8");
			
			//회원X
			if(dbMember == null) {
				System.out.println("회원이 아닙니다");
				pw.println("<script>alert('아이디 오류입니다');</script>");
				pw.flush();
				return getPage; 
			}
			//회원O
			else {
				System.out.println("회원입니다");
				
				//MID O, MPW O
				if(memberBean.getMPW().equals(dbMember.getMPW())) { 
					session.setAttribute("loginInfo", dbMember);
					
					//메인에서 로그인
					if((String)session.getAttribute("destination")=="redirect:/list.product") {
						session.setAttribute("1", "redirect:/main.mall");
						return (String)session.getAttribute("1");	
					}
					
					//마이페이지에서 로그인
					else {
						//운영자
						if(memberBean.getMID().equals("ADMIN")) {
							
							//QNA=>로그인
							if(session.getAttribute("destination")=="redirect:/qna.mall") {
								session.setAttribute("2", "redirect:/qna.mall");
							}
							//
							else {
								session.setAttribute("2", "redirect:/mypageOrderList.mp");
							}
						}
						//회원
						else {
							if(session.getAttribute("destination")=="redirect:/qna.mall") {
								session.setAttribute("2", "redirect:/qna.mall");	
							}
							else {
								session.setAttribute("2", "redirect:/mypageOrderList.mp");
							}
							
						}
						return (String)session.getAttribute("2");
					}//else
					
				}
				//MID O, MPW X
				else {
					pw.println("<script>alert('비밀번호 오류입니다');</script>");
					pw.flush();
					return getPage; 
				}
		}
			
	}//post

	
	
	
	
	
}//
