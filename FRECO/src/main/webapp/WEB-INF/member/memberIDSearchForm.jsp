<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="./../common/common.jsp" %>
<%@include file="./../display/top_header.jsp" %>       
<%@include file="./../display/top.jsp" %>
<!-- memberIDSearchForm.jsp -->
<style type="text/css">
	::placeholder {
  		font-size: 13px;
}


</style>

<!-- <script type="text/javascript">
	function check(){
		//이름 입력 체크
		
		//휴대폰번호 입력 체크
		
	}
</script> -->


<br><br>	
<div class="col-lg-12">
	<div class="section-title">
		<h2>아이디 찾기</h2>
	</div>
</div>

<form action="IDSearchForm.me" method="post">
	<p align="center">
		<input class="form-control" name="MNAME" style="width:300px;height:50px;" type="text" placeholder="고객님의 이름을 입력해주세요">
		<input class="form-control" name="MPHONE" style="width:300px;height:50px;margin-top: 10px;" type="text" placeholder="가입시 등록하신 휴대폰번호를 입력해주세요">
	</p>	

	<p align="center">
		<button type="submit" class="btn btn-primary btn-xl text-uppercase" style="background-color: #7fad39;border-color: #7fad39;width: 148px;margin-top: 5px;">찾기</button>
		<button type="button" onclick="location.href='PWSearchForm.me'" class="btn btn-primary btn-xl text-uppercase" style="background-color: #ffffff; border-color: #7fad39; color:#7fad39 ;width: 148px;margin-top: 5px;">비밀번호 찾기</button>
	</p>
</form> 




<br><br><br><br><br><br>

<%@include file="./../display/bottom.jsp" %>