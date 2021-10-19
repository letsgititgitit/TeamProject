<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../display/adminTop.jsp" %>    
<%@include file="../common/common.jsp" %>
<style type="text/css">
	.content{	
	background: #F3F3F3;
	font-size: 17px;
	padding: 40px;
	}
</style>
		
		<div id="layoutSidenav_content">             
               <main>
                    <div class="container-fluid px-4">
                         <h1 class="mt-4">MEMBER INQUIRY LIST</h1>
                        <ol class="breadcrumb mb-4">
                            <li class="breadcrumb-item active"><a class="btn btn-outline-dark" onClick="javascript:location.href='inquiry.admin'">FRECO 문의 내역</a></li>
                        </ol> 
                       
                       
                        <div class="card mb-4">
                            <div class="card-header">
                                <i class="fas fa-table me-1"></i>
                                1:1 문의 내역
                            </div>
                            <div class="card-body">
                            
                            <!--  -->
                         <center>
                            <div class="col-lg-9">
                    <div class="container">
	 					<table class="table table-hover" align="center">
	    						<tr>   							
					    			<th>번호</th>
					    			<td colspan="4">${qna.QNUM}</td>
					    			
					    		</tr>
					    		<tr>   							
					    			<th>작성자</th>
					    			<td>${qna.QID}</td>
					    			<th>작성일</th>
					    			<td>
					    				<fmt:parseDate var="fmtDate" value="${qna.QREGDATE}" pattern="yyyy-MM-dd"/>
										<fmt:formatDate var="regDate" value="${fmtDate}" pattern="yyyy-MM-dd"/>
										${regDate}
									</td>
					    		</tr>
					    		
					    		<tr>   							
					    			<th>제목</th>
					    			<td>${qna.QSUBJECT}</td>
					    			<th>답변상태</th>
					    			<td style="color: red">${qna.QREPLY}</td>
					    		</tr>
					    		
					    		<tr>   							
					    			<td colspan="4" align="center"><b>내용</b></td>
					    		</tr>
					    		<tr>	
					    			<td colspan="4" align="center"><p class="content">${qna.QCONTENT}</p></td>
					    		</tr>	
					    		</tr>
					    		<br>
					    		
					    		<tr>
					    			<td align="center" colspan="4">					    				
										<input type="button" value="답글쓰기" class="btn btn-outline-dark" onClick="location.href='reply.admin?QREF=${qna.QREF}&QRESTEP=${qna.QRESTEP }&QRELEVEL=${qna.QRELEVEL }&QCONTENT=${qna.QCONTENT}&QPW=${qna.QPW }&QNUM=${qna.QNUM}'"> 						
					    			</td>
					    		</tr>			    					    				    				    				    						    		
				    	</table>
			    	 				    				    
				    </div>				              
            	 </div>
                </center>               

                            </div>
                        </div>
                    </div>
                </main>

<%@ include file="../display/adminBottom.jsp" %> 