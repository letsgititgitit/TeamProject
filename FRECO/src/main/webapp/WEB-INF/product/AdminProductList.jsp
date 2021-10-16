<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>     
<%@ include file="../display/adminTop.jsp" %>    

<style type="text/css">
	.notice{
		color: red;
		font-size: 15px;
		font-weight: bold;
	}
</style>
<script type="text/javascript">
 	function qty_check(){
		pform.submit();
	} 
	
	function imgView(PNUM){
		//alert(1);
		
	var _width=screen.availWidth;
	var _height=screen.availHeight;
	var _left = Math.ceil(( window.screen.width - _width )/2);
	var _top = Math.ceil(( window.screen.height - _height )/2); 
	
	var options="resizeable=no,scrollbars=no,width="+_width+",height="+_height+",left="+_left+",top="+_top;
		 window.open(
				"pdetail.product?PNUM="+PNUM,
				"FRECO CART",
				options
				); 
	}
</script>
	<div id="layoutSidenav_content">
                <main>
                   <form name="pform" action="plist.product" method="post">
                    <div class="container-fluid px-4">
                         <h1 class="mt-4">PRODUCT LIST</h1>
                        <ol class="breadcrumb mb-4">
                            <li class="breadcrumb-item active"><a class="btn btn-outline-dark" onClick="javascript:location.href='plist.product'">FRECO 상품 목록</a></li>
                        </ol>
                        <center>                               
                     	   <div class="col-xl-4 col-md-6">
                                <div class="card bg-danger text-white mb-4 justify-content-between">
                                    <div class="card-body">위험 재고 상품<h3>${pqtyNum }개</h3></div>
                                    <div class="card-footer d-flex align-items-center justify-content-between">                                   
                                       	 <a class="small text-white stretched-link" type="button" onClick="qty_check()">확인하기</a>                                                                                                   
                                        <div class="small text-white"><i class="fas fa-angle-right"></i></div>
                                    </div>                                          
                                </div>
                            </div>  
                         </center>                                                                      
                        <div class="card mb-4">
                           <div class="card-header">
                                <i class="fas fa-table me-1"></i>
                                PRODUCT LIST
                            </div>
                            <div class="card-body">
                                <table id="datatablesSimple">
                                    <thead>
                                        <tr>
                                            <th>상품번호</th>
                                            <th>이름</th>
                                            <th>수량</th>
                                            <th>가격</th>
                                            <th>포인트</th>
                                            <th>카테고리</th>
                                            <th>세부카테고리</th>
                                            <th>이미지</th>
                                            <th>수정</th>
                                            <th>삭제</th>                                       		
                                        </tr>
                                    </thead>
                                   
                                    <tbody>
                                    <c:forEach var="product" items="${lists }">
                                        <tr>
                                            <td>${product.PNUM }</td>
                                            <td>${product.PNAME }</td>                                                                                  
                                            <td>
                                            	<fmt:formatNumber var="PQTY" value="${product.PQTY }" pattern="###,###"/>
		                                            <c:choose>
		                                            	<c:when test="${PQTY <= 10}">
		                                            		<p class="notice">${PQTY }</p>
		                                            	</c:when>
		                                            	<c:otherwise>
		                                            		${PQTY }
		                                            	</c:otherwise>
		                                            </c:choose>
		                                    </td>
                                        	<td><fmt:formatNumber var="PPRICE" value="${product.PPRICE }" pattern="###,###"/>${PPRICE }</td> 
                                            <td><fmt:formatNumber var="PPOINT" value="${product.PPOINT }" pattern="###,###"/>${PPOINT }</td> 
                                            <td>${product.PCATEGORY }</td>
                                            <td>${product.PSUBCATEGORY }</td>
                                            <td>
                                            	<fmt:formatNumber var="PNUM" value="${product.PNUM }"/>
                                            	<input type="button" class="btn btn-outline-dark btn-sm" value="이미지 확인" onClick="imgView('${PNUM }')">
                                            	<%-- <img src="<%=request.getContextPath() %>/img/product/product_img/${product.PSUBCATEGORY }/${product.PNAME }/ ${product.PIMG1 }" width="100" height="100"><br>                                   
                                            	<img src="<%=request.getContextPath() %>/img/product/product_img/${product.PSUBCATEGORY }/ ${product.PNAME }/${product.PIMG2 }" width="100" height="100"><br>                                   
                                            	<img src="<%=request.getContextPath() %>/img/product/product_img/${product.PSUBCATEGORY }/ ${product.PNAME }/${product.PIMG3 }" width="100" height="100"><br>                                   
                                            	<img src="<%=request.getContextPath() %>/img/product/product_img/${product.PSUBCATEGORY }/ ${product.PNAME }/${product.PIMG4 }" width="100" height="100"><br>                                   
                                            	<img src="<%=request.getContextPath() %>/img/product/product_img/${product.PSUBCATEGORY }/ ${product.PNAME }/${product.PIMG5 }" width="100" height="100"><br>  --%>                                  
                                            </td>
                                            <%-- <td>
                                            	<img src="<%=request.getContextPath()%>/img/product/product_img/${product.PSUBCATEGORY }/${product.PNAME }/${product.PINFOIMG }" width="100" height="100"><br><br>
                                            	<img src="<%=request.getContextPath()%>/img/product/product_img/${product.PSUBCATEGORY }/${product.PNAME }/${product.PSUBIMG }" width="100" height="100">                                                                          
                                            </td>      --%>                   
                                            <td><input type="button" class="btn btn-outline-dark btn-sm" value="수정" onClick="location.href='pupdate.product?PNUM=${product.PNUM }'"></td>
                                            <td><input type="button" class="btn btn-outline-dark btn-sm" value="삭제" onClick="location.href='pdelete.product?PNUM=${product.PNUM }'"></td>                                          
                                        </tr>
                                     </c:forEach>
                              
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                    </form>
                </main>
<%@ include file="../display/adminBottom.jsp" %>    