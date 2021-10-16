<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>FRECO-관리자 페이지</title>
        <link href="https://cdn.jsdelivr.net/npm/simple-datatables@latest/dist/style.css" rel="stylesheet" />
        <link href="css/adminstyles.css" rel="stylesheet" />
        <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/js/all.min.js" crossorigin="anonymous"></script>
     
       <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/3.5.1/chart.min.js" integrity="sha512-Wt1bJGtlnMtGP0dqNFH1xlkLBNpEodaiQ8ZN5JLA5wpc1sUlk/O5uuOMNgvzddzkpvZ9GLyYNa8w2s7rqiTk5Q==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
       <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/3.5.1/chart.esm.js" integrity="sha512-IPqefcmFCuGcYxl/uIjvyCXwh5T9+EB2MFT7W9RUZd20d7PLfgdT975xdhyesvdXH6Au8SyXOw1236LY1lFl5Q==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
       <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/3.5.1/chart.esm.min.js" integrity="sha512-2Vi/lCX8NaXlAhzc28RAoteYAiJVoz4y3Xq/IpHQCw7KU25I34fDqJSVSUml2tQRVYFnf3IMy6O59zKJh79hiw==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
       <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/3.5.1/chart.js" integrity="sha512-b3xr4frvDIeyC3gqR1/iOi6T+m3pLlQyXNuvn5FiRrrKiMUJK3du2QqZbCywH6JxS5EOfW0DY0M6WwdXFbCBLQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
       <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/3.5.1/helpers.esm.js" integrity="sha512-/2SCtwX/TWXQ8kJN8MhCXL5GQJkBhh5J184Uy/totMp+1pFXTQhV/hMMYHuSl+juR5WO9i11AvywRgYFotRIug==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
       <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/3.5.1/helpers.esm.min.js" integrity="sha512-b3xZ1Eh852+/Ltha4XJd59YP2d+I+B6NPdB4H+Wns29GX9x5pLwlp8jnQtJYog3d5Xk1SWvhT2lgJDDBvpV0ow==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
    
     
    
    
    
    </head>
    <body class="sb-nav-fixed" onLoad="init('${productBean.PCATEGORY}','${productBean.PSUBCATEGORY}')">
        <nav class="sb-topnav navbar navbar-expand navbar-dark bg-dark">
            <!-- Navbar Brand-->
            <a class="navbar-brand ps-3" href="main.admin">FRECO ADMIN</a>
            <!-- Sidebar Toggle-->
            <button class="btn btn-link btn-sm order-1 order-lg-0 me-4 me-lg-0" id="sidebarToggle" href="#!"><i class="fas fa-bars"></i></button>
            <!-- Navbar Search-->
            <a class="d-none d-md-inline-block form-inline ms-auto me-0 me-md-3 my-2 my-md-0"></a>           
            <!-- Navbar-->
            <ul class="navbar-nav ms-auto ms-md-0 me-3 me-lg-4">
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" id="navbarDropdown" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false"><i class="fas fa-user fa-fw"></i></a>
                    <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="navbarDropdown">
                        <li><a class="dropdown-item" href="main.mall">Home</a></li>
                    </ul>
                </li>
            </ul>
        </nav>
        <div id="layoutSidenav">
            <div id="layoutSidenav_nav">
                <nav class="sb-sidenav accordion sb-sidenav-dark" id="sidenavAccordion">
                    <div class="sb-sidenav-menu">
                        <div class="nav">
                            <div class="sb-sidenav-menu-heading">Core</div>
                            <a class="nav-link" href="main.admin">
                                <div class="sb-nav-link-icon"><i class="fas fa-tachometer-alt"></i></div>
                                ADMIN MAIN
                            </a>
                            <div class="sb-sidenav-menu-heading">회원 관리</div>
                             <a class="nav-link" href="memberList.admin">
                                <div class="sb-nav-link-icon"><i class="fas fa-table"></i></div>
                                회원 목록
                            </a>
                            <a class="nav-link" href="inquiry.admin">
                                <div class="sb-nav-link-icon"><i class="fas fa-table"></i></div>
                                회원 문의
                            </a>
                                         
                            <div class="sb-sidenav-menu-heading">입출력 관리</div>
                            <a class="nav-link collapsed" href="#" data-bs-toggle="collapse" data-bs-target="#collapseLayouts" aria-expanded="false" aria-controls="collapseLayouts">
                                <div class="sb-nav-link-icon"><i class="fas fa-columns"></i></div>
                                상품
                                <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                            </a>
                            <div class="collapse" id="collapseLayouts" aria-labelledby="headingOne" data-bs-parent="#sidenavAccordion">
                                <nav class="sb-sidenav-menu-nested nav">                         
                                    <a class="nav-link" href="plist.product">상품 목록</a>
                                    <a class="nav-link" href="pinsert.product">상품 등록</a>
                                </nav>
                            </div> 
                            
                              <a class="nav-link collapsed" href="#" data-bs-toggle="collapse" data-bs-target="#collapsePages" aria-expanded="false" aria-controls="collapsePages">
                                <div class="sb-nav-link-icon"><i class="fas fa-columns"></i></div>
                                쿠폰
                                <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                            </a>
                            <div class="collapse" id="collapsePages" aria-labelledby="headingTwo" data-bs-parent="#sidenavAccordion">
                                <nav class="sb-sidenav-menu-nested nav">
                           	        <a class="nav-link" href="clist.admin">쿠폰 목록</a>                                
                                    <a class="nav-link" href="cinsert.admin">쿠폰 등록</a>           
                                </nav>                                                          
                            </div>
                            
                            <div class="sb-sidenav-menu-heading">주문 관리</div>
                             <a class="nav-link" href="order.admin">
                                <div class="sb-nav-link-icon"><i class="fas fa-table"></i></div>
                                주문 목록
                            </a>
                            
                         
                        </div>
                    </div>                    
                </nav>
            </div>