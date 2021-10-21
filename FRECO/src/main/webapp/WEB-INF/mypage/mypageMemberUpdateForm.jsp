<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="./../common/common.jsp" %>  
<%@include file="./../display/top_header.jsp" %>
<%@include file="./../display/top.jsp" %>
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
	form{
		margin-left: -250px;
		margin-top: -70px;
		
	}

</style>


<script type="text/javascript">
/* 주소 API */
	function kakaopost(){
		new daum.Postcode({
		    oncomplete: function(data) {	       
		        document.querySelector("#MADDRESS1").value = data.zonecode;
		        document.querySelector("#MADDRESS2").value = data.address;
		    }
		}).open();
	}//


</script>

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
						
					<form:form action="" method="post" commandName="memberBean" name="" >
						<div class="col-lg-12">
							<div class="section-title">
								<h2>회원정보수정</h2>
							</div>
						</div>
						
						<table align="center">
							<tr>
								<td width="110px" valign="middle" algin="center">아이디</td>
								<td><input class="form-control" name="MID" value="${loginInfo.MID}" style="width:350px;height:50px;margin-bottom: 10px;margin-top:10px;margin-right: 10px;" type="text" placeholder="5자 이상(영어 또는 영/숫자 조합)" required oninput="idDuplicate()">
							</tr>
							<tr>
								<td></td>
								<td><form:errors cssClass="err" path="MID"/></td>
							</tr>
							
							
							<tr>
								<td>비밀번호</td>
								<td><input class="form-control" name="MPW" value="${loginInfo.MPW}" style="width:350px;height:50px;margin-bottom: 10px;margin-top:10px;" type="password" placeholder="8자 이상(영/숫자 조합)"></td>
							</tr>
							<tr>
								<td></td>
								<td><form:errors cssClass="err" path="MPW"/></td>
							</tr>
							<tr>
								<td>비밀번호확인</td>
								<td><input class="form-control" name="MPW2" value="${loginInfo.MPW}" style="width:350px;height:50px;margin-bottom: 10px;margin-top:10px;" type="password" placeholder="비밀번호를 한 번 더 입력해주세요"></td>
							</tr>
					<%-- 		<tr>
								<td></td>
								<td><form:errors cssClass="err" path="MPW"/></td>
							</tr> --%>
							<tr>
								<td>이름</td>
								<td><input class="form-control" name="MNAME" value="${loginInfo.MNAME}" style="width:350px;height:50px;margin-bottom: 10px;margin-top:10px;" type="text" placeholder="이름을 입력해주세요"></td>
							</tr>
							<tr>
								<td></td>
								<td><form:errors cssClass="err" path="MNAME"/></td>
							</tr>
							<tr>
								<td>생년월일</td>
								<td><input class="form-control" name="MBIRTH" value="${loginInfo.MBIRTH}" style="width:350px;height:50px;margin-bottom: 10px;margin-top:10px;" type="text" placeholder="YYMMDD 형태로 입력해주세요"></td>
							</tr>
							<tr>
								<td></td>
								<td><form:errors cssClass="err" path="MBIRTH"/></td>
							</tr>				
							<tr>
								<td>휴대폰</td>
								<td><input class="form-control" name="MPHONE" value="${loginInfo.MPHONE}" style="width:350px;height:50px;margin-bottom: 10px;margin-top:10px;" type="text" placeholder="휴대폰번호를 -빼고 입력해주세요"></td>
							</tr>
							<tr>
								<td></td>
								<td><form:errors cssClass="err" path="MPHONE"/></td>
							</tr>				
							<tr>
								<td>우편번호</td>
								<td><input class="form-control" id="MADDRESS1" value="${loginInfo.MADDRESS1}" style="width:350px;height:50px;margin-bottom: 10px;margin-top:10px;" type="text" placeholder=""></td>
								<td valign="middle"><button onclick="kakaopost()" class="btn btn-primary btn-xl text-uppercase" style="background-color: #ffffff; border-color: #7fad39; color:#7fad39 ;width: 125px;height:48px;">우편번호찾기</button>
					
							
							</tr>
									
							<tr>
								<td>주소</td>
								<td><input class="form-control" id="MADDRESS2" value="${loginInfo.MADDRESS2}" style="width:350px;height:50px;margin-bottom: 10px;margin-top:10px;" type="text" placeholder=""></td>
							</tr>		
							
							<tr>
								<td>상세주소</td>
								<td><input class="form-control" name="MADDRESS3" value="${loginInfo.MADDRESS3}" style="width:350px;height:50px;margin-bottom: 10px;margin-top:10px;" type="text" placeholder="상세주소를 입력해주세요"></td>
							</tr>		
							<tr>
								<td colspan="3" align="center">
									<button type="submit" onClick="return check()" class="btn btn-primary btn-xl text-uppercase" style="background-color: #7fad39;border-color: #7fad39;width:350px;height:50px;margin-top: 25px;margin-right: 25px">수정하기</button>
								</td>
							</tr>
										
						</table>
					</form:form>
						
						
						
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


