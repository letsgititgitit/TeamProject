<%@ page language="java" contentType="text/html; charset=UTF-8"   pageEncoding="UTF-8"%>
<!-- mypageODetailList.jsp -->
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

<script type="text/javascript">
	function go(number, invoice){
		//alert("리뷰쓰러가기");
		location.href="reviewinsert.product?PNUM="+ number + "&OINVOICE=" + invoice;
	}
</script>

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
								<h2>
									<c:if test="${obean.OREFUND eq 'NO'}"> 상세보기 </c:if>
									<c:if test="${obean.OREFUND eq 'YES'}"><font style="color: red;">환불 요청중</font> </c:if>
								</h2>
							</div>
						</div>                      
                    	
						<table class="table table-hover" style="margin-top: -50px; margin-left: -100px;">
							  <thead>
							    <tr align="center">
							      <th scope="col">번호</th>
							      <th scope="col">이미지</th>
							      <th scope="col">상품명</th>
							      <th scope="col">단가[포인트]</th>
							      <th scope="col">주문 수량</th>
							      <th scope="col">리뷰쓰기</th>
							    </tr>
							  </thead>
							  <tbody>
								<c:forEach var="dvList" items="${dvList}">
										<tr align="center">
											<td valign="middle">${dvList.dvnum}</td>
											<td valign="middle"> 
												<img width="80" height="80"
													 src="img/product/product_img/${dvList.dvpsubcategory}/${dvList.dvpname}/${dvList.dvpimg}" 
													 alt="상품이미지">
											</td>
											<td valign="middle">${dvList.dvpname}</td>
											<td valign="middle">
												<fmt:formatNumber  var="price" value="${dvList.dvpprice}" pattern="###,###"/>
												<fmt:formatNumber  var="point" value="${dvList.dvppoint}" pattern="###,###"/>
												${price}원 [${point}]
											</td>
											<td valign="middle">${dvList.dvoqty}</td>
											<td valign="middle">
											
												<c:if test="${dvList.dvodreview eq 'YES'}">   
													<input type="button" value="작성 완료"  disabled>
												</c:if>
												
												<c:if test="${dvList.dvodreview eq 'NO'}">
													<input type="button" value="리뷰쓰기" <c:if test="${OREFUND eq 'YES'}"> disabled </c:if> 
														onClick="go(${dvList.dvpnum}, ${OINVOICE})">
												</c:if>
											</td>
										</tr>
								</c:forEach>
										<tr align="center">
											<td colspan="2"><b>쿠폰 사용 금액</b></td>
											<td colspan="1"><fmt:formatNumber value="${couprice}" pattern="###,###"/></td>
											<td colspan="2"><b><font style="color: red;">총 적립 포인트</font></b></td>
											<td colspan="1"><b><font style="color: red;"><fmt:formatNumber value="${allPoint}" pattern="###,###"/></font></b></td>
										</tr>
										<tr align="center">
											<td colspan="2"><b>사용 포인트</b></td>
											<td colspan="1">${obean.OUSEPOINT}</td>
											<td colspan="2"><b><font style="color: red;">총 결제 금액</font></b></td>
											<td colspan="1"><b><font style="color: red;"><fmt:formatNumber value="${allPrice}" pattern="###,###"/></font></b></td>
										</tr>
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



    <!-- Footer Section Begin -->
    <footer class="footer spad">
        <div class="container"> 
            <div class="row">
            
                <div class="col-lg-6 col-md-6 col-sm-6">
                    <div class="footer__about">
                        <div class="footer__about__logo">
                            <a href="main.mall"><img src="img/frecoLogo.png" alt=""></a>
                        </div>
                        <ul>
                            <li>주소: 서울 마포구 신촌로 176 중앙빌딩</li>
                            <li>사업자 등록번호: 220-95-00629</li>
                            <li>TEL: 02-704-1711</li>
                            <li>FAX: 02-393-9218</li>
                        </ul>
                    </div>
                </div>
               
              
                <div class="col-lg-4 col-md-12">
                    <div class="footer__widget">
                        <!-- <h6>Join Our Newsletter Now</h6>
                        <p>Get E-mail updates about our latest shop and special offers.</p>
                        <form action="#">
                            <input type="text" placeholder="Enter your mail">
                            <button type="submit" class="site-btn">Subscribe</button>
                        </form>
                        <div class="footer__widget__social">
                            <a href="#"><i class="fa fa-facebook"></i></a>
                            <a href="#"><i class="fa fa-instagram"></i></a>
                            <a href="#"><i class="fa fa-twitter"></i></a>
                            <a href="#"><i class="fa fa-pinterest"></i></a>
                        </div> -->
                        
                        <br>
                        <h6>커뮤니티</h6>
                        <ul>
                            <li><a href="info.in">회사소개</a></li>
                            <li><a href="privacy.in">개인정보처리방침</a></li>
                            <li><a href="terms.in">이용약관</a></li>
                            <li><a href="faq.mall">고객센터</a></li>
                        </ul>
                       <!--  <ul>
                            <li><a href="#">Who We Are</a></li>
                            <li><a href="#">Our Services</a></li>
                            <li><a href="#">Projects</a></li>
                            <li><a href="#">Contact</a></li>
                            <li><a href="#">Innovation</a></li>
                            <li><a href="#">Testimonials</a></li>
                        </ul> -->
                    </div>
                </div>
            </div>
             
            
<!--             
            <div class="row">
                <div class="col-lg-12">
                    <div class="footer__copyright">
                    
                        <div class="footer__copyright__text"><p>
                        Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0.
  Copyright &copy;<script>document.write(new Date().getFullYear());</script> 
  All rights reserved | This template is made with 
  <i class="fa fa-heart" aria-hidden="true"></i> by <a href="https://colorlib.com" target="_blank">Colorlib</a>
  Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0.</p></div>
  
  
                        <div class="footer__copyright__payment"><img src="img/payment-item.png" alt=""></div>
                    </div>
                </div>
            </div>
        </div>
 -->        
    </footer>
    <!-- Footer Section End -->










