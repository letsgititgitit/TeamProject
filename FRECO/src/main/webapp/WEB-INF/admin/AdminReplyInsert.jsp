<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../display/adminTop.jsp" %>    
<%@include file="../common/common.jsp" %>
<style type="text/css">
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
                                1:1 문의 내역
                            </div>
                            <div class="card-body">
                            
                            <!--  -->
                         <center>
                            <div class="col-lg-9">
                    <div class="container">
						<form method="post" action="reply.admin">
							<input type="hidden" name="QREF" value="${QREF }">
							<input type="hidden" name="QRESTEP" value="${QRESTEP }">
							<input type="hidden" name="QRELEVEL" value="${QRELEVEL }">
							<input type="hidden" name="ORIGINQNUM" value="${QNUM }">
							
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
										<input type="text" style="width:300px;" name="QSUBJECT" value="[답글]문의 내역 답변입니다.">
									</td>
								</tr>
								
								<tr>
									<td width="100">내용</td>
									<td width="450">
										<textarea name="QCONTENT" rows="10" cols="100">문의 내역: ${QCONTENT }</textarea>
									</td>
								</tr>
								
								<tr>
			            			<th>비밀번호</th>
			            			<td>
			            				<input type="password" name="QPW" value="${QPW }" readonly="readonly"> <h class="notice"> ※비밀번호 수정 불가합니다</h>
			            			</td>
			            		</tr>
								
								<tr>
									<td colspan="2" align="center">
										<input type="submit" class="btn btn-outline-dark" value="답글쓰기">					
									</td>
								</tr>
								
							</table>
							
						</form>
					</div> 				              
            	</div>
                </center>               

                            </div>
                        </div>
                    </div>
                </main>

<%@ include file="../display/adminBottom.jsp" %> 