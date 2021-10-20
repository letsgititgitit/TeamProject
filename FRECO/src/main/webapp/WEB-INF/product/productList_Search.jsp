<%@page import="product.model.ProductBean"%>
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
                        <h2>Search</h2>
                        <div class="breadcrumb__option">
                            <span>검색</span>  
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Breadcrumb Section End -->
    
    
    
    <!-- Featured Section Begin -->
    <section class="featured spad">
        <div class="container">
        
            <div class="row">
                <div class="col-lg-12">
                    <div class="section-title">
                        <h2>검색한 상품</h2>
                    </div>
                    <%-- <div class="featured__controls">
                        <ul>
                            <li <c:if test="${PSUBCATEGORY eq null}"> class="active" </c:if>>
                            	<a href="listSearh.product">All</a>
                            </li>
                            <li <c:if test="${PSUBCATEGORY eq '식품'}"> class="active" </c:if>>
                            	<a href="listSearh.product">식품</a>
                            </li>
                            <li <c:if test="${PSUBCATEGORY eq '생활용품'}"> class="active" </c:if>>
                            	<a href="listSearh.product">생활용품</a>
                            </li>
                            <li <c:if test="${PSUBCATEGORY eq '베이비∙키즈'}"> class="active" </c:if>>
                            	<a href="listSearh.product">베이비∙키즈</a>
                            </li>
                            <li <c:if test="${PSUBCATEGORY eq '반려동물'}"> class="active" </c:if>>
                            	<a href="listSearh.product">반려동물</a>
                            </li>
                        </ul>
                    </div>  --%>                  
                </div>
            </div>
            
            <div class="col-lg-4 col-md-7">
				<div class="filter__sort">
					<h4>총 &nbsp;<span>${totalCount}</span>건</h4>     
				</div>
			</div>
			
            <br><br><br>
            
			<c:if test="${empty searchLists}">
				<h2 align="center">해당 상품이 없습니다.</h2>
			</c:if>	
                            
			<div class="row">
                    
                    <c:forEach var="slist" items="${searchLists}">  
                        <div class="col-lg-4 col-md-6 col-sm-6">
                            <div class="product__item">
                                <div class="product__item__pic set-bg">
                                   
                                   <a href="pdetail.product?PNUM=${slist.PNUM}">
                                   		<img src="img/product/product_img/${slist.PSUBCATEGORY}/${slist.PNAME}/${slist.PIMG1}">
                                   </a>
                                   
                                    <ul class="product__item__pic__hover">
                                        <li><a href="pdetail.product?PNUM=${slist.PNUM}"><i class="fa fa-retweet"></i></a></li>
                                        <li><a onClick="cartPopup(${slist.PNUM},'${slist.PNAME}',1)"><i class="fa fa-shopping-cart"></i></a></li>
                                    </ul> 
                                </div>
                                <div class="product__item__text">
                                    <h6><a href="pdetail.product?PNUM=${slist.PNUM}">${slist.PNAME}</a></h6>
                                    <h5><fmt:formatNumber value="${slist.PPRICE}" pattern="###,###"/> 원</h5>  
                                </div>
                            </div>
                        </div>
                    </c:forEach>    
                    
			</div>
                   
<%-- 			<div class='product__pagination'>
				${pageInfo.getPagingHtml()}
			</div>  --%>    
	                    
		</div>
	</section>
    <!-- Product Section End -->

<%@include file="../display/bottom.jsp"%>
