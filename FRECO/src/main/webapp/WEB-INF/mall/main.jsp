<%@page import="member.model.MemberBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 
<%@include file="./../common/common.jsp" %>  

<!DOCTYPE html>
<html lang="zxx">  
   
<head>      
    <meta charset="UTF-8">   
    <meta name="description" content="Ogani Template">
    <meta name="keywords" content="Ogani, unica, creative, html">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>FRECO 프레코</title>

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
    
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.6.3/css/all.css" rel="stylesheet">
    <style>
      .scrolltop {
        display: none;
        position: fixed;
        right: 30px;
        bottom: 50px;
        z-index: 1030;
        font-size: 1.875rem;
        color: #868e96;
        transition: all 0.5s ease-in-out;
        opacity: 0.8;
      }
      .scrolltop:hover, 
      .scrolltop:focus {
        color: #7fad39;  
        transition: all 0.5s ease-in-out;
      }
    </style>
  </head>

 
<script type="text/javascript">
   //새로고침 스크롤 상단
   history.scrollRestoration = "manual"
   
   //오른쪽 마우스 금지
   function blockRightClick(){
      alert('오른쪽 마우스 버튼을 사용할 수 없습니다');
      return false;
   }
   
   function blockDrag(){
      alert('드래그 기능을 사용할 수 없습니다');
      return false;
   }
   
   function blockSelect(){
      //alert('선택 기능을 사용할 수 없습니다');
      return false;
   }
   function Cart(){
       location.href="cartlist.mall";
   }
</script>

	<script src="js/jquery-3.3.1.min.js"></script>
    <script>
      jQuery(document).ready(function () {
        $(window).scroll(function () {
          if ($(this).scrollTop() > 100) {
            $('#backToTop').fadeIn(500);
          } else {
            $('#backToTop').fadeOut('slow');
          }
        });
        $('#backToTop').click(function (e) {
          e.preventDefault();
          $('html, body').animate({scrollTop: 0}, 200);
        });
      });
    </script>
    
    <script type="text/javascript">
	function cartPopup(PNUM,PNAME,ORDERPQTY){
	
	<% if(session.getAttribute("loginInfo")==null) { 
			session.setAttribute("destination", "redirect:/list.product"); %>
			location.href="login.me";
				
	<%	}else{	%>	
	var _width=400;
	var _height=180;
	var _left = Math.ceil(( window.screen.width - _width )/2);
	var _top = Math.ceil(( window.screen.height - _height )/2); 
	
	var options="resizeable=no,scrollbars=no,width="+_width+",height="+_height+",left="+_left+",top="+_top;
		 window.open(
				"cartAdd.mall?PNUM="+PNUM+"&PNAME="+PNAME+"&ORDERPQTY="+ORDERPQTY,
				"FRECO CART",
				options
				); 
		 <%}%>
	}
	
	function goCartList2(){
		//alert(1);
		location.href="cartlist.mall";
	}
</script>
    
