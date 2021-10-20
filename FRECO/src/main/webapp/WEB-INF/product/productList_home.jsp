<%@page import="product.model.ProductBean"%>
<%@include file="../display/top_header.jsp" %>
<%@include file="../display/top.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@include file="../common/common.jsp" %>

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

	<!-- Breadcrumb Section Begin -->
    <section class="breadcrumb-section set-bg" data-setbg="img/banner_home.jpg">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 text-center">
                    <div class="breadcrumb__text">
                        <h2>HOME</h2>
                        <div class="breadcrumb__option">
                            <span>생활용품</span>  
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Breadcrumb Section End -->
	
    <!-- Product Section Begin -->
    <section class="product spad">
        <div class="container">  
            <div class="row">       
                <div class="col-lg-3 col-md-5">
                    <div class="sidebar">   
                    
                        <div class="sidebar__item">   
                            <h4>생활용품 카테고리</h4>    
                            <ul>
                                <li <c:if test="${PSUBCATEGORY eq null}"> class="active" </c:if>>
                                	<a href="list.product?PCATEGORY=생활용품">ALL</a></li>
                                	
                                <li <c:if test="${PSUBCATEGORY eq '리빙'}"> class="active" </c:if>>
                                	<a href="list.product?PCATEGORY=생활용품&PSUBCATEGORY=리빙">리빙</a></li>
                                	
                                <li <c:if test="${PSUBCATEGORY eq '주방'}"> class="active" </c:if>>
                                	<a href="list.product?PCATEGORY=생활용품&PSUBCATEGORY=주방">주방</a></li>
                                	
                                <li <c:if test="${PSUBCATEGORY eq '욕실'}"> class="active" </c:if>>
                                	<a href="list.product?PCATEGORY=생활용품&PSUBCATEGORY=욕실">욕실</a></li>
                            </ul>
                        </div>
                        
                        <hr>
                        
                        <div class="sidebar__item">
                            <h4>가격별</h4>       
                            <%
                            	String[] lineUpPrice_arr = {"5,000원 이하", "10,000원 이하", "15,000원 이하", "20,000원 이하", "20,000원 이상"};
                            	request.setAttribute("lineUpPrice_arr", lineUpPrice_arr);
                            %>
                            	<div class="sidebar__item__price">
	                                <input type="button" name="lineUpPrice" value="전체 선택" 
	                                	<c:if test="${lineUpPrice == null}"> class="activePrice" </c:if>
	                                	onClick="if(this.value) 
	                                	location.href='list.product?PCATEGORY=생활용품&PSUBCATEGORY=${PSUBCATEGORY}'">
	                            </div>
                            
                            <c:forEach var="i" begin="0" end="${fn:length(lineUpPrice_arr)-1}" step="1">
	                            <div class="sidebar__item__price">
	                                <input type="button" name="lineUpPrice" value="${lineUpPrice_arr[i]}" 
	                                	<c:if test="${lineUpPrice_arr[i] == lineUpPrice}"> class="activePrice" </c:if>
	                                	onClick="if(this.value) 
	                                	location.href='list.product?&lineUpPrice=${lineUpPrice_arr[i]}&PCATEGORY=생활용품&PSUBCATEGORY=${PSUBCATEGORY}'">
	                            </div>
                            </c:forEach>
                            
                        </div>
                    </div>
                </div>
                
                <div class="col-lg-9 col-md-7">
                    <div class="product__discount">
                        <div class="section-title product__discount__title">
                            <h2>HOME BEST</h2>  
                        </div>
                        <div class="row">
                            <div class="product__discount__slider owl-carousel">
                            
                            <!-- 총 6개 for문 돌리기 -->
                             <c:forEach var="blists" items="${bestItem}" begin="0" end="5" step="1">
                                <div class="col-lg-4">
                                    <div class="product__discount__item">
                                        <div class="product__discount__item__pic set-bg">
                                            
                                            <a href="pdetail.product?${blists.PNUM}">
                                            	<img src="img/product/big/${blists.PSUBCATEGORY}/${blists.PIMG1}">
                                            </a>
                                            
                                            <div class="product__discount__percent">BEST</div>    
                                            <ul class="product__item__pic__hover">
                     					   <!-- <li><a href="#"><i class="fa fa-heart"></i></a></li> -->
                                                <li><a href="pdetail.product?${blists.PNUM}"><i class="fa fa-retweet"></i></a></li>
                                                <li><a onClick="cartPopup(${blists.PNUM},'${blists.PNAME}',1)"><i class="fa fa-shopping-cart"></i></a></li>
                                            </ul>
                                        </div>
                                        
                                        <div class="product__discount__item__text">
                                            <span>${blists.PSUBCATEGORY}</span>
                                            <h5><a href="#">${blists.PNAME}</a></h5>
                                            <div class="product__item__price">
                                            	<fmt:formatNumber value="${blists.PPRICE}" pattern="###,###"/> 원</div>
                                        </div>
                                        
                                    </div>
                                </div>
                              </c:forEach>
                                
                            </div>
                        </div>
                    </div>
                    
                    <div class="filter__item">
                        <div class="row">
                            <div class="col-lg-4 col-md-5">
                                <div class="filter__sort">
                                    <span>정렬 설정</span>  
                                    
                                    <select onChange="if(this.value) location.href=(this.value);">
                                        <option value="list.product?PCATEGORY=생활용품&PSUBCATEGORY=${PSUBCATEGORY}"
                                        	<c:if test="${fn:contains(lineUp, null)}"> selected </c:if> >추천순</option>
                                        <option value="list.product?PCATEGORY=생활용품&PSUBCATEGORY=${PSUBCATEGORY}&lineUpPrice=${lineUpPrice}&lineUp=신상품순"
                                        	<c:if test="${fn:contains(lineUp, '신상품순')}"> selected </c:if> >신상품순</option>
                                        <option value="list.product?PCATEGORY=생활용품&PSUBCATEGORY=${PSUBCATEGORY}&lineUpPrice=${lineUpPrice}&lineUp=인기상품순"
                                        	<c:if test="${fn:contains(lineUp, '인기상품순')}"> selected </c:if> >인기상품순</option>
                                        <option value="list.product?PCATEGORY=생활용품&PSUBCATEGORY=${PSUBCATEGORY}&lineUpPrice=${lineUpPrice}&lineUp=낮은가격순"
                                        	<c:if test="${fn:contains(lineUp, '낮은가격순')}"> selected </c:if> >낮은 가격순</option>
                                        <option value="list.product?PCATEGORY=생활용품&PSUBCATEGORY=${PSUBCATEGORY}&lineUpPrice=${lineUpPrice}&lineUp=높은가격순"	
                                        	<c:if test="${fn:contains(lineUp, '높은가격순')}"> selected </c:if> >높은 가격순</option>
                                    </select>
                                    
                                </div>
                            </div>
                            
                            <div class="col-lg-4 col-md-7">
                                <div class="filter__found">
                                    <h6>총 &nbsp;<span>${totalCount}</span>건</h6>     
                                </div>
                            </div>
                           
                           <br><br><br>
                           <c:if test="${empty lists}">
                				등록된 상품이 없습니다.
                			</c:if>	
                           
                        </div>
                    </div>
                    
                    <div class="row">
                    
                    <c:forEach var="bean" items="${lists}">  
                        <div class="col-lg-4 col-md-6 col-sm-6">
                            <div class="product__item">
                                <div class="product__item__pic set-bg" data-setbg="img/product/big/${bean.PSUBCATEGORY}/${bean.PIMG1}">
                                    <ul class="product__item__pic__hover">
                                        <li><a href="#"><i class="fa fa-retweet"></i></a></li>
                                        <li><a onClick="cartPopup(${bean.PNUM},'${bean.PNAME}',1)"><i class="fa fa-shopping-cart"></i></a></li>
                                    </ul>
                                </div>
                                <div class="product__item__text">
                                    <h6><a href="#">${bean.PNAME}</a></h6>
                                    <h5><fmt:formatNumber value="${bean.PPRICE}" pattern="###,###"/> 원</h5>   
                                </div>
                            </div>
                        </div>
                    </c:forEach>    
                    
                    </div>
                    
                    <div class='product__pagination'>
	                	${pageInfo.getPagingHtml()}
	               </div> 
                    
                </div>
            </div>
        </div>
    </section>
    <!-- Product Section End -->

<%@include file="../display/bottom.jsp"%>
