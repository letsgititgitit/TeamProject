<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- mypageWriteList.jsp -->
<%@include file="./../common/common.jsp" %> 
<%@include file="./../display/top_header.jsp" %>   
<%@include file="./../display/top.jsp" %>

<!-- 템플릿 시작 -->

<!DOCTYPE html>
<html lang="zxx">

<head>
    <meta charset="UTF-8">
    <meta name="description" content="Ogani Template">
    <meta name="keywords" content="Ogani, unica, creative, html">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">

    <!-- Google Font -->
    <link href="https://fonts.googleapis.com/css2?family=Cairo:wght@200;300;400;600;900&display=swap" rel="stylesheet">

    <!-- Css Styles -->
    <link rel="stylesheet" href="css/bootstrap.min.css" type="text/css">
    <link rel="stylesheet" href="css/font-awesome.min.css" type="text/css">
    <link rel="stylesheet" href="css/elegant-icons.css" type="text/css">
    <link rel="stylesheet" href="css/nice-select.css" type="text/css">
    <link rel="stylesheet" href="css/jquery-ui.min.css" type="text/css">
    <link rel="stylesheet" href="css/owl.carousel.min.css" type="text/css">
    <link rel="stylesheet" href="css/slicknav.min.css" type="text/css">
    <link rel="stylesheet" href="css/style.css" type="text/css">
</head>

<body>
	<section class="blog-details spad">
       <div class="container"> 
             <div class="row"> 
  <!-- 사이드바 시작-->            
             	<div class="col-lg-4 col-md-5 order-md-1 order-2">
             	<div class="blog__sidebar__item">
                           <h4 style="margin-left: 30px; margin-top: -50px;">마이페이지</h4>
                            <ul style="margin-left: 30px;">
                                <li><a href="mypageOrderList.mp">주문내역</a></li>
                                <li><a href="mypageCouponList.mp">쿠폰/적립금</a></li>
                                <li><a href="mypageWriteList.mp">내가쓴글</a></li>
                                <li><a href="mypageMemberUpdate.mp">회원정보수정</a></li>
                            </ul>
                 </div> 
                </div>            
  <!-- 사이드바 끝-->
                <!-- 테이블 시작 -->
                <div class="col-lg-8 col-md-7 order-md-1 order-1">
                    <div class="blog__details__text">						
						
						<div class="col-lg-12" style="margin-top: -70px; margin-left: -100px;margin-bottom: 100px;" >
						<div class="section-title">
								<h2>글목록</h2>
							</div>
						</div>  
						
						<table class="table table-hover" style="margin-top: -50px; margin-left: -100px;">
							  <thead>
							    <tr align="center">
							      <th scope="col">번호</th>
							      <th scope="col">제목</th>
							      <th scope="col">작성일자</th>
							    </tr>
							  </thead>
							  <tbody>
								<tr>
									<c:if test="${empty lists }">
										<tr align="center">
											<td colspan="3">작성하신 글이 없습니다</td>
										</tr>
									</c:if>	
								</tr> 
								<c:forEach var="#" items="${lists}">
										<tr>
											<td></td>
											<td></td>
											<td></td>
										</tr>
								</c:forEach>
							  </tbody>
							</table>                
						<!-- 테이블 끝 -->	
                   		 </div>
                	</div>
              	</div>  
         	</div> 
       </div>
   </section>

    <!-- Js Plugins -->
    <script src="js/jquery-3.3.1.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/jquery.nice-select.min.js"></script>
    <script src="js/jquery-ui.min.js"></script>
    <script src="js/jquery.slicknav.js"></script>
    <script src="js/mixitup.min.js"></script>
    <script src="js/owl.carousel.min.js"></script>
    <script src="js/main.js"></script>

</body>

</html>

<!-- 템플릿 끝 -->

<%@include file="./../display/bottom.jsp" %> 
