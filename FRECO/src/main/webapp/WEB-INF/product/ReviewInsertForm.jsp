<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@include file="./../common/common.jsp" %>  
<%@include file="./../display/top_header.jsp" %>
<%@include file="./../display/top.jsp" %>

<link rel="stylesheet" href="css/rating.css" type="text/css">
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
	function recheck(){
		//alert("등록하기 클릭");
		
		//작성내용없으면 리턴
	 	if(document.myform.RCONTENT.value=="" || document.myform.RCONTENT.value== null){
			alert("리뷰 내용을 입력하세요.");
			document.myform.RCONTENT.focus;
			return false;
		}
		
		//비밀번호 입력 안하면 리턴
		if(document.myform.RPW.value=="" || document.myform.RPW.value== null){
			alert("비밀번호를 입력하세요.");
			document.myform.RPW.focus;
			return false;
		}
		
		//별점선택 안하면 리턴
		flag=false;
		for(i=0; i<document.myform.RRATING.length; i++){
			if(document.myform.RRATING[i].checked){
				flag=true;
			}
		}
		if(flag==false){
			alert("별점을 체크하세요.");
			return false;
		}
	}
</script>

<br><br>	
<div class="col-lg-12">
	<div class="section-title">
		<h2>리뷰작성</h2>
	</div>
</div>
	<table align="center" width="250px">
		<tr align="center">
			<td><img width="120" height="120" src="img/product/product_img/${pbean.PSUBCATEGORY}/${pbean.PNAME}/${pbean.PIMG1}"  alt="상품이미지"></td>
			<td><b>[상품 정보]</b><br>
				<B>${pbean.PNAME}</B><br>
				<fmt:formatNumber value="${pbean.PPRICE}" pattern="###,###"/> 원 <br>
				[POINT: <fmt:formatNumber value="${pbean.PPOINT}" pattern="###,###"/> ]		
			</td>	
		</tr>		
	</table>
	
	<hr>
	<br>
	
<form name="myform" action="reviewinsert.product" method="post" enctype="multipart/form-data" >
	<input type="hidden" name="RSUBJECT" value="${pbean.PNUM}">
	<input type="hidden" name="RINVOICE" value="${OINVOICE}">
	<table align="center" >
	
		<tr style="margin: 30px 100px">
			<td width="110px" valign="middle" algin="center">아이디</td>
			<td style="width:350px;height:50px;margin-bottom: 10px;margin-top:10px;">
				<B>${mbean.MID}</B>
				<input type="hidden" name="RID" value="${mbean.MID}">
			<td>
		</tr>
		
		<tr>
			<td>평점 선택</td>
			<td>
				<div class="container">  
					 <div class="rate">
					    <input type="radio" id="star5" name="RRATING" value="5" />
					    <label for="star5" title="text">5 stars</label>
					    <input type="radio" id="star4" name="RRATING" value="4" />
					    <label for="star4" title="text">4 stars</label>
					    <input type="radio" id="star3" name="RRATING" value="3" />
					    <label for="star3" title="text">3 stars</label>
					    <input type="radio" id="star2" name="RRATING" value="2" />
					    <label for="star2" title="text">2 stars</label>
					    <input type="radio" id="star1" name="RRATING" value="1" />
					    <label for="star1" title="text">1 star</label>
					 </div>
				</div>
			</td>
		</tr>
		<tr>
			<td>이미지 추가</td>
			<td><input type="file" name="uploadRIMG" style="margin-bottom: 10px;margin-top:10px;"></td>
		</tr>	
		<tr>
			<td>후기 작성</td>
			<td>
				<textarea name="RCONTENT" style="width:350px;height:150px;margin-bottom: 10px;margin-top:10px;"> </textarea>
			</td>
		</tr>
		<tr>
			<td>비밀번호 설정</td>
			<td>
				<input class="form-control"  type="password"  name="RPW" 
					   style="width:350px;height:50px;margin-bottom: 10px;margin-top:10px;">
			</td>
		</tr>
		<tr>
			<td colspan="3" align="center">
				<button type="submit" onClick="return recheck()" 
						class="btn btn-primary btn-xl text-uppercase" 
						style="background-color: #7fad39;border-color: #7fad39;width:350px;height:50px;margin-top: 25px;margin-right: 25px">
						등록하기
				</button>
			</td>
		</tr>
	</table>
</form>
<br><br><br><br><br><br>

<%@include file="./../display/bottom.jsp" %>
