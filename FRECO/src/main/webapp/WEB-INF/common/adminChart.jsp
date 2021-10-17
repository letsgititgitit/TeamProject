<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../common/common.jsp" %>     
<fmt:parseDate var="fmtDate" value="${day7date.OORDERDATE }" pattern="yyyy-MM-dd"/>
<fmt:formatDate var="day7date" value="${fmtDate }" pattern="yyyy-MM-dd"/>

<fmt:parseDate var="fmtDate" value="${day6date.OORDERDATE }" pattern="yyyy-MM-dd"/>
<fmt:formatDate var="day6date" value="${fmtDate }" pattern="yyyy-MM-dd"/>    

<fmt:parseDate var="fmtDate" value="${day5date.OORDERDATE }" pattern="yyyy-MM-dd"/>
<fmt:formatDate var="day5date" value="${fmtDate }" pattern="yyyy-MM-dd"/> 
   
<fmt:parseDate var="fmtDate" value="${day4date.OORDERDATE }" pattern="yyyy-MM-dd"/>
<fmt:formatDate var="day4date" value="${fmtDate }" pattern="yyyy-MM-dd"/>  
  
<fmt:parseDate var="fmtDate" value="${day3date.OORDERDATE }" pattern="yyyy-MM-dd"/>
<fmt:formatDate var="day3date" value="${fmtDate }" pattern="yyyy-MM-dd"/>  
  
<fmt:parseDate var="fmtDate" value="${day2date.OORDERDATE }" pattern="yyyy-MM-dd"/>
<fmt:formatDate var="day2date" value="${fmtDate }" pattern="yyyy-MM-dd"/>  
  
<fmt:parseDate var="fmtDate" value="${day1date.OORDERDATE }" pattern="yyyy-MM-dd"/>
<fmt:formatDate var="day1date" value="${fmtDate }" pattern="yyyy-MM-dd"/>  