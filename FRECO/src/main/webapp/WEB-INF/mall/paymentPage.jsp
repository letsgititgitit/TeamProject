<%@include file="../display/top.jsp" %>
<%@include file="../common/common.jsp" %> 
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<script type="text/javascript">
	function selcoupon(){
		//alert("쿠폰선택");
		selIndex = document.myform.selcou.selectedIndex; 
		selText = document.myform.selcou.options[selIndex].text;    
		//alert(selIndex, selValue);        
		myarea = document.getElementById("result1");
		myarea.innerHTML= selText;    
	}

	function onlyNumber(memPoint, tprice){
		//alert(tprice);
		
		var e = event.srcElement;
		var num = "0123456789";
		i = e.value.length-1
		ch= e.value.charAt(i); 
		if( num.indexOf(ch)==-1){
			alert("사용 포인트는 숫자만 입력하세요.");
 			document.myform.useMPOINT.value= null;
 			document.myform.useMPOINT.focus();
		}
		
		var inputValue = document.myform.useMPOINT.value;
		var selValue = document.myform.selcou.options[selIndex].value;
		//alert(inputValue);
		
		if( inputValue > memPoint){
			alert("사용가능 포인트보다 많습니다. \n 사용하실 포인트를 다시 입력해 주십시오.");
			document.myform.useMPOINT.value = null;
			document.myform.useMPOINT.focus();
		}
		else{
			myarea = document.getElementById("result2");
			myarea.innerHTML= inputValue;
		}
		
		var totalPrice = (tprice-inputValue-selValue);
		tpriceArea = document.getElementById("result3");
		tpriceArea.innerHTML= totalPrice.toLocaleString();
	}	
	
</script>

<style type="text/css">
	.shoping__checkout .order-btn{
		display: block;
	    text-align: center;  
	}
	.order-btn{
		display: inline-block;
		border: 0;      
		font-size: 14px;
		padding: 10px 28px 10px;
		color: #ffffff;
		text-transform: uppercase;
		font-weight: 700;
		background: #7fad39;   
		letter-spacing: 2px;
	}
</style>

<!-- Breadcrumb Section Begin -->
    <section class="breadcrumb-section set-bg" data-setbg="img/banner_food.jpg">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 text-center">
                    <div class="breadcrumb__text">
                        <h2>Order Page</h2>
                        <div class="breadcrumb__option">
                            <span>주문하기</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Breadcrumb Section End -->

    <!-- Shoping Cart Section Begin -->
    <section class="shoping-cart spad">
    
    <form name="myform" action="payment.mall" method="post">
    
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
                            
                            	<c:forEach var="cart" items="${cartList}">    
                                 <tr>
                                    <td class="shoping__cart__item">
                                        <img width="80" height="80"src="img/product/product_img/${cart.PSUBCATEGORY }/${cart.PNAME }/${cart.PIMG1 }" alt="">
                                        <fmt:formatNumber var="PNUM" value="${cart.PNUM}"/>                                                                      				 
                                        <h5>${cart.PNAME}</h5>                                   
                                    </td>
                                    <td class="shoping__cart__price">                                   
                                     	<fmt:formatNumber var="PPRICE" value="${cart.PPRICE}" pattern="###,###"/>
                                     		${PPRICE }                                      
                                         <a style="font-size:16px">
                                         <fmt:formatNumber var="PPOINT" value="${cart.PPOINT}" pattern="###,###"/>
                                         [point:${PPOINT}]</a>
                                    </td>
                                    <td class="shoping__cart__quantity">
                                        <div class="quantity">
                                                ${cart.ORDERPQTY }
                                        </div>
                                    </td> 
                                                                        
                                    <td class="shoping__cart__total">
                                        <fmt:formatNumber var="AMOUNTPRICE" value="${cart.AMOUNTPRICE}" pattern="###,###"/>                                       
                                        ${AMOUNTPRICE}
                                        <a style="font-size:16px">
                                        <fmt:formatNumber var="AMOUNTPOINT" value="${cart.AMOUNTPOINT}" pattern="###,###"/>
                                        [point:${AMOUNTPOINT}]</a>
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
                    <div class="shoping__continue">
                        <div class="shoping__discount">
                        
                        
                            <h5>쿠폰 선택</h5>
                            	<select name="useCoupon" id="selcou" onChange="selcoupon()">
                            		<option value="">선택안함</option>
                            		<option value="${MCOUPON}">
                            			<fmt:formatNumber value="${MCOUPON}" pattern="###,###"/>원 할인 적용
                            		</option>
                            	</select>
                            	
							<br><br><br><br><hr><br>
							
                            <h5>포인트 사용</h5>	       
                            	<input type="text" id="useMPOINT" name="useMPOINT" value="" onblur="onlyNumber(${MPOINT},${totalPrice})" >
                            		 &nbsp;&nbsp; 사용가능 포인트 : ${MPOINT}
                                
                        </div>
                    </div>
                </div>
                
                <div class="col-lg-6">
                    <div class="shoping__checkout">
                        <h5>총 결제예정 금액</h5>   
                        <ul>
                            <li>전체 금액
                            	<span> <fmt:formatNumber value="${totalPrice}" pattern="###,###"/>  </span>
                            </li>
                            <li>적용 쿠폰<span id="result1">- </span></li>  
                            <li>사용 포인트<span id="result2">- </span></li>
                        </ul>
                        <br><br>
                        <h5>최종 결제 금액</h5>
                        <ul>
							<li>최종 금액<span id="result3">    </span></li>
							<li>적립 포인트<span>${AMOUNTPOINT}</span></li>
						</ul>
                        	<input type="hidden" value="결과" >
                        <input class="order-btn" type="submit" value="결제하기" >
                    </div>
                </div>
            </div>
        </div>
       
		</form>
	        
    </section>
    <!-- Shoping Cart Section End -->

<%@include file="../display/bottom.jsp" %>
