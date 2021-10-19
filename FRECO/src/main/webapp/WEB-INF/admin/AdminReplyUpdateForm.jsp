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
	.notice{
		color: #DB0000;
		font-size: 12px;
		
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
                                1:1 문의 답변 내역 수정임
                            </div>
                            <div class="card-body">
                            
                <form method="post" action="replyUpdate.admin">
                <input type="hidden" name="QNUM" value="${qna.QNUM }">        
                <input type="hidden" name="QREF" value="${qna.QREF }">        
               <center>                 
                  <div class="col-lg-9">
                    <div class="container">                   
	 					<table height="400">
								
								<tr>
									<td width="100">작성자</td>
									<td width="350">
										<input type="text" name="QID" value="ADMIN" readonly="readonly"> <h class="notice">※작성자 수정 불가합니다</h>
									</td>
								</tr>
								
								<tr>
									<td width="100">제목</td>
									<td width="350">
										<input type="text" style="width:300px;" name="QSUBJECT" value="${qna.QSUBJECT}">
									</td>
								</tr>
								
								<tr>
									<td width="100">내용</td>
									<td width="450">
										<textarea name="QCONTENT" rows="10" cols="100">${qna.QCONTENT }</textarea>
									</td>
								</tr>
								
								<tr>
			            			<th>비밀번호</th>
			            			<td>
			            				<input type="password" name="QPW" value="${qna.QPW }" readonly="readonly"> <h class="notice"> ※비밀번호 수정 불가합니다</h>
			            			</td>
			            		</tr>
								
								<tr>
									<td colspan="2" align="center">
										<input type="submit" class="btn btn-outline-dark" value="수정하기">
										<input type="reset" class="btn btn-outline-dark" value="다시작성">						
									</td>
								</tr>
								
							</table>
			    	 				    				    
				    </div>				              
            	 </div>
                </center>               
				</form>
                            </div>
                        </div>
                    </div>
                </main>

<%@ include file="../display/adminBottom.jsp" %> 