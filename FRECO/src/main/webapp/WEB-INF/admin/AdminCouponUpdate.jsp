<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>          
<%@ include file="../display/adminTop.jsp" %>  
<% 
	Date today = new Date();
	SimpleDateFormat date = new SimpleDateFormat("yyyy-MM-dd");
%>

<style type="text/css">
	.err{
		color:black;
		font-size: 10px;
		font-weight: bold;
	}  
	.notice{
		color: red;
		font-size: 13px;
		font-weight: bold;
	}
</style>
	<div id="layoutSidenav_content">
                <main>
                    <div class="container-fluid px-4">
                         <h1 class="mt-4">COUPON UPDATE</h1>
                        <ol class="breadcrumb mb-4">
                            <li class="breadcrumb-item active">FRECO 쿠폰 수정</li>
                        </ol> 
                       
                       
                        <div class="card mb-4">
                          <form:form action="cupdate.admin" method="post" enctype="multipart/form-data" commandName="coupon">
                          	<input type="hidden" name="CNUM" value="${coupon.CNUM }">
                          	<%-- <input type="hidden" name="cIMG" value="${coupon.CIMG }"> --%>
                          	<br>  
                          	<table align="center" height="250">
                          		<tr>
                          			<td>쿠폰 이름&nbsp;</td>                          		
                          			<td><input class="form-control-sm" type="text" name="CNAME" value="${coupon.CNAME }">
                          			<form:errors cssClass="err" path="CNAME"/></td>
                          		</tr>
                          		<%-- <tr>
                          			<td>쿠폰 이미지&nbsp;</td>
                          			<td>
                          			<img src="<%=request.getContextPath()%>/img/coupon/${coupon.CIMG }" width="100" height="50"> 
                          			쿠폰이미지:${coupon.CIMG }
                          			<input class="form-control-sm" type="file" name="UPLOAD">                     			
                          			<input type="hidden" name="UPLOADOLD" value="${coupon.CIMG }">
                          			</td>                        		
                          		</tr> --%>
                          		<tr>
                          			<td>쿠폰 금액&nbsp;</td>
                          			<td><input class="form-control-sm" type="text" name="CPRICE" value="${coupon.CPRICE }">
                          				
                          			</td>                       		
                          		</tr>
                          		<tr>
                          			<td>쿠폰 만료일&nbsp;</td>
                          			<td>
                          			<fmt:parseDate var="fnum" value="${coupon.CDEADLINE }" pattern="yyyy-MM-dd"/>
                                    <fmt:formatDate var="CDEADLINE" value="${fnum }" pattern="yyyy-MM-dd"/>                                  
                          			<input class="form-control-sm" type="date" name="CDEADLINE" min="<%=date.format(today)%>" value="${CDEADLINE }">
                          			<form:errors cssClass="err" path="CDEADLINE"/>
                          			</td>                        		
                          		</tr>
                          		<tr>                 
                          			<td colspan="2" align="center"><input type="submit" class="btn btn-outline-dark" value="쿠폰 수정">                        			
                          				<input type="button" class="btn btn-outline-dark" onClick="javascript:history.go(-1)" value="이전화면"></td>                        			
                          		</tr>
                          	</table>
	                          	<center>
	                          	<p class="notice">※파일 미 선택시 기존 파일이 유지됩니다</p>
	                          	</center>
                          </form:form>
                    
                        <br></div>
                    </div>
                    
                </main>
                
<%@ include file="../display/adminBottom.jsp" %>  