<body oncontextmenu="return blockRightClick()" ondragstart="return blockDrag()" 
onselectstart="return blockSelect()">	
	
	<a id="backToTop" class="scrolltop" href="#">
      <i class="fas fa-chevron-circle-up"></i>
    </a>

    <!-- Page Preloder -->
        <div class="loader"></div>
    </div>
 
     <!-- Header Section Begin -->
    <header class="header">
        <div class="header__top">
            <div class="container">
                <div class="row">
                    <div class="col-lg-12 col-md-12">
                        <div class="header__top__right">
                    <c:choose>
                    	<c:when test="${empty loginInfo}">
                            <div class="header__top__right__auth">
                               <a href="login.me">로그인&nbsp;</a>
                            </div>
                                 <a>&nbsp;|&nbsp;</a> 
                            <div class="header__top__right__auth">
                               <a href="registerForm.me">&nbsp;회원가입</a>
                            </div>
                        </c:when> 
                        <c:otherwise>
                        	<div class="header__top__right__auth">
                              		<a>${loginInfo.getMNAME()}님 반갑습니다</a>
                            </div>
                                 <a>&nbsp;|&nbsp;</a> 
                            <div class="header__top__right__auth">
                               <a href="Logout.jsp">&nbsp;로그아웃</a>
                            </div>
                        </c:otherwise>
                     </c:choose>           
                      
                        </div>                       
                    </div>
                    
                </div>
            </div>
        </div>
        
        <div class="container">
            <div class="row">
                <div class="col-lg-3">
                    <div class="header__logo">
                        <a href="main.mall"><img src="img/frecoLogo.png" alt="FRECO로고"></a>
                    </div>
                </div>
                   
                
                <div class="col-lg-9">
                    <nav class="header__menu">
                        <ul>
                            <li class="active"><a href="main.mall">Home</a></li>
                            <li><a href="info.in">회사소개</a></li>
                            <li><a href="event.ev">이벤트</a></li>  
                            <li><a href="#">고객센터</a>
                            	<ul class="header__menu__dropdown">
                                    <li><a href="faq.mall" style="font-size: 15px;">자주하는질문</a></li>
                                    <li><a href="qna.mall" style="font-size: 15px;">1:1 문의</a></li>
                                </ul>
                            </li>    
                        </ul>
                    </nav>
                </div>
            </div>
            
            
            <div class="humberger__open">
                <i class="fa fa-bars"></i>
            </div> 
            
            
        </div>
        
    </header>
    <!-- Header Section End -->

    <!-- Hero Section Begin -->
    <section class="hero">   
        <div class="container">
        
            <div class="row">
            
                <div class="col-lg-3">
                    <div class="hero__categories">
                        <div class="hero__categories__all">
                            <i class="fa fa-bars"></i>
                            <span>카테고리</span>
                        </div>
                        <ul>
                            <li><a href="blist.product?PCATEGORY=베스트">베스트</a></li>
                            <li><a href="nlist.product?PCATEGORY=신상품">신상품</a></li>
                            <li><a href="list.product?PCATEGORY=식품">식품</a></li>   
                            <li><a href="list.product?PCATEGORY=생활용품">생활용품</a></li>
                            <li><a href="list.product?PCATEGORY=베이비∙키즈">베이비∙키즈</a></li>
                            <li><a href="list.product?PCATEGORY=반려동물">반려동물</a></li>
                        </ul>
                    </div>
                </div>
                
                <div class="col-lg-9">
                    <div class="hero__search">
                        <div class="hero__search__form">
                            <form action="listSearh.product" method="get">
                            
                               <!--  <div class="hero__search__categories">
                                	전체검색
                                    <span class="arrow_carrot-down"></span>
                                </div> -->     
                                <input type="hidden" name="whatColumn" value="all">
                                <input type="text" name="keyword" placeholder="상품명을 입력하세요">
                                <button type="submit" class="site-btn">SEARCH</button>     
                               </form>      
                        </div>          
                           
                        <div class="hero__search__phone">
                            	<c:choose>
                               	<c:when test="${loginInfo.getMID() eq 'ADMIN' }">
                                   <a href="main.admin">
                               	</c:when>
                               <c:otherwise>
                                   <a href="mypageOrderList.mp">
                               </c:otherwise>
                           	 </c:choose>
				
				
				<img src="img/mypageimg11.png" width="50px" style="margin-right: 20px"></a>                           
                            <a href="javascript:Cart()"><img src="img/cartimg11.png" width="50px" style="margin-right: 45px"> </a>                          
                        </div>    
                    </div>
                    
                    <div class="hero__item set-bg" data-setbg="img/hero/banner.jpg">
                        <div class="hero__text">
                            <span>FRUIT FRESH</span>
                            <h2>Vegetable <br />100% Organic</h2>
                            <p>Free Pickup and Delivery Available</p>
                            <a href="#" class="primary-btn">SHOP NOW</a>
                        </div>
                    </div>
                </div>
                
                
                
                
                
            </div>
        </div>
    </section>
    <!-- Hero Section End -->
  
    <!-- Categories Section Begin -->
    <section class="categories">
        <div class="container">
            <div class="row">
            
            	<div class="col-lg-12">
          	 		<div class="section-title">
                        <h2>베스트</h2>
                    </div>
            	</div>
            
                <div class="categories__slider owl-carousel">
                	<c:forEach var="bestItem" items="${bestItem}">
                	
                	
                    <div class="col-lg-3">
                        <div class="categories__item set-bg" data-setbg="img/product/product_img/${bestItem.PSUBCATEGORY}/${bestItem.PNAME}/${bestItem.PIMG1}">
                            <h5><a href="pdetail.product?PNUM=${bestItem.PNUM}">${bestItem.PNAME}</a></h5>
                        </div>
                    </div>
