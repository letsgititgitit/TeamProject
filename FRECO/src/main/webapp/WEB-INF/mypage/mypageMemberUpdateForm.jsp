<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="./../common/common.jsp" %>  
<%@include file="./../display/top_header.jsp" %>
<%@include file="./../display/top.jsp" %>
<jsp:include page="./../display/mypageSidebar.jsp"/> 
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<!-- mypageMemberUpdateForm.jpg -->

<style type="text/css">
	::placeholder {
  		font-size: 13px;
}
	.possible{
		color: red;
		font-size: 9pt;
	}

</style>

<script type="text/javascript">
function kakaopost(){
	new daum.Postcode({
	    oncomplete: function(data) {	       
	        document.querySelector("#MADDRESS1").value = data.zonecode;
	        document.querySelector("#MADDRESS2").value = data.address;
	    }
	}).open();
}


</script>

<br><br>	
<div class="col-lg-12">
	<div class="section-title">
		<h2>회원정보수정</h2>
	</div>
</div>

<form:form action="mypageMemberUpdate.mp" method="post" commandName="memberBean" name="memberRegisterForm">
	<table align="center">
		<tr>
			<td width="110px" valign="middle" algin="center">아이디</td>
			<td><input class="form-control" name="MID" value="${member.MID}" style="width:350px;height:50px;margin-bottom: 10px;margin-top:10px;margin-right: 10px;" type="text" placeholder="5자 이상(영어 또는 영/숫자 조합)" required oninput="idDuplicate()">
		</tr>
		<tr>
			<td></td>
			<td><form:errors cssClass="err" path="MID"/></td>
		</tr>
		
		
		<tr>
			<td>비밀번호</td>
			<td><input class="form-control" name="MPW" value="${member.MPW}" style="width:350px;height:50px;margin-bottom: 10px;margin-top:10px;" type="password" placeholder="8자 이상(영/숫자 조합)"></td>
		</tr>
		<tr>
			<td></td>
			<td><form:errors cssClass="err" path="MPW"/></td>
		</tr>
		<tr>
			<td>비밀번호확인</td>
			<td><input class="form-control" name="MPW2" value="${member.MPW}" style="width:350px;height:50px;margin-bottom: 10px;margin-top:10px;" type="password" placeholder="비밀번호를 한 번 더 입력해주세요"></td>
		</tr>
<%-- 		<tr>
			<td></td>
			<td><form:errors cssClass="err" path="MPW"/></td>
		</tr> --%>
		<tr>
			<td>이름</td>
			<td><input class="form-control" name="MNAME" value="${member.MNAME}" style="width:350px;height:50px;margin-bottom: 10px;margin-top:10px;" type="text" placeholder="이름을 입력해주세요"></td>
		</tr>
		<tr>
			<td></td>
			<td><form:errors cssClass="err" path="MNAME"/></td>
		</tr>
		<tr>
			<td>생년월일</td>
			<td><input class="form-control" name="MBIRTH" value="${member.MBIRTH}" style="width:350px;height:50px;margin-bottom: 10px;margin-top:10px;" type="text" placeholder="YYMMDD 형태로 입력해주세요"></td>
		</tr>
		<tr>
			<td></td>
			<td><form:errors cssClass="err" path="MBIRTH"/></td>
		</tr>				
		<tr>
			<td>휴대폰</td>
			<td><input class="form-control" name="MPHONE" value="${member.MPHONE}" style="width:350px;height:50px;margin-bottom: 10px;margin-top:10px;" type="text" placeholder="휴대폰번호를 -빼고 입력해주세요"></td>
		</tr>
		<tr>
			<td></td>
			<td><form:errors cssClass="err" path="MPHONE"/></td>
		</tr>				
		<tr>
			<td>우편번호</td>
			<td><input class="form-control" id="MADDRESS1" value="${member.MADDRESS1}" style="width:350px;height:50px;margin-bottom: 10px;margin-top:10px;" type="text" placeholder=""></td>
			<td valign="middle"><button onclick="kakaopost()" class="btn btn-primary btn-xl text-uppercase" style="background-color: #ffffff; border-color: #7fad39; color:#7fad39 ;width: 125px;height:48px;">우편번호찾기</button>

		
		</tr>
				
		<tr>
			<td>주소</td>
			<td><input class="form-control" id="MADDRESS2" value="${member.MADDRESS2}" style="width:350px;height:50px;margin-bottom: 10px;margin-top:10px;" type="text" placeholder=""></td>
		</tr>		
		
		<tr>
			<td>상세주소</td>
			<td><input class="form-control" name="MADDRESS3" value="${member.MADDRESS3}" style="width:350px;height:50px;margin-bottom: 10px;margin-top:10px;" type="text" placeholder="상세주소를 입력해주세요"></td>
		</tr>		
		<tr>
			<td colspan="3" align="center">
				<button type="submit" onClick="return check()" class="btn btn-primary btn-xl text-uppercase" style="background-color: #7fad39;border-color: #7fad39;width:350px;height:50px;margin-top: 25px;margin-right: 25px">수정하기</button>
			</td>
		</tr>
		
		
					
	</table>
</form:form>
<br><br><br><br><br><br>


<%@include file="./../display/bottom.jsp" %>


