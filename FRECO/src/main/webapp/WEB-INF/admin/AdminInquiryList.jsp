<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../display/adminTop.jsp" %>    
<%@include file="../common/common.jsp" %>
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
                    <div class="container-fluid px-4">
                         <h1 class="mt-4">MEMBER INQUIRY LIST</h1>
                        <ol class="breadcrumb mb-4">
                            <li class="breadcrumb-item active">FRECO 문의 내역</li>
                        </ol> 
                        <center>
                       <div class="col-xl-4 col-md-6">
                                <div class="card bg-danger text-white mb-4 justify-content-between">
                                    <div class="card-body">답변 대기<h3>0개</h3></div>
                                    <div class="card-footer d-flex align-items-center justify-content-between">                                   
                                       	 <a class="small text-white stretched-link" type="button" onClick="#">확인하기</a>                                                                                                   
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
                                            <td>${qna.QSUBJECT }</td>
                                            <td>${qna.QCONTENT }</td>
                                            <td>${qna.QREGDATE }</td>                                           
                                            <td>
                                            	<c:choose>
                                            		<c:when test="${qna.QREPLY eq '답변대기'}">
                                            			<p class="reply-wait">${qna.QREPLY }</p>
                                            		</c:when>
                                            		<c:otherwise>
                                            			<p class="reply-success">${qna.QREPLY }</p>
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
                </main>

<%@ include file="../display/adminBottom.jsp" %> 