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
    <section class="breadcrumb-section set-bg" data-setbg="img/banner_food.jpg">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 text-center">
                    <div class="breadcrumb__text">
                        <h2>BEST</h2>
                        <div class="breadcrumb__option">
                            <span>베스트</span>  
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
                    
 <%--                        <div class="sidebar__item">   
                            <h4>카테고리</h4>    
                            <ul>
                                <li <c:if test="${PSUBCATEGORY eq null}"> class="active" </c:if>>
                                	<a href="blist.product?PCATEGORY=베스트">ALL</a></li>
                                	
                                <li <c:if test="${PSUBCATEGORY eq '식품'}"> class="active" </c:if>>
                                	<a href="list.product?PCATEGORY=식품">식품</a></li>
                                	
                                <li <c:if test="${PSUBCATEGORY eq '생활용품'}"> class="active" </c:if>>
                                	<a href="list.product?PCATEGORY=생활용품">생활용품</a></li>
                                	
                                <li <c:if test="${PSUBCATEGORY eq '베이비∙키즈'}"> class="active" </c:if>>
                                	<a href="list.product?PCATEGORY=베이비∙키즈">베이비∙키즈</a></li>
                                
                                <li <c:if test="${PSUBCATEGORY eq '반려동물'}"> class="active" </c:if>>
                                	<a href="list.product?PCATEGORY=반려동물">반려동물</a></li>
                            </ul>
                        </div> 
                        
                        <hr>
                    --%>     
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
	                                	location.href='blist.product?PCATEGORY=베스트&PSUBCATEGORY=${PSUBCATEGORY}'">
	                            </div>
                            
                            <c:forEach var="i" begin="0" end="${fn:length(lineUpPrice_arr)-1}" step="1">
	                            <div class="sidebar__item__price">
	                                <input type="button" name="lineUpPrice" value="${lineUpPrice_arr[i]}" 
	                                	<c:if test="${lineUpPrice_arr[i] == lineUpPrice}"> class="activePrice" </c:if>
	                                	onClick="if(this.value) 
	                                	location.href='blist.product?&lineUpPrice=${lineUpPrice_arr[i]}&PCATEGORY=베스트&PSUBCATEGORY=${PSUBCATEGORY}'">
	                            </div>
                            </c:forEach>                          
                        </div>
                        
                    </div>
                </div>
                
                <div class="col-lg-9 col-md-7">
                    <div class="product__discount">                   
                        <div class="section-title product__discount__title">
                            <h2>BEST TOP 5</h2>  
                        </div>
                        
                        <div class="row">
                            <div class="product__discount__slider owl-carousel">

                            <!-- 총 5개 for문 돌리기 -->
                            <c:forEach var="blists" items="${bestItem}" begin="0" end="4" step="1">
                                <div class="col-lg-4">
                                    <div class="product__discount__item">
                                        <div class="product__discount__item__pic set-bg">  
                                             
                                            <a href="pdetail.product?PNUM=${blists.PNUM}">
                                            	<img src="img/product/product_img/${blists.PSUBCATEGORY}/${blists.PNAME}/${blists.PIMG1}">
                                            </a>
                                         
                                            <div class="product__discount__percent">BEST</div>    
                                            <ul class="product__item__pic__hover">
                                                <li><a href="pdetail.product?PNUM=${blists.PNUM}"><i class="fa fa-retweet"></i></a></li>
                                                <li><a onClick="cartPopup(${blists.PNUM},'${blists.PNAME}',1)"><i class="fa fa-shopping-cart"></i></a></li>
                                            </ul>
                                        </div>
                                        
                                        <div class="product__discount__item__text">
                                            <span>${blists.PSUBCATEGORY}</span>
                                            <h5><a href="pdetail.product?PNUM=${blists.PNUM}">${blists.PNAME}</a></h5>
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
                                        <option value="blist.product?PCATEGORY=베스트"
                                        	<c:if test="${fn:contains(lineUp, null)}"> selected </c:if> >추천순</option>
                                        <option value="blist.product?PCATEGORY=베스트&lineUpPrice=${lineUpPrice}&lineUp=신상품순"
                                        	<c:if test="${fn:contains(lineUp, '신상품순')}"> selected </c:if> >신상품순</option>
                                     <%--    <option value="blist.product?PCATEGORY=베스트&lineUpPrice=${lineUpPrice}&lineUp=인기상품순"
                                        	<c:if test="${fn:contains(lineUp, '인기상품순')}"> selected </c:if> >인기상품순</option> --%>
                                        <option value="blist.product?PCATEGORY=베스트&lineUpPrice=${lineUpPrice}&lineUp=낮은가격순"
                                        	<c:if test="${fn:contains(lineUp, '낮은가격순')}"> selected </c:if> >낮은 가격순</option>
                                        <option value="blist.product?PCATEGORY=베스트&lineUpPrice=${lineUpPrice}&lineUp=높은가격순"	
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
                				해당 상품이 없습니다.
                			</c:if>	
                    
                           <!--  <div class="col-lg-4 col-md-3">
                                <div class="filter__option">
                                    <span class="icon_grid-2x2"></span>
                                    <span class="icon_ul"></span>
                                </div>
                            </div> -->
                            
                        </div>
                    </div>
                    
                    <div class="row">
                    
                    <c:forEach var="bean" items="${lists}">  
                        <div class="col-lg-4 col-md-6 col-sm-6">
                            <div class="product__item">
                                <div class="product__item__pic set-bg">
                                   
                                   <a href="pdetail.product?PNUM=${bean.PNUM}">
                                   		<img src="img/product/product_img/${bean.PSUBCATEGORY}/${bean.PNAME}/${bean.PIMG1}">
                                   </a>
                                   
                                    <ul class="product__item__pic__hover">
                                        <li><a href="pdetail.product?PNUM=${bean.PNUM}"><i class="fa fa-retweet"></i></a></li>
                                        <li><a onClick="cartPopup(${bean.PNUM},'${bean.PNAME}',1)"><i class="fa fa-shopping-cart"></i></a></li>
                                    </ul> 
                                </div>
                                <div class="product__item__text">
                                    <h6><a href="pdetail.product?PNUM=${bean.PNUM}">${bean.PNAME}</a></h6>
                                    <h5><fmt:formatNumber value="${bean.PPRICE}" pattern="###,###"/> 원</h5>  
                                </div>
                            </div>
                        </div>
                    </c:forEach>    
                    
                    </div>
                   
                   <div class='product__pagination'>
	                	${pageInfo.getPagingHtml()}
	               </div>     
	                    
                   <!-- <div class="product__pagination">
                       	<a href="#">1</a>
                        <a href="#">2</a>
                        <a href="#">3</a>
                        <a href="#"><i class="fa-long-arrow-right"></i></a>
                    </div>
                     -->
                    
                </div>
            </div>
        </div>
    </section>
    	</form>
    <!-- Product Section End -->

<%@include file="../display/bottom.jsp"%>
