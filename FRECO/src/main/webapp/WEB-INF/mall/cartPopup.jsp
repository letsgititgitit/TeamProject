 <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>    
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.6.3/css/all.css" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Cairo:wght@200;300;400;600;900&display=swap" rel="stylesheet">
<link rel="stylesheet" href="css/bootstrap.min.css" type="text/css">

<script type="text/javascript">
	function popclose(){
		window.close();
	}
    function goCartList(){		
    	opener.location.href = "javascript:goCartList2();";
		window.close();		
	} 
</script>

<style type="text/css">
	.cart-text{
		padding-top: 8px;
		color: black;
		font-size: 14px;
	}
	.cart-btn {
	font-size: 13px;
	color: #ffffff;
	font-weight: 800;
	text-transform: uppercase;
	display: inline-block;
	padding: 10px 27px 9px;
	background: #7fad39;
	border: none;
}
	.cart-img{
		padding-left: 11px;
		padding-top: 10px;
	}
	
</style>

<!-- 팝업 content -->
	<img class="cart-img" src="img/frecoLogo.png" alt="FRECO로고" width="70">
	<hr style="border:solid #7fad39">
	
	<center>
		<p class="cart-text">장바구니에 담겼습니다.</p>		
		<input type="button" class="cart-btn" value="계속 쇼핑하기" onClick="popclose()">
		<input type="button" class="cart-btn" value="장바구니 가기" onClick="goCartList()" >		
	</center>
	

	
	
