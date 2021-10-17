<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../display/adminTop.jsp" %>
<%@include file="../common/common.jsp" %>    
    
				<div id="layoutSidenav_content">
                <main>
                    <div class="container-fluid px-4">
                         <h1 class="mt-4">MEMBER LIST</h1>
                        <ol class="breadcrumb mb-4">
                            <li class="breadcrumb-item active">FRECO 회원 목록</li>
                        </ol> 
                       
                       
                        <div class="card mb-4">
                            <div class="card-header">
                                <i class="fas fa-table me-1"></i>
                                MEMBER LIST
                            </div>
                            <div class="card-body">
                                <table id="datatablesSimple">
                                    <thead>
                                        <tr>
                                            <th>회원 번호</th>
                                            <th>아이디</th>
                                            <th>이름</th>
                                            <th>전화번호</th>
                                            <th>주소</th>
                                            <th>쿠폰번호</th>
                                            <th>포인트</th>
                                        </tr>
                                    </thead>                              
                                    <tbody>
                                   <c:forEach var="list" items="${memlist}">
                                      <tr>
                                            <td>${list.MNUM }</td>
                                            <td>${list.MID }</td>
                                            <td>${list.MNAME }</td>
                                            <td>${list.MPHONE }</td>
                                            <td>${list.MADDRESS1 } ${list.MADDRESS2 } ${list.MADDRESS3 }</td>
                                            <td>${list.MCOUPON }</td>
                                            <td>${list.MPOINT }</td>
                                        </tr>
                                     </c:forEach>
                              
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </main>

<%@ include file="../display/adminBottom.jsp" %> 