<!--                     <div class="col-lg-3">
                        <div class="categories__item set-bg" data-setbg="img/categories/cat-2.jpg">
                            <h5><a href="#">Dried Fruit</a></h5>
                        </div>
                    </div>
                    <div class="col-lg-3">
                        <div class="categories__item set-bg" data-setbg="img/categories/cat-3.jpg">
                            <h5><a href="#">Vegetables</a></h5>
                        </div>
                    </div>
                    <div class="col-lg-3">
                        <div class="categories__item set-bg" data-setbg="img/categories/cat-4.jpg">
                            <h5><a href="#">drink fruits</a></h5>
                        </div>
                    </div>
                    <div class="col-lg-3">
                        <div class="categories__item set-bg" data-setbg="img/categories/cat-5.jpg">
                            <h5><a href="#">drink fruits</a></h5>
                        </div>
                    </div>      -->
                    
                    </c:forEach>
                </div>
                
                
                
            </div>
        </div>
    </section>
    <!-- Categories Section End -->

    <!-- Featured Section Begin -->
    <section class="featured spad">
        <div class="container">
        
            <div class="row">
                <div class="col-lg-12">
                    <div class="section-title">
                        <h2>신상품</h2>
                    </div>
                    <div class="featured__controls">
                        <ul>
                            <li class="active" data-filter="*">All</li>
                            <li data-filter=".식품">식품</li>
                            <li data-filter=".생활용품">생활용품</li>
                            <li data-filter=".베이비∙키즈">베이비∙키즈</li>
                            <li data-filter=".반려동물">반려동물</li>
                        </ul>
                    </div>                   
                </div>
            </div>

            <div class="row featured__filter">
	            <c:forEach var="newItem" items="${NewItem }">
	                <div class="col-lg-3 col-md-4 col-sm-6 mix ${newItem.PCATEGORY }">
	                    <div class="featured__item">
	                        <div class="featured__item__pic set-bg" data-setbg="img/product/product_img/${newItem.PSUBCATEGORY}/${newItem.PNAME}/${newItem.PIMG1}">
	                            <ul class="featured__item__pic__hover">
	                                <li><a href="pdetail.product?PNUM=${newItem.PNUM}"><i class="fa fa-retweet"></i></a></li>
                                    <li><a onClick="cartPopup(${newItem.PNUM},'${newItem.PNAME}',1)"><i class="fa fa-shopping-cart"></i></a></li>
	                            </ul>
	                        </div>
	                        <div class="featured__item__text">
	                            <h6><a href="#">${newItem.PNAME}</a></h6>
	                            <h5>${newItem.PPRICE} 원</h5>
	                        </div>
	                    </div>
	                </div>
	             </c:forEach>
            </div>
            
        </div>
    </section>
    <!-- Featured Section End -->

    <!-- Banner Begin -->
    <div class="banner">
        <div class="container">
            <div class="row">
                <div class="col-lg-6 col-md-6 col-sm-6">
                    <div class="banner__pic">
                        <img src="img/banner/banner-1.jpg" alt="">
                    </div>
                </div>
                <div class="col-lg-6 col-md-6 col-sm-6">
                    <div class="banner__pic">
                        <img src="img/banner/banner-2.jpg" alt="">
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Banner End -->

<br><br><br><br>

