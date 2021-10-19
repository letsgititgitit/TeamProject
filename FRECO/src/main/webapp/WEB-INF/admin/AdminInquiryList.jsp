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
                <form name="rform" action="inquiry.admin" method="post">
                    <div class="container-fluid px-4">
                         <h1 class="mt-4">MEMBER INQUIRY LIST</h1>
                        <ol class="breadcrumb mb-4">
                            <li class="breadcrumb-item active"><a class="btn btn-outline-dark" onClick="javascript:location.href='inquiry.admin'">FRECO 문의 내역</a></li>
                        </ol> 
                        <center>
                       <div class="col-xl-4 col-md-6">
                                <div class="card bg-danger text-white mb-4 justify-content-between">
                                    <div class="card-body">답변 대기<h3>${replyCount }개</h3></div>
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
                                MEMBER INQUIRY LIST
                            </div>
                            <div class="card-body">
                                <table id="datatablesSimple">
                                    <thead>
                                        <tr>
                                            <th>번호</th>
                                            <th>아이디</th>
                                            <th>제목</th>
                                            <th>내용</th>
                                            <th>날짜</th>                                           
                                            <th>상태</th>                                           
                                        </tr>
                                    </thead>
                            
                                    <tbody>
                                    
                                    <c:forEach var="qna" items="${qlist }">
                                        <tr>
                                            <td>${qna.QNUM }</td>
                                            <td>${qna.QID }</td>
                                            <td>
                                            <input type="button" class="btn btn-outline-dark btn-sm" value="${qna.QSUBJECT }" onClick="location.href='detail.admin?QNUM=${qna.QNUM }'">
                                            </td>
                                            <td>${qna.QCONTENT }</td>
                                            <fmt:parseDate var="date" value="${qna.QREGDATE }" pattern="yyyy-MM-dd"/>
                                            <fmt:formatDate var="QREGDATE" value="${ date}" pattern="yyyy-MM-dd"/>
                                            <td>${QREGDATE }</td>                                           
                                            <td>
                                            	<c:choose>
                                            		<c:when test="${qna.QREPLY eq '답변대기'}">
                                            			<p class="reply-wait">${qna.QREPLY }</p>
                                            		</c:when>
                                            		<c:otherwise>
                                            			<input type="button" class="btn btn-outline-primary btn-sm" value="${qna.QREPLY }" onClick="location.href='replyDetail.admin?QREF=${qna.QREF }'">
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