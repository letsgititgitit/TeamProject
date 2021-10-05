<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
    
<body oncontextmenu="return blockRightClick()" ondragstart="return blockDrag()" 
onselectstart="return blockSelect()">	

	<!-- 위로가기 버튼 -->
	<a id="backToTop" class="scrolltop" href="#">
      <i class="fas fa-chevron-circle-up"></i>
    </a>

    <!-- Page Preloder -->
    <div id="preloder">
        <div class="loader"></div>
    </div>

    <!-- Header Section Begin -->
    <header class="header">
        <div class="header__top">
            <div class="container">
                <div class="row">
                    
                   <div class="col-lg-12 col-md-12">
                        <div class="header__top__right">
           
                            <div class="header__top__right__auth">
                               <a href="#">로그인&nbsp;</a>
                            </div>
                                 <a>&nbsp;|&nbsp;</a> 
                            <div class="header__top__right__auth">
                               <a href="#">&nbsp;회원가입</a>
                            </div>
                      
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
                            <li><a href="#">회사소개</a></li>
                            <li><a href="#">이벤트</a></li>  
                            <li><a href="#">고객센터</a>
                            	<ul class="header__menu__dropdown">
                                    <li><a href="" style="font-size: 15px;">자주하는질문</a></li>
                                    <li><a href="" style="font-size: 15px;">1:1 문의</a></li>
                                </ul>
                            </li>    
                        </ul>
                    </nav>
                </div>
                
                <!-- <div class="col-lg-3">
                    <div class="header__cart">
                        <ul>
                            <li><a href="#"><i class="fa fa-heart"></i> <span>1</span></a></li>
                            <li><a href="#"><i class="fa fa-shopping-bag"></i> <span>3</span></a></li>
                        </ul>
                        <div class="header__cart__price">item: <span>$150.00</span></div>
                    </div>
                </div> -->
                
            </div>
            
            <div class="humberger__open">
                <i class="fa fa-bars"></i>
            </div>
            
        </div>
    </header>
    <!-- Header Section End -->

    <!-- Hero Section Begin -->
    <section class="hero hero-normal">
        <div class="container">
        
            <div class="row">
            
                <div class="col-lg-3">
                    <div class="hero__categories">
                        <div class="hero__categories__all">
                            <i class="fa fa-bars"></i>
                            <span>카테고리</span>
                        </div>
                        <ul>
                            <li><a href="list.product?PSUBCATEGORY='best'">베스트</a></li>
                            <li><a href="list.product?PSUBCATEGORY='new'">신상품</a></li>
                            <li><a href="list.product?PCATEGORY='food'">식품</a></li>
                            <li><a href="list.product?PCATEGORY='home'">생활용품</a></li>
                            <li><a href="list.product?PCATEGORY='baby'">베이비/키즈</a></li>
                            <li><a href="list.product?PCATEGORY='pet'">반려동물</a></li>
                        </ul>
                    </div>
                </div>
                
                <div class="col-lg-9">
                    <div class="hero__search">
                        <div class="hero__search__form">
                            <form action="list.product" method="get">
                            
                               <!--  <div class="hero__search__categories">
                                	전체검색
                                    <span class="arrow_carrot-down"></span>
                                </div> -->     
                                
                                <input type="text" name="keyword" placeholder="검색어를 입력하세요">
                                <button type="submit" class="site-btn">SEARCH</button>     
                               </form>      
                        </div>  
                        
                        <div class="hero__search__phone">
                            <a href="#"><img src="img/mypageimg11.png" width="50px" style="margin-right: 20px"></a>                           
                            <a href="#"><img src="img/cartimg11.png" width="50px" style="margin-right: 45px"> </a>                          
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Hero Section End -->
