<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="./../common/common.jsp" %> 
<%@include file="./../display/top_header.jsp" %>   
<%@include file="./../display/top.jsp" %>

<!-- memberLoginForm.jsp -->

<br><br>	
<div class="col-lg-12">
	<div class="section-title">
		<h2>로그인</h2>
	</div>
</div>

<form action="login.me" method="post" >
	<p align="center">
		<input class="form-control" name="MID" style="width:300px;height:50px;" type="text" placeholder="아이디를 입력해주세요">
		<input class="form-control" name="MPW" style="width:300px;height:50px;margin-top: 10px;" type="password" placeholder="비밀번호를 입력해주세요">
	</p>	

	<table align="center" style="width:300px;font-size: 8pt;">
		<tr>
			<td align="right"><a href="<%=request.getContextPath()+"/IDSearchForm.me"%>" style="color:black;">아이디찾기</a> | <a href="<%=request.getContextPath()+"/PWSearchForm.me"%>" style="color:black;">비밀번호찾기</a></td>
		</tr>
	</table>
	
	<p align="center">
		<button type="submit" class="btn btn-primary btn-xl text-uppercase" style="background-color: #7fad39;border-color: #7fad39;width: 148px;margin-top: 5px;">로그인</button>
		<button type="button" onclick="location.href='registerForm.me'" class="btn btn-primary btn-xl text-uppercase" style="background-color: #ffffff; border-color: #7fad39; color:#7fad39 ;width: 148px;margin-top: 5px;">회원가입</button>
	</p>
	
	
	
</form> 

<br><br><br><br><br><br>

<%@include file="./../display/bottom.jsp" %>