<!-- 
    Latest Product Section Begin
    <section class="latest-product spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-4 col-md-6">
                    <div class="latest-product__text">
                        <h4>Latest Products</h4>
                        <div class="latest-product__slider owl-carousel">
                            <div class="latest-prdouct__slider__item">
                                <a href="#" class="latest-product__item">
                                    <div class="latest-product__item__pic">
                                        <img src="img/latest-product/lp-1.jpg" alt="">
                                    </div>
                                    <div class="latest-product__item__text">
                                        <h6>Crab Pool Security</h6>
                                        <span>$30.00</span>
                                    </div>
                                </a>
                                <a href="#" class="latest-product__item">
                                    <div class="latest-product__item__pic">
                                        <img src="img/latest-product/lp-2.jpg" alt="">
                                    </div>
                                    <div class="latest-product__item__text">
                                        <h6>Crab Pool Security</h6>
                                        <span>$30.00</span>
                                    </div>
                                </a>
                                <a href="#" class="latest-product__item">
                                    <div class="latest-product__item__pic">
                                        <img src="img/latest-product/lp-3.jpg" alt="">
                                    </div>
                                    <div class="latest-product__item__text">
                                        <h6>Crab Pool Security</h6>
                                        <span>$30.00</span>
                                    </div>
                                </a>
                            </div>
                            <div class="latest-prdouct__slider__item">
                                <a href="#" class="latest-product__item">
                                    <div class="latest-product__item__pic">
                                        <img src="img/latest-product/lp-1.jpg" alt="">
                                    </div>
                                    <div class="latest-product__item__text">
                                        <h6>Crab Pool Security</h6>
                                        <span>$30.00</span>
                                    </div>
                                </a>
                                <a href="#" class="latest-product__item">
                                    <div class="latest-product__item__pic">
                                        <img src="img/latest-product/lp-2.jpg" alt="">
                                    </div>
                                    <div class="latest-product__item__text">
                                        <h6>Crab Pool Security</h6>
                                        <span>$30.00</span>
                                    </div>
                                </a>
                                <a href="#" class="latest-product__item">
                                    <div class="latest-product__item__pic">
                                        <img src="img/latest-product/lp-3.jpg" alt="">
                                    </div>
                                    <div class="latest-product__item__text">
                                        <h6>Crab Pool Security</h6>
                                        <span>$30.00</span>
                                    </div>
                                </a>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-4 col-md-6">
                    <div class="latest-product__text">
                        <h4>Top Rated Products</h4>
                        <div class="latest-product__slider owl-carousel">
                            <div class="latest-prdouct__slider__item">
                                <a href="#" class="latest-product__item">
                                    <div class="latest-product__item__pic">
                                        <img src="img/latest-product/lp-1.jpg" alt="">
                                    </div>
                                    <div class="latest-product__item__text">
                                        <h6>Crab Pool Security</h6>
                                        <span>$30.00</span>
                                    </div>
                                </a>
                                <a href="#" class="latest-product__item">
                                    <div class="latest-product__item__pic">
                                        <img src="img/latest-product/lp-2.jpg" alt="">
                                    </div>
                                    <div class="latest-product__item__text">
                                        <h6>Crab Pool Security</h6>
                                        <span>$30.00</span>
                                    </div>
                                </a>
                                <a href="#" class="latest-product__item">
                                    <div class="latest-product__item__pic">
                                        <img src="img/latest-product/lp-3.jpg" alt="">
                                    </div>
                                    <div class="latest-product__item__text">
                                        <h6>Crab Pool Security</h6>
                                        <span>$30.00</span>
                                    </div>
                                </a>
                            </div>
                            <div class="latest-prdouct__slider__item">
                                <a href="#" class="latest-product__item">
                                    <div class="latest-product__item__pic">
                                        <img src="img/latest-product/lp-1.jpg" alt="">
                                    </div>
                                    <div class="latest-product__item__text">
                                        <h6>Crab Pool Security</h6>
                                        <span>$30.00</span>
                                    </div>
                                </a>
                                <a href="#" class="latest-product__item">
                                    <div class="latest-product__item__pic">
                                        <img src="img/latest-product/lp-2.jpg" alt="">
                                    </div>
                                    <div class="latest-product__item__text">
                                        <h6>Crab Pool Security</h6>
                                        <span>$30.00</span>
                                    </div>
                                </a>
                                <a href="#" class="latest-product__item">
                                    <div class="latest-product__item__pic">
                                        <img src="img/latest-product/lp-3.jpg" alt="">
                                    </div>
                                    <div class="latest-product__item__text">
                                        <h6>Crab Pool Security</h6>
                                        <span>$30.00</span>
                                    </div>
                                </a>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-4 col-md-6">
                    <div class="latest-product__text">
                        <h4>Review Products</h4>
                        <div class="latest-product__slider owl-carousel">
                            <div class="latest-prdouct__slider__item">
                                <a href="#" class="latest-product__item">
                                    <div class="latest-product__item__pic">
                                        <img src="img/latest-product/lp-1.jpg" alt="">
                                    </div>
                                    <div class="latest-product__item__text">
                                        <h6>Crab Pool Security</h6>
                                        <span>$30.00</span>
                                    </div>
                                </a>
                                <a href="#" class="latest-product__item">
                                    <div class="latest-product__item__pic">
                                        <img src="img/latest-product/lp-2.jpg" alt="">
                                    </div>
                                    <div class="latest-product__item__text">
                                        <h6>Crab Pool Security</h6>
                                        <span>$30.00</span>
                                    </div>
                                </a>
                                <a href="#" class="latest-product__item">
                                    <div class="latest-product__item__pic">
                                        <img src="img/latest-product/lp-3.jpg" alt="">
                                    </div>
                                    <div class="latest-product__item__text">
                                        <h6>Crab Pool Security</h6>
                                        <span>$30.00</span>
                                    </div>
                                </a>
                            </div>
                            <div class="latest-prdouct__slider__item">
                                <a href="#" class="latest-product__item">
                                    <div class="latest-product__item__pic">
                                        <img src="img/latest-product/lp-1.jpg" alt="">
                                    </div>
                                    <div class="latest-product__item__text">
                                        <h6>Crab Pool Security</h6>
                                        <span>$30.00</span>
                                    </div>
                                </a>
                                <a href="#" class="latest-product__item">
                                    <div class="latest-product__item__pic">
                                        <img src="img/latest-product/lp-2.jpg" alt="">
                                    </div>
                                    <div class="latest-product__item__text">
                                        <h6>Crab Pool Security</h6>
                                        <span>$30.00</span>
                                    </div>
                                </a>
                                <a href="#" class="latest-product__item">
                                    <div class="latest-product__item__pic">
                                        <img src="img/latest-product/lp-3.jpg" alt="">
                                    </div>
                                    <div class="latest-product__item__text">
                                        <h6>Crab Pool Security</h6>
                                        <span>$30.00</span>
                                    </div>
                                </a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    Latest Product Section End
  -->   
    
