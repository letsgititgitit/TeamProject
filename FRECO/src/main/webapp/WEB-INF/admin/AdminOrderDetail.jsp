<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../display/adminTop.jsp" %>    
<%@include file="../common/common.jsp" %>

<style type="text/css">
.notice{
		color: black;
		font-size: 13px;
		font-weight: bold;
	}
</style>

<div id="layoutSidenav_content">
                <main>
                    <div class="container-fluid px-4">
                         <h1 class="mt-4">주문번호: ${OINVOICE }</h1>
                        <ol class="breadcrumb mb-4">
                            <li class="breadcrumb-item active"><a class="btn btn-outline-dark" onClick="javascript:location.href='order.admin'">FRECO 주문 목록</a></li>
                        </ol> 
                                              
                        <div class="card mb-4">
                            <div class="card-header">
                                <i class="fas fa-table me-1"></i>
                                ORDER DETAIL LIST
                            </div>
                            <div class="card-body">
                            	<p>아이디:${id}</p>
                            	<p>이름:${name}</p>
                            	<p>주소:${adress1} ${adress2} ${adress3} </p>
                            	<hr>
                                <table id="datatablesSimple">
                                    <thead>                                	
                                        <tr>                                                                                        
                                            <th>상품 [상품번호]</th>                                      
                                            <th>가격</th>
                                            <th>수량</th>                                       
                                           
                                            <th>적립 포인트</th>
                                            <th>합계</th>                                                                                  
                                        </tr>
                                    </thead>

                                    <tbody>
                                       <c:forEach var="orders" items="${olist }">
                                        <tr>
                                        	<fmt:formatNumber var="AMOUNT" value="${orders.AMOUNT }" pattern="###,###"/>
                                        	 <fmt:formatNumber var="APRICE" value="${orders.APRICE }" pattern="###,###"/>
                                        	 <fmt:formatNumber var="AUSECOUPON" value="${orders.AUSECOUPON }" pattern="###,###"/>
                                        	 <fmt:formatNumber var="AUSEPOINT" value="${orders.AUSEPOINT }" pattern="###,###"/>
                                        	 <fmt:formatNumber var="APOINT" value="${orders.APOINT }" pattern="###,###"/>
                                            
                                            <td>${orders.APNAME }  [${orders.APNUM }]</td>                                        
                                            <td>${APRICE }</td>
                                            <td>${orders.AQTY }</td>                                                                                
                                            
                                            <td>${APOINT }</td>
                                            <td>${AMOUNT}</td>
                                        </tr>
                                        </c:forEach>
                                        <tr>
                                        	<fmt:formatNumber var="Total" value="${TotalPrice }" pattern="###,###"/>
                                        	<td colspan="8" align="center"><b>내역</b></td>
                                        </tr>
                                        <tr>
                                        	<th>총 금액</th>
                                        	<td colspan="8" align="right">${Total }</td>
                                        </tr>
                                        <tr>
                                        	<th>포인트 사용</th>
                                        	<td colspan="6" align="right">-${ausepoint }</td>
                                        </tr>
                                        <tr>
                                        	<th>쿠폰 사용</th>
                                        	<td colspan="6" align="right">-${ausecoupon }</td>
                                        </tr>
                                        <tr>
                                        	<th>최종 금액</th>
                                        	<fmt:formatNumber var="FPRICE" value="${FinalPrice }" pattern="###,###"/>
                                        	<td colspan="6" align="right" ><h4>${FPRICE}</h4></td>
                                        </tr>
                                        
                                     <c:if test="${AREFUND eq 'YES' }">  
	                                     <tr>
	                                     	<td colspan="8" align="center"><input type="button" class="btn btn-outline-danger btn-sm" value="환불하기" onClick="location.href='refund.admin?AUSECOUPON=${ausecoupon}&AUSEPOINT=${ausepoint }&APOINT=${apoin }&AID=${id}&OINVOICE=${OINVOICE }'">
	                                     	<p></p><p class="notice">※ 환불 시 사용 포인트/쿠폰 복구, 적립포인트 반환됩니다. </p></td>
	                                     </tr>
                              		</c:if>
                              		
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </main>

<%@ include file="../display/adminBottom.jsp" %>    