<%@page import="product.model.ProductBean"%>
<%@include file="../display/top_header.jsp" %>
<%@include file="../display/top.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@include file="../common/common.jsp" %>

<link rel="stylesheet" href="css/rating.css" type="text/css">
<style type="text/css">
	table{
		text-align: left;
    	margin: 10px 50px;
	}
	td{
		padding: 0px 20px 50px;
	}
</style>

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
	
	<c:if test="${pbean.PCATEGORY eq '생활용품'}">
		<c:set var="cateImg" value="banner_home.jpg"/>
	</c:if>
	<c:if test="${pbean.PCATEGORY eq '식품'}">
		<c:set var="cateImg" value="banner_food.jpg"/>
	</c:if>
	<c:if test="${pbean.PCATEGORY eq '베이비∙키즈'}">
		<c:set var="cateImg" value="banner_baby.jpg"/>
	</c:if>
	<c:if test="${pbean.PCATEGORY eq '반려동물'}">
		<c:set var="cateImg" value="banner_pet.jpg"/>
	</c:if>
	
    <!-- Breadcrumb Section Begin -->
    <section class="breadcrumb-section set-bg" data-setbg="img/${cateImg}">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 text-center">
                    <div class="breadcrumb__text">
                        <h2>${pbean.PNAME}</h2>
                        <div class="breadcrumb__option">
                            <a href="list.product?PCATEGORY=${pbean.PCATEGORY}">${pbean.PCATEGORY}</a>
                            <a href="list.product?PCATEGORY=${pbean.PCATEGORY}&PSUBCATEGORY=${PSUBCATEGORY}">${pbean.PSUBCATEGORY}</a>
                            <span>${pbean.PNAME}</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Breadcrumb Section End -->

    <!-- Product Details Section Begin -->
    <section class="product-details spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-6 col-md-6">
                    <div class="product__details__pic">
                        <div class="product__details__pic__item">
                            <img class="product__details__pic__item--large"
                                src="img/product/product_img/${pbean.PSUBCATEGORY}/${pbean.PNAME}/${pbean.PIMG1}" alt="${pbean.PIMG1}">
                        </div>
                        <div class="product__details__pic__slider owl-carousel">
                            <img data-imgbigurl="img/product/product_img/${pbean.PSUBCATEGORY}/${pbean.PNAME}/${pbean.PIMG2}"
                                src="img/product/product_img/${pbean.PSUBCATEGORY}/${pbean.PNAME}/${pbean.PIMG2}" alt="${pbean.PIMG2}">
                                
                            <img data-imgbigurl="img/product/product_img/${pbean.PSUBCATEGORY}/${pbean.PNAME}/${pbean.PIMG3}"
                                src="img/product/product_img/${pbean.PSUBCATEGORY}/${pbean.PNAME}/${pbean.PIMG3}" alt="${pbean.PIMG3}">
                                
                            <img data-imgbigurl="img/product/product_img/${pbean.PSUBCATEGORY}/${pbean.PNAME}/${pbean.PIMG4}"
                                src="img/product/product_img/${pbean.PSUBCATEGORY}/${pbean.PNAME}/${pbean.PIMG4}" alt="${pbean.PIMG4}">
                                
                            <img data-imgbigurl="img/product/product_img/${pbean.PSUBCATEGORY}/${pbean.PNAME}/${pbean.PIMG5}"
                                src="img/product/product_img/${pbean.PSUBCATEGORY}/${pbean.PNAME}/${pbean.PIMG5}" alt="${pbean.PIMG5}">
                        </div>
                    </div>
                </div>
                
                <div class="col-lg-6 col-md-6">
                    <div class="product__details__text">
                    
                        <h3>${pbean.PNAME}</h3>
                        <div class="product__details__rating">
                        	<c:if test="${average == 0}">
                        			☆ ☆ ☆ ☆ ☆
                        	</c:if>
                        	<c:if test="${average == 1}">
	                            <i class="fa fa-star"></i>
                        	</c:if>
                        	<c:if test="${average == 2}">
	                            <i class="fa fa-star"></i>
	                            <i class="fa fa-star"></i>
                        	</c:if>
                        	<c:if test="${average == 3}">
	                            <i class="fa fa-star"></i>
	                            <i class="fa fa-star"></i>
	                            <i class="fa fa-star"></i>
                        	</c:if>
                        	<c:if test="${average == 4}">
	                            <i class="fa fa-star"></i>
	                            <i class="fa fa-star"></i>
	                            <i class="fa fa-star"></i>
	                            <i class="fa fa-star"></i>
                        	</c:if>
                        	<c:if test="${average == 5}">
	                            <i class="fa fa-star"></i>
	                            <i class="fa fa-star"></i>
	                            <i class="fa fa-star"></i>
	                            <i class="fa fa-star"></i>
	                            <i class="fa fa-star"></i>
                        	</c:if> 
                        	 &nbsp;&nbsp;  ${average}
                            <span>(${totalCountRating} reviews)</span>
                        </div>
                        
                        <div class="product__details__price">
                        	<fmt:formatNumber value="${pbean.PPRICE}" pattern="###,###"/> 원
                        </div>
                        
                        <p>
                        	<ul>
	                            <li><b>상품디테일</b> <span>( ${pbean.PCATEGORY} - ${pbean.PSUBCATEGORY} - ${pbean.PNAME} )</span></li>
	                            <li><b>재고 수량</b> <span>${pbean.PQTY} <samp>&nbsp;&nbsp; Free pickup today</samp></span></li>
	                            <li><b>적립 포인트</b> <span>${pbean.PPOINT}</span></li>
                        	</ul>
                        </p>
                            
                        <div class="product__details__quantity">
                            <div class="quantity">
                                <div class="pro-qty">
                                    <input type="text" value="1" id="ORDERPQTY2" name="ORDERPQTY">
                                </div>
                            </div>
                        </div>
                        
                        <a type="button" onClick="cartPopup(${pbean.PNUM},'${pbean.PNAME}',ORDERPQTY2.value)" class="primary-btn">ADD TO CARD</a>
                    </div>
                </div>
                
                <div class="col-lg-12">
                    <div class="product__details__tab">
                    
                        <ul class="nav nav-tabs" role="tablist">
                            <li class="nav-item">
                                <a class="nav-link active" data-toggle="tab" href="#tabs-1" role="tab"
                                    aria-selected="true">상품 정보</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" data-toggle="tab" href="#tabs-2" role="tab"
                                    aria-selected="false">상세 정보</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" data-toggle="tab" href="#tabs-3" role="tab"
                                    aria-selected="false">상품 리뷰<span>(${totalCountRating})</span></a>
                            </li>
                        </ul>
                        
                        <div class="tab-content">
                        
                            <div class="tab-pane active" id="tabs-1" role="tabpanel">
                                <div class="product__details__tab__desc">
                                    <p>
                                    	<!-- 상품 설명  -->
                                    	<img src="img/product/product_img/${pbean.PSUBCATEGORY}/${pbean.PNAME}/${pbean.PSUBIMG}" alt="${pbean.PSUBIMG}">
                                    </p>
                                </div> 
                            </div>
                            
                            <div class="tab-pane" id="tabs-2" role="tabpanel">
                                <div class="product__details__tab__desc">
                                    <p>
                                    	<!-- 상품 info  -->
                                    	<img src="img/product/product_img/${pbean.PSUBCATEGORY}/${pbean.PNAME}/${pbean.PINFOIMG}" alt="${pbean.PINFOIMG}">
                                    </p>
                                </div>
                            </div>
                            
                            <div class="tab-pane" id="tabs-3" role="tabpanel">
                                <div class="product__details__tab__desc">
                                
                                    <p>
                                    	<!-- 여기서부터 리뷰 -->
										<table>
											<c:if test="${empty relists}">
                                    			<tr>
                                    				<td>리뷰가 없습니다.</td>
                                    			</tr>
                                    		</c:if>
										 
											<c:forEach var="rebean" items="${relists}">
											
											<!-- 관리자라면 -->
											<c:if test="${rebean.RRELEVEL > 0}">
												<tr>
													<td style="background-color: gray;">
														<b>${rebean.RID}</b><br>
														${rebean.RCONTENT}
													</td>
												</tr>
											</c:if>
											
											<!-- 사용자라면(이미지 있을때) -->
											<c:if test="${!empty rebean.RIMG}">
												<tr>
													<th colspan="2">
														 ${rebean.RID} 
														<c:if test="${rebean.RRELEVEL == 0}">
																 <div class="product__details__text">
											                        <div class="product__details__rating">
											                        	<c:if test="${rebean.RRATING == 1}">
												                            <i class="fa fa-star"></i>
											                        	</c:if>
											                        	<c:if test="${rebean.RRATING == 2}">
												                            <i class="fa fa-star"></i>
												                            <i class="fa fa-star"></i>
											                        	</c:if>
											                        	<c:if test="${rebean.RRATING == 3}">
												                            <i class="fa fa-star"></i>
												                            <i class="fa fa-star"></i>
												                            <i class="fa fa-star"></i>
											                        	</c:if>
											                        	<c:if test="${rebean.RRATING == 4}">
												                            <i class="fa fa-star"></i>
												                            <i class="fa fa-star"></i>
												                            <i class="fa fa-star"></i>
												                            <i class="fa fa-star"></i>
											                        	</c:if>
											                        	<c:if test="${rebean.RRATING == 5}">
												                            <i class="fa fa-star"></i>
												                            <i class="fa fa-star"></i>
												                            <i class="fa fa-star"></i>
												                            <i class="fa fa-star"></i>
												                            <i class="fa fa-star"></i>
											                        	</c:if> 
											                            <span>(${rebean.RRATING})</span>
											                        </div>
																</div>
														</c:if>
													</th>
												</tr>
												<tr>
													<td>
														<img src="<%=request.getContextPath() %>/resources/${rebean.RIMG}" width="150px" height="150px">
													</td>
													<td>${rebean.RCONTENT}</td>
												</tr>
											</c:if>
											
											<!-- 사용자라면(이미지없을때) -->
											<c:if test="${empty rebean.RIMG}">
												<tr>
													<th>${rebean.RID}
														<c:if test="${rebean.RRELEVEL == 0}">
															<div class="product__details__text">
																<div class="product__details__rating">
																	<c:if test="${rebean.RRATING == 1}">
																		<i class="fa fa-star"></i>
																	</c:if>
																	<c:if test="${rebean.RRATING == 2}">
																		<i class="fa fa-star"></i>
																		<i class="fa fa-star"></i>
																	</c:if>
																	<c:if test="${rebean.RRATING == 3}">
																		<i class="fa fa-star"></i>
																		<i class="fa fa-star"></i>
																		<i class="fa fa-star"></i>
																	</c:if>
																	<c:if test="${rebean.RRATING == 4}">
																		<i class="fa fa-star"></i>
																		<i class="fa fa-star"></i>
																		<i class="fa fa-star"></i>
																		<i class="fa fa-star"></i>
																	</c:if>
																	<c:if test="${rebean.RRATING == 5}">
																		<i class="fa fa-star"></i>
																		<i class="fa fa-star"></i>
																		<i class="fa fa-star"></i>
																		<i class="fa fa-star"></i>
																		<i class="fa fa-star"></i>
																	</c:if>
																	<span>(${rebean.RRATING})</span>
																</div>
															</div>
														</c:if>
													</th>
												</tr>
												<tr>
													<td colspan="2">${rebean.RCONTENT}</td>
												</tr>
												</c:if>
											</c:forEach>
										</table>
										
										<div class='product__pagination'>
	                						${pageInfo.getPagingHtml()}
	               						</div>
                                    </p>
                                    
                                </div>
                            </div>
                            
                        </div>
                        
                    </div>
                </div>
                
            </div>
        </div>
    </section>
    <!-- Product Details Section End -->

    <!-- Related Product Section Begin -->
    <section class="related-product">
        <div class="container">
        
            <div class="row">
                <div class="col-lg-12">
                    <div class="section-title related__product__title">
                        <h2>추천 상품</h2>
                    </div>
                </div>
            </div>
            
            <div class="row">
            
             <c:forEach var="WPnum" items="${withoutPnum}" begin="0" end="3" step="1">
                <div class="col-lg-3 col-md-4 col-sm-6">
                    <div class="product__item">
                        <div class="product__item__pic set-bg" 
                        	 data-setbg="img/product/product_img/${WPnum.PSUBCATEGORY}/${WPnum.PNAME}/${WPnum.PIMG1}">
                            <ul class="product__item__pic__hover">
                                <li><a href="pdetail.product?PNUM=${WPnum.PNUM}"><i class="fa fa-retweet"></i></a></li>
                                <li><a onClick="cartPopup(${WPnum.PNUM},'${WPnum.PNAME}',1)"><i class="fa fa-shopping-cart"></i></a></li>
                            </ul>
                        </div>
                        <div class="product__item__text">
                            <h6><a href="pdetail.product?PNUM=${WPnum.PNUM}">${WPnum.PNAME}</a></h6>
                            <h5><fmt:formatNumber value="${WPnum.PPRICE}" pattern="###,###"/> 원</h5>
                        </div>
                    </div>
                </div>
              </c:forEach>    
                
            </div>
        </div>
    </section>
    <!-- Related Product Section End -->

<%@include file="../display/bottom.jsp"%>


												