<!-- 
    Blog Section Begin
    <section class="from-blog spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="section-title from-blog__title">
                        <h2>From The Blog</h2>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-lg-4 col-md-4 col-sm-6">
                    <div class="blog__item">
                        <div class="blog__item__pic">
                            <img src="img/blog/blog-1.jpg" alt="">
                        </div>
                        <div class="blog__item__text">
                            <ul>
                                <li><i class="fa fa-calendar-o"></i> May 4,2019</li>
                                <li><i class="fa fa-comment-o"></i> 5</li>
                            </ul>
                            <h5><a href="#">Cooking tips make cooking simple</a></h5>
                            <p>Sed quia non numquam modi tempora indunt ut labore et dolore magnam aliquam quaerat </p>
                        </div>
                    </div>
                </div>
                <div class="col-lg-4 col-md-4 col-sm-6">
                    <div class="blog__item">
                        <div class="blog__item__pic">
                            <img src="img/blog/blog-2.jpg" alt="">
                        </div>
                        <div class="blog__item__text">
                            <ul>
                                <li><i class="fa fa-calendar-o"></i> May 4,2019</li>
                                <li><i class="fa fa-comment-o"></i> 5</li>
                            </ul>
                            <h5><a href="#">6 ways to prepare breakfast for 30</a></h5>
                            <p>Sed quia non numquam modi tempora indunt ut labore et dolore magnam aliquam quaerat </p>
                        </div>
                    </div>
                </div>
                <div class="col-lg-4 col-md-4 col-sm-6">
                    <div class="blog__item">
                        <div class="blog__item__pic">
                            <img src="img/blog/blog-3.jpg" alt="">
                        </div>
                        <div class="blog__item__text">
                            <ul>
                                <li><i class="fa fa-calendar-o"></i> May 4,2019</li>
                                <li><i class="fa fa-comment-o"></i> 5</li>
                            </ul>
                            <h5><a href="#">Visit the clean farm in the US</a></h5>
                            <p>Sed quia non numquam modi tempora indunt ut labore et dolore magnam aliquam quaerat </p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    Blog Section End
 -->



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
