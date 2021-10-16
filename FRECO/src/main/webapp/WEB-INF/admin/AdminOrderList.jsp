<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../display/adminTop.jsp" %>     
<%@include file="../common/common.jsp" %>

<script type="text/javascript">
	function refund_check(){
		alert(1);
		//rform.submit();
	}  
</script>
<style type="text/css">
 a:link { color: black; text-decoration: none;}
 a:visited { color: black; text-decoration: none;}
 a:hover { color: #747474; text-decoration: none;}

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
                                    <div class="card-body">환불 대기<h3>0개</h3></div>
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
                                           <!--  <th>상품</th>
                                            <th>가격</th> -->
                                            <th>주문 날짜</th>
                                            <th>처리 현황</th>
                                            <!-- 환불은 버튼으로 이동 refund.admin 가서 CartInfo의 total point, total price 0으로,
                                            	member 테이블 point 적립됐던거 빼기(mid로 member 테이블에서 mpoint 구하고 적립된 point구해서 빼기), 
                                            	mcoupon이 null이라면 다시 update 내용은 coupon 테이블에서 갖고 오고 -->
                                        </tr>
                                    </thead>
                                   
                                    <tbody>
                                        <tr>
                                        	<td><input type="button" class="btn btn-outline-dark btn-sm" value="12312" onClick="location.href='orderDetail.admin'"></td>
                                            <td>lee</td>
                                         <!--    <td>Edinburgh</td>
                                            <td>15000</td> -->
                                            <td>2011/04/25</td>                        
                                            <td>
                                            
                                            	<%--  <c:choose>
                                            	<c:when test="">
                                            		<input type="button" class="btn btn-outline-danger btn-sm" value="환불" onClick="">
                                            	</c:when>
                                            	<c:otherwise>
                                            		<input type="button" class="btn btn-outline-dark btn-sm" value="주문" onClick="">
                                            	</c:otherwise>
                                            </c:choose> --%>
                                            	<input type="button" class="btn btn-outline-danger btn-sm" value="환불" onClick="">
                                            </td>
                                        </tr>
                                       
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
              
                </main>              
              </form>  
<%@ include file="../display/adminBottom.jsp" %>  