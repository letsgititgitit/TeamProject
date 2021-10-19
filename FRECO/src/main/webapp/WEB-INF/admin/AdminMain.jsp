<%@page import="java.util.Calendar"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ include file="../display/adminTop.jsp" %> 
<%@include file="../common/common.jsp" %> 
     
          <!--   content -->                  
            <div id="layoutSidenav_content">
                <main>
                    <div class="container-fluid px-4">
                         <h1 class="mt-4">ADMIN MAIN</h1>
                        <ol class="breadcrumb mb-4">
                            <li class="breadcrumb-item active">FRECO 관리자</li>
                        </ol> 
                        <div class="row">
                            <div class="col-xl-4 col-md-6">
                                <div class="card bg-primary text-white mb-4">
                                    <div class="card-body">오늘 주문 <h2>${sysorder }개</h2></div>                                 
                                </div>
                            </div>
                           
                            <div class="col-xl-4 col-md-6">
                                <div class="card bg-success text-white mb-4">
                                    <div class="card-body">관리자 처리 완료 <h2>${admincnt }개</h2></div>                      
                                </div>
                            </div>
                            <div class="col-xl-4 col-md-6">
                                <div class="card bg-danger text-white mb-4">
                                    <div class="card-body">관리자 미처리 현황 <h2>${refundcnt+adminrecnt}개</h2></div>                          
                                </div>
                            </div>
                        </div>
                        
                        <div class="row">
                            <div class="col-xl-6">
                                <div class="card mb-4">
                                    <div class="card-header">
                                        <i class="fas fa-chart-area me-1"></i>
                                        주문/환불 차트
                                    </div>
                                    <div class="card-body"><center><canvas id="levelChart" width="200" height="230"></canvas></center></div>
                                </div>
                            </div>
                            <div class="col-xl-6">
                                <div class="card mb-4">
                                    <div class="card-header">
                                        <i class="fas fa-chart-bar me-1"></i>
                                        주문수 차트
                                    </div>
                                    <div class="card-body"><canvas id="orderChart" width="100%" height="40"></canvas></div>
                                </div>
                            </div>
                        </div>
                        
                         <div class="card mb-4">
                            <div class="card-header">
                                <i class="fas fa-table me-1"></i>
                                ORDER LIST
                            </div>
                            <div class="card-body">
                                 <table id="datatablesSimple">
                                    <thead>
                                        <tr>
                                            <th>주문 번호</th>
                                            <th>아이디</th>
                                            <th>주문 날짜</th>
                                            <th>처리 현황</th>                                       
                                        </tr>
                                    </thead>
                                   
                                    <tbody>
                                      <c:forEach var="list" items="${orderlist }">
                                        <tr>
                                        	<td><input type="button" class="btn btn-outline-dark btn-sm" value="${list.OINVOICE }" onClick="location.href='orderDetail.admin?OINVOICE=${list.OINVOICE }'"></td>
                                            <td>${list.OMID }</td>
                                            <fmt:parseDate var="date" value="${list.OORDERDATE }" pattern="yyyy-MM-dd"/>
                                            <fmt:formatDate var="OORDERDATE" value="${date }" pattern="yyyy-MM-dd"/>
                                            <td>${OORDERDATE }</td>                        
                                            <td>                                      
	                                            <c:choose>
	                                            	<c:when test="${list.OREFUND eq 'YES'}">
	                                            		<input type="button" class="btn btn-outline-danger btn-sm" value="환불" onClick="">
	                                            	</c:when>
	                                            	<c:when test="${list.OREFUND eq '환불완료'}">
	                                            		<b>환불 완료</b>
	                                            	</c:when>
	                                            	<c:otherwise>
	                                            		<b>주문</b>
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
                                   
<%@include file="../common/adminChart.jsp" %> 
                </main>                
<%@ include file="../display/adminBottom.jsp" %>               
