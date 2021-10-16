<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>     
<%@ include file="../display/adminTop.jsp" %>        
    
	<div id="layoutSidenav_content">
                <main>
                    <div class="container-fluid px-4">
                         <h1 class="mt-4">COUPON LIST</h1>
                        <ol class="breadcrumb mb-4">
                            <li class="breadcrumb-item active">FRECO 쿠폰 목록</li>
                        </ol> 
                       
                       
                        <div class="card mb-4">
                           <div class="card-header">
                                <i class="fas fa-table me-1"></i>
                                COUPON LIST
                            </div>
                            <div class="card-body">
                                <table id="datatablesSimple">
                                    <thead>
                                        <tr>
                                            <th>쿠폰 번호</th>
                                            <th>쿠폰 이름</th>
                                            <!-- <th>이미지</th> -->
                                            <th>할인률</th>
                                            <th>쿠폰 만료일</th>
                                            <th>수정</th>
                                            <th>삭제</th>
                                        </tr>
                                    </thead>
                                   
                                    <tbody>
                                    <c:forEach var="data" items="${lists }">
                                        <tr>
                                            <td>${data.CNUM }</td>
                                            <td>${data.CNAME }</td>
                                            <%-- <td>
                                            	<img src="<%=request.getContextPath()%>/img/coupon/${data.CIMG }" width="100" height="50"> 
                                            </td> --%>
                                            <td>${data.CPRICE }</td>                                            
                                            <td>
                                            	<fmt:parseDate var="fnum" value="${data.CDEADLINE }" pattern="yyyy-MM-dd"/>
                                            	<fmt:formatDate var="CDEADLINE" value="${fnum }" pattern="yyyy-MM-dd"/>
                                            	${CDEADLINE }
                                            </td>
                                            <td><input type="button" class="btn btn-outline-dark btn-sm" value="수정" onClick="location.href='cupdate.admin?CNUM=${data.CNUM }'"></td>
                                            <td><input type="button" class="btn btn-outline-dark btn-sm" value="삭제" onClick="location.href='cdelete.admin?CNUM=${data.CNUM }'"></td>
                                            
                                        </tr>
                                     </c:forEach>
                              
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </main>
<%@ include file="../display/adminBottom.jsp" %>    