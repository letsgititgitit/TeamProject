<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- Logout.jsp -->

<%
	session.invalidate();
	response.sendRedirect("StartPage.jsp");
%>