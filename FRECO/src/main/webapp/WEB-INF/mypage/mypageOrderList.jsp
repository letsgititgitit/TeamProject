<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- mypageOrderList.jsp -->
<%@include file="./../common/common.jsp" %> 
<%@include file="./../display/top_header.jsp" %>   
<%@include file="./../display/top.jsp" %>
<jsp:include page="./../display/mypageSidebar.jsp"/> 

<table class="table table-hover">
  <thead>
    <tr>
      <th scope="col">주문번호</th>
      <th scope="col">주문날짜</th>
      <th scope="col">상품명</th>
      <th scope="col">수량</th>
      <th scope="col">가격</th>
      <th scope="col">반품요청</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th scope="row">1</th>
      	<td>Mark</td>
      	<td>Otto</td>
      	<td>@mdo</td>
		<td>1</td>
		<td>1</td>
    </tr>
    <tr>
      <th scope="row">2</th>
      	<td>Jacob</td>
      	<td>Thornton</td>
      	<td>@fat</td>
      	<td>2</td>
      	<td>2</td>
    </tr>
    <tr>
      	<th scope="row">3</th>
      	<td>Larry the Bird</td>
      	<td>@twitter</td>
      	<td>3</td>
      	<td>3</td>
      	<td>3</td>
    </tr>
    

  </tbody>
</table>



<%-- 	
	<tr>
		<c:if test="${empty lists }">
			<tr align="center">
				<td colspan="5">주문내역이 없습니다</td>
			</tr>
		</c:if>	
	</tr> --%>






<%@include file="./../display/bottom.jsp" %> 
