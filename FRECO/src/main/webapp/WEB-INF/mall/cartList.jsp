<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>  
<%@include file="../display/top.jsp" %>
<%@include file="../common/common.jsp" %>  


<style type="text/css">
 a:link { color: black; text-decoration: none;}
 a:visited { color: black; text-decoration: none;}
 a:hover { color: #388233; text-decoration: none;}
 
 	.cart-change-btn {
	font-size: 13px;
	color: #ffffff;
	font-weight: 700;
	text-transform: uppercase;
	display: inline-block;
	padding: 8px 15px 7px;
	background: #7fad39;
	border: none;
}
</style>


 <section class="breadcrumb-section set-bg" data-setbg="img/breadcrumb.jpg">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 text-center">
                    <div class="breadcrumb__text">
                        <h2>Shopping Cart</h2>
                        <div class="breadcrumb__option">                         
                            <span>장바구니</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Breadcrumb Section End -->
	
    <!-- Shoping Cart Section Begin -->
    <section class="shoping-cart spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="shoping__cart__table">
                        <table>
                            <thead>
                                <tr>
                                    <th class="shoping__product">상품</th>
                                    <th>가격</th>
                                    <th>수량</th>
                                    <th>총액</th>
                                    <th></th>
                                </tr>
                            </thead>
                            <tbody>
                            	
                            	<c:if test="${empty cartList}">									
									<tr align="center">
										<td colspan="4">장바구니에 담긴 상품이 없습니다.</td>
									</tr>									
								</c:if>
                            	
                            	<c:forEach var="cart" items="${cartList}">      
                            	                     	
                                <tr>
                                    <td class="shoping__cart__item">
                                        <img width="80" height="80"src="img/product/product_img/${cart.PSUBCATEGORY }/${cart.PNAME }/${cart.PIMG1 }" alt="">
                                        <fmt:formatNumber var="PNUM" value="${cart.PNUM}"/>                                                                      				 
                                        <h5><a href="pdetail.product?PNUM=${PNUM}">${cart.PNAME }</a></h5>                                      
                                    </td>
                                    <td class="shoping__cart__price">                                   
                                     	<fmt:formatNumber var="PPRICE" value="${cart.PPRICE}" pattern="###,###"/>
                                     		${PPRICE }                                      
                                         <a style="font-size:16px">
                                         <fmt:formatNumber var="PPOINT" value="${cart.PPOINT}" pattern="###,###"/>
                                         [point:${PPOINT}]</a>
                                    </td>
                                    
                                    <td class="shoping__cart__quantity">
                                        <form action="cartupdate.mall" method="post">
                                         <input type="hidden" name="PNUM" value="${cart.PNUM }">
                                        <div class="quantity">                                        
                                           <div class="pro-qty">                                          
                                                <input type="text" name="ORDERPQTY" value="${cart.ORDERPQTY }">                                                                                                                                                                                                                
                                             </div> 
                                              
                                             <input class="cart-change-btn" type="submit" value="변경">                                            
                                        </div>  
                                        </form>                                   
                                    </td> 
                                                                      
                                    <td class="shoping__cart__total">
                                        <fmt:formatNumber var="AMOUNTPRICE" value="${cart.AMOUNTPRICE}" pattern="###,###"/>                                       
                                        ${AMOUNTPRICE}
                                        <a style="font-size:16px">
                                        <fmt:formatNumber var="AMOUNTPOINT" value="${cart.AMOUNTPOINT}" pattern="###,###"/>
                                        [point:${AMOUNTPOINT}]</a>
                                    </td>
                                    
                                    <td class="shoping__cart__item__close">
                                        <a href="cartdel.mall?PNUM=${cart.PNUM}"><span class="icon_close"></span></a>
                                    </td>
                                </tr>
                               </c:forEach>
                              
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-lg-6">
                    <div class="shoping__cart__btns">
                        <a href="javascript:history.go(-1)" class="primary-btn cart-btn">쇼핑 계속하기</a>                        
                    </div>
                </div>                                                 
                <div class="col-lg-6">
                    <div class="shoping__checkout">
                        <h5>장바구니 총합</h5>
                        <ul>
                        	<fmt:formatNumber var="totalPoint" value="${totalPoint}" pattern="###,###"/>
                        	<fmt:formatNumber var="totalPrice" value="${totalPrice}" pattern="###,###"/>
                            <li>Total Price<span>${totalPrice }</span></li>
                            <li>Total Point <span>${totalPoint }</span></li>                      
                        </ul>
                       
                        <a href="payment.mall" class="primary-btn">결제하기</a>
                    </div>
                </div>          
            </div>
        </div>
    </section>
    <!-- Shoping Cart Section End -->

<%@include file="../display/bottom.jsp" %>
