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
                         <h1 class="mt-4">REVIEW REPLY</h1>
                        <ol class="breadcrumb mb-4">
                            <li class="breadcrumb-item active"><a class="btn btn-outline-dark" onClick="javascript:location.href='review.admin'">FRECO 리뷰 내역</a></li>
                        </ol> 
                       
                       
                        <div class="card mb-4">
                            <div class="card-header">
                                <i class="fas fa-table me-1"></i>
                                리뷰 답글 작성
                            </div>
                            <div class="card-body">
                            
                            <!--  -->
                         <center>
                            <div class="col-lg-9">
                    <div class="container">
						<form method="post" action="reviewreply.admin">
							
							<input type="hidden" name="RREF" value="${RREF }">		
							
							<table class="table table-hover" align="center" height="400">
								
								<tr>
									<th>작성자</th>
									<td>
										<input type="text" name="RID" value="ADMIN" readonly="readonly"> <h class="notice">※작성자 수정 불가합니다</h>
									</td>
								</tr>
								
								
								<tr>
									<td colspan="4" align="center"><b>답변 내용</b></td>
								</tr>	
								<tr>	
									<td colspan="4" align="center">
										<textarea name="RCONTENT" rows="10" cols="100">[${ORID}]님 리뷰 내역: ${ORCONTENT }</textarea>
									</td>
								</tr>
								
							
								
								<tr>
									<td align="center" colspan="4">
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