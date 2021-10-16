<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="./../common/common.jsp" %>
<%@include file="./../display/top_header.jsp" %>       
<%@include file="./../display/top.jsp" %>
<!-- memberIDCheckForm.jsp -->


<br><br>	
<div class="col-lg-12">
	<div class="section-title">
		<h2>아이디 찾기</h2>
	</div>
</div>

<form action="IDSearchForm.me" method="post">
	<p align="center">
		고객님의 아이디는 ${dbMember.MID} 입니다
	</p>	

	<p align="center">
		<button type="button" onclick="location.href='login.me'"class="btn btn-primary btn-xl text-uppercase" style="background-color: #7fad39;border-color: #7fad39;width: 148px;margin-top: 5px;">로그인</button>
		<button type="button" onclick="location.href='PWSearchForm.me'" class="btn btn-primary btn-xl text-uppercase" style="background-color: #ffffff; border-color: #7fad39; color:#7fad39 ;width: 148px;margin-top: 5px;">비밀번호 찾기</button>
	</p>
</form> 




<br><br><br><br><br><br>

<%@include file="./../display/bottom.jsp" %>

