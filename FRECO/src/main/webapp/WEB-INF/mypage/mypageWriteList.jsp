<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- mypageWriteList.jpg -->
<%@include file="./../common/common.jsp" %> 
<%@include file="./../display/top_header.jsp" %>   
<%@include file="./../display/top.jsp" %>
<jsp:include page="./../display/mypageSidebar.jsp"/> 

<table class="table table-hover">
  <thead>
    <tr>
      <th scope="col">번호</th>
      <th scope="col">제목</th>
      <th scope="col">작성일자</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th scope="row">1</th>
      	<td>Mark</td>
      	<td>Otto</td>
      	<td>@mdo</td>

    </tr>
    <tr>
      <th scope="row">2</th>
      	<td>Jacob</td>
      	<td>Thornton</td>
      	<td>@fat</td>
    </tr>
    <tr>
      	<th scope="row">3</th>
      	<td>Larry the Bird</td>
      	<td>@twitter</td>

    </tr>
    

  </tbody>
</table>









<br><br>
<%@include file="./../display/bottom.jsp" %>