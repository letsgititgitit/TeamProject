<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
 <%@ include file="../display/adminTop.jsp" %> 
        
    
<style type="text/css">
	.err{
		color: black;
		font-size: 10px;
		font-weight: bold;	
	}
</style>    
    
<% 
	Date today = new Date();
	SimpleDateFormat date = new SimpleDateFormat("yyyy-MM-dd");
%>
    
    <!-- content -->
	<div id="layoutSidenav_content">
                <main>
                    <div class="container-fluid px-4">
                         <h1 class="mt-4">COUPON INSERT</h1>
                        <ol class="breadcrumb mb-4">
                            <li class="breadcrumb-item active">FRECO 쿠폰 등록</li>
                        </ol> 
                       
                       
                        <div class="card mb-4">
                          <form:form action="cinsert.admin" method="post" enctype="multipart/form-data" commandName="coupon">
                          	<br>  
                          	<table align="center" height="200" width="400">
                          		<tr>
                          			<td>쿠폰 이름&nbsp;</td>
                          			<td><input class="form-control-sm" type="text" name="CNAME" placeholder="쿠폰 이름을 입력하세요">
                          				<form:errors cssClass="err" path="CNAME"/>
                          			</td>	
                          		</tr>
                          		<!-- <tr>
                          			<td>쿠폰 이미지&nbsp;</td>
                          			<td><input class="form-control-sm" type="file" name="UPLOAD">
                          			</td>                        		
                          		</tr> -->
                          		<tr>
                          			<td>쿠폰 금액&nbsp;</td>
                          			<td><input class="form-control-sm" type="text" name="CPRICE" value="10">                         			
                          			</td>                       		
                          		</tr>
                          		<tr>
                          			<td>쿠폰 만료일&nbsp;</td>
                          			<td><input class="form-control-sm" type="date" name="CDEADLINE" min="<%=date.format(today)%>">
                          				<form:errors cssClass="err" path="CDEADLINE"/>
                          			</td>                        		
                          		</tr>
                          		<tr>                 
                          			<td colspan="2" align="center"><input type="submit" class="btn btn-outline-dark" value="쿠폰 등록">
                          			<input type="button" class="btn btn-outline-dark" onClick="javascript:history.go(-1)" value="이전화면"></td>                        			
                          		</tr>
                          	</table>
                          	
                          </form:form>
                    
                        <br></div>
                    </div>
                    
                </main>
                
<%@ include file="../display/adminBottom.jsp" %> 