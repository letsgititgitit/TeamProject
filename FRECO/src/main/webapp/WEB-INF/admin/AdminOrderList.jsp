<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../display/adminTop.jsp" %>     
<%@include file="../common/common.jsp" %>

<script type="text/javascript">
	function refund_check(){		
		rform.submit();
	}  
</script>
<style type="text/css">
 a:link { color: black; text-decoration: none;}
 a:visited { color: black; text-decoration: none;}
 a:hover { color: #747474; text-decoration: none;}

	.refund{
		color: #C90000;
		font-size: 15px;
		font-weight: bold;
	}

	.order{
		color: #221DB5;
		font-size: 15px;
		font-weight: bold;
	}
</style>  
    
<div id="layoutSidenav_content">
<form name="rform" action="order.admin" method="post">
                <main>
                    <div class="container-fluid px-4">
                         <h1 class="mt-4">ORDER LIST</h1>
                        <ol class="breadcrumb mb-4">
                            <li class="breadcrumb-item active"><a class="btn btn-outline-dark" onClick="javascript:location.href='order.admin'">FRECO 주문 목록</a></li>
                        </ol>
                        <center>
                       <div class="col-xl-4 col-md-6">
                                <div class="card bg-danger text-white mb-4 justify-content-between">
                                    <div class="card-body">환불 대기<h3>${refundcnt}개</h3></div>
                                    <div class="card-footer d-flex align-items-center justify-content-between">                                   
                                       	 <a class="small text-white stretched-link" type="button" onClick="refund_check()">확인하기</a>                                                                                                   
                                        <div class="small text-white"><i class="fas fa-angle-right"></i></div>
                                    </div>                                          
                                </div>
                            </div>
                            </center>     
                        <div class="card mb-4">
                            <div class="card-header">
                                <i class="fas fa-table me-1"></i>
                                ORDER LIST
                            </div>
                            <div class="card-body">
                                <table id="datatablesSimple">
                                    <thead>
                                        <tr>
                                            <th>주문 번호</th><!-- 누르면 주문 정보로 넘어감 -->
                                            <th>아이디</th>                                         
                                            <th>주문 날짜</th>
                                            <th>처리 현황</th>                                         
                                        </tr>
                                    </thead>
                                   
                                    <tbody>
                                      <c:forEach var="list" items="${orderlist }">
                                        <tr>
                                        	<td><input type="button" class="btn btn-outline-dark btn-sm" value="${list.OINVOICE }" onClick="location.href='orderDetail.admin?OINVOICE=${list.OINVOICE }&OMID=${list.OMID }'"></td>
                                            <td>${list.OMID }</td>                                    
                                            <fmt:parseDate var="date" value="${list.OORDERDATE }" pattern="yyyy-MM-dd"/>
                                            <fmt:formatDate var="OORDERDATE" value="${date }" pattern="yyyy-MM-dd"/>
                                            <td>${OORDERDATE }</td>                        
                                            <td>                                      
                                            	  <c:choose>
                                            	<c:when test="${list.OREFUND eq 'YES'}">
                                            		<p class="refund">환불</p>
                                            	</c:when>                                           	                                 	
                                            	<c:otherwise>
                                            		<p class="order">주문</p>
                                            	</c:otherwise>
                                            </c:choose> 
                                            	
                                            </td>
                                        </tr>
                                      </c:forEach> 
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
              
                </main>              
              </form>  
<%@ include file="../display/adminBottom.jsp" %>  
