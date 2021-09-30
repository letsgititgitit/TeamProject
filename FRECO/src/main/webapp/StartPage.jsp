<%@ page language="java" contentType="text/html; charset=EUC-KR"  pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>시작 페이지</title>
</head>
<body>

StartPage.jsp
<%
	String viewPage = request.getContextPath()+"/main.mall";
	response.sendRedirect(viewPage);
%>

</body>
</html>