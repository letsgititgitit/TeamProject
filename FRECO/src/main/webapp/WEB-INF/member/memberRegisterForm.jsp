<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="./../common/common.jsp" %>  
<%@include file="./../display/top_header.jsp" %>
<%@include file="./../display/top.jsp" %>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="<%=request.getContextPath() %>/js/registerCheck.js"></script>
<!-- memberRegisterForm.jsp -->
<style type="text/css">
	::placeholder {
  		font-size: 13px;
}
	.err{
		color: red;
		font-size: 8pt;
	}

</style>
<script type="text/javascript">
	function kakaopost(){
		new daum.Postcode({
		    oncomplete: function(data) {	       
		        document.querySelector("#MADDRESS1").value = data.zonecode;
		        document.querySelector("#MADDRESS2").value = data.address;
		    }
		}) .open();
		
	}
	
/* 	//중복체크
	var checkbtn={
		    idCheck	: function() {
		    	var MID = $("#MID").val();
		        // 아이디 유효성 검사
		        if (!this.idCheck(MID)) {
		        	return false;
		        }	
			
	} */

</script>

<br><br>	
<div class="col-lg-12">
	<div class="section-title">
		<h2>회원가입</h2>
	</div>
</div>

<form action="registerForm.me" method="post" commandName="memberBean" name="f" onsubmit="return validate()">
	<table align="center">
		<tr>
			<td width="110px" valign="middle" algin="center">아이디</td>
			<td><input class="form-control" id="MID" name="MID" value="${member.MID}" style="width:350px;height:50px;margin-bottom: 10px;margin-top:10px;margin-right: 10px;" type="text" placeholder="아이디를 입력해주세요" >
			<!-- <td valign="middle"><input type="button" onClick="checkbtn.idCheck()" id="idCheck" name="idCheck" class="btn btn-primary btn-xl text-uppercase" style="background-color: #ffffff; border-color: #7fad39; color:#7fad39 ;width: 125px;height:48px;" value="중복체크"/> -->
		</tr>
		<tr>
			<td>비밀번호</td>
			<td><input class="form-control" name="MPW" value="${member.MPW}" style="width:350px;height:50px;margin-bottom: 10px;margin-top:10px;" type="password" placeholder="비밀번호를 입력해주세요"></td>
		</tr>
		<tr>
			<td>비밀번호확인</td>
			<td><input class="form-control" name="confirmMPW" value="${member.MPW}" style="width:350px;height:50px;margin-bottom: 10px;margin-top:10px;" type="password" placeholder="비밀번호를 한 번 더 입력해주세요"></td>
		</tr>
		<tr>
			<td>이름</td>
			<td><input class="form-control" name="MNAME" value="${member.MNAME}" style="width:350px;height:50px;margin-bottom: 10px;margin-top:10px;" type="text" placeholder="이름을 입력해주세요"></td>
		</tr>
		<tr>
			<td>생년월일</td>
			<td><input class="form-control" name="MBIRTH" value="${member.MBIRTH}" style="width:350px;height:50px;margin-bottom: 10px;margin-top:10px;" type="text" placeholder="YYMMDD 형태로 입력해주세요"></td>
		</tr>
		<tr>
			<td>휴대폰</td>
			<td><input class="form-control" name="MPHONE" value="${member.MPHONE}" style="width:350px;height:50px;margin-bottom: 10px;margin-top:10px;" type="text" placeholder="휴대폰번호는 숫자만 입력해주세요"></td>
		</tr>
		<tr>
			<td>우편번호</td>
			<td><input class="form-control" id="MADDRESS1" name="MADDRESS1" value="${member.MADDRESS1}" style="width:350px;height:50px;margin-bottom: 10px;margin-top:10px;" type="text" placeholder=""></td>
			<td valign="middle"><input type="button" onclick="kakaopost()" class="btn btn-primary btn-xl text-uppercase" style="background-color: #ffffff; border-color: #7fad39; color:#7fad39 ;width: 125px;height:48px;" value="우편번호찾기"/>
		</tr>
		<tr>
			<td>주소</td>
			<td><input class="form-control" id="MADDRESS2" name="MADDRESS2" value="${member.MADDRESS2}" style="width:350px;height:50px;margin-bottom: 10px;margin-top:10px;" type="text" placeholder=""></td>
		</tr>		
		<tr>
			<td>상세주소</td>
			<td><input class="form-control" name="MADDRESS3" value="${member.MADDRESS3}" style="width:350px;height:50px;margin-bottom: 10px;margin-top:10px;" type="text" placeholder="상세주소를 입력해주세요"></td>
		</tr>
		<tr>
			<td colspan="3" align="center">
				<button type="submit" class="btn btn-primary btn-xl text-uppercase" style="background-color: #7fad39;border-color: #7fad39;width:350px;height:50px;margin-top: 25px;margin-right: 25px">가입하기</button>
			</td>
		</tr>
	</table>
</form>
<br><br><br><br><br><br>


<%@include file="./../display/bottom.jsp" %>