<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../display/adminTop.jsp" %>    
<%@include file="../common/common.jsp" %>
<script type="text/javascript">
	function reply_check(){
		rform.submit();
	} 
</script>

<style type="text/css">
	.reply-wait{
		color: #C90000;
		font-size: 15px;
		font-weight: bold;
	}

	.reply-success{
		color: #221DB5;
		font-size: 15px;
	}
</style>    
				<div id="layoutSidenav_content">
                <main>
                <form name="rform" action="review.admin" method="post">
                    <div class="container-fluid px-4">
                         <h1 class="mt-4">REVIEW LIST</h1>
                        <ol class="breadcrumb mb-4">
                            <li class="breadcrumb-item active"><a class="btn btn-outline-dark" onClick="javascript:location.href='review.admin'">FRECO 리뷰 내역</a></li>
                        </ol> 
                        <center>
                       <div class="col-xl-4 col-md-6">
                                <div class="card bg-danger text-white mb-4 justify-content-between">
                                    <div class="card-body">답글 대기<h3>${count }개</h3></div>
                                    <div class="card-footer d-flex align-items-center justify-content-between">                                   
                                       	 <a class="small text-white stretched-link" type="button" onClick="reply_check()">확인하기</a>                                                                                                   
                                        <div class="small text-white"><i class="fas fa-angle-right"></i></div>
                                    </div>                                          
                                </div>
                            </div>
                            </center>    
                       
                        <div class="card mb-4">
                            <div class="card-header">
                                <i class="fas fa-table me-1"></i>
                                REVIEW LIST
                            </div>
                            <div class="card-body">
                                <table id="datatablesSimple">
                                    <thead>
                                        <tr>
                                            <th>상품번호[상품이름]</th>
                                            <th>작성자</th>
                                            <th>평점</th>                                         	
                                            <th>내용</th>                                                                                
                                            <th>상태</th>                                                                                
                                        </tr>
                                    </thead>                                            
                                    <tbody>
                                    
                                    <c:forEach var="review" items="${rlist }">
                                        <tr>
                                            <td>${review.RSUBJECT } [${review.RPNAME }]</td>
                                            <td>
                                            	${review.RID }
                                            </td>
                                            <td>
                                            	<c:choose>
                                            		<c:when test="${review.RRATING eq 5 }">
                                            			 <i class="fas fa-star"></i>
                                            			 <i class="fas fa-star"></i>
                                            			 <i class="fas fa-star"></i>
                                            			 <i class="fas fa-star"></i>
                                            			 <i class="fas fa-star"></i>
                                         		 	</c:when>
                                         		 	<c:when test="${review.RRATING eq 4 }">
                                            			 <i class="fas fa-star"></i>
                                            			 <i class="fas fa-star"></i>
                                            			 <i class="fas fa-star"></i>
                                            			 <i class="fas fa-star"></i>
                                            			 <i class="far fa-star"></i>
                                         		 	</c:when>
                                         		 	<c:when test="${review.RRATING eq 3 }">
                                            			 <i class="fas fa-star"></i>
                                            			 <i class="fas fa-star"></i>
                                            			 <i class="fas fa-star"></i>
                                            			 <i class="far fa-star"></i>
                                            			 <i class="far fa-star"></i>
                                         		 	</c:when>
                                         		 		<c:when test="${review.RRATING eq 2 }">
                                            			 <i class="fas fa-star"></i>
                                            			 <i class="fas fa-star"></i>
                                            			 <i class="far fa-star"></i>
                                            			 <i class="far fa-star"></i>
                                            			 <i class="far fa-star"></i>
                                         		 	</c:when>
                                         		 	<c:otherwise>
                                         		 		<i class="fas fa-star"></i>
                                         		 		<i class="far fa-star"></i>
                                         		 		<i class="far fa-star"></i>
                                         		 		<i class="far fa-star"></i>
                                         		 		<i class="far fa-star"></i>
                                         		 	</c:otherwise>
                                            	</c:choose>
	                                       </td>
                                            <td>
                                            	<c:choose>
                                            		<c:when test="${empty review.RIMG }">
                                            			${review.RCONTENT }
                                            		</c:when>
                                            		<c:otherwise>
                                            			<p><img width="200" height="200" src="<%=request.getContextPath()%>/resources/${review.RIMG }"></p>
                                            				${review.RCONTENT }
                                            		</c:otherwise>                                           
                                            	</c:choose>
                                            	
                                            </td>
                                                                                      
                                            <td>
                                            	<c:choose>
                                            		<c:when test="${review.RREPLY eq '답글대기'}">
                                            			<input type="button" class="btn btn-outline-danger btn-sm" value="${review.RREPLY }" onClick="location.href='reviewreply.admin?RID=${review.RID }&RREF=${review.RREF}&RCONTENT=${review.RCONTENT }'">                                            
                                            		</c:when>
                                            		<c:otherwise>
                                            			<input type="button" class="btn btn-outline-primary btn-sm" value="${review.RREPLY }" onClick="location.href='reviewdetail.admin?RREF=${review.RREF}'">
                                            		</c:otherwise>
                                            	</c:choose>
                                            		
                                            </td>                                           
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