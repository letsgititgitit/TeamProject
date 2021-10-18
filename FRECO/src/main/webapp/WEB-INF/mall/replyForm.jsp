<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../common/common.jsp" %>
<%@include file="./../display/top_header.jsp" %> 
<%@include file="../display/top.jsp" %>

<style type="text/css">
	.err{
		font-size: 9pt;
		color: red;
		font-weight: bold;
	}
	
	th, td {
		padding: 10px;
	}
</style>

replyForm.jsp <br>


<!-- Breadcrumb Section Begin -->
    <section class="breadcrumb-section set-bg" data-setbg="img/breadcrumb.jpg">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 text-center">
                    <div class="breadcrumb__text">
                        <h2>1:1 문의(Q & A)</h2>
                        <div class="breadcrumb__option">
                            <span>고객센터 - </span>
                            <span>1:1 문의(Q & A)</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Breadcrumb Section Begin -->
	<br><br> 

	<!-- FAQ Section Begin -->
    <section class="product spad">
        <div class="container">
            <div class="row">          
                <div class="col-lg-3 col-md-5">
                    <div class="sidebar">
                    	<div class="sidebar__item"> 
                    	 	<h4>고객센터</h4>                   	 	
                    	 	<ul>
                    	 		<li><a href="#">공지사항</a></li>
                    	 		<li><a href="faq.mall">FAQ</a></li>
                    	 		<li><a href="qna.mall">1:1문의</a></li>
                    	 	</ul>
                    	</div>
                    </div>                                
    			</div>

				<div class="col-lg-9">
                    <div class="container">
						<form method="post" name="replyForm?pageNumber=${pageNumber}" action="reply.mall">
							<input type="hidden" name="QREF" value="${QREF }">
							<input type="hidden" name="QRESTEP" value="${QRESTEP }">
							<input type="hidden" name="QRELEVEL" value="${QRELEVEL }">
							
							<table>
								<tr>
									<td colspan="2" align="right">
										<a href="qna.mall?pageNumber=${pageNumber }">글목록</a>
									</td>
								</tr>
								
								<tr>
									<td width="100">작성자</td>
									<td width="350">
										<input type="text" name="QID" value="ADMIN" readonly="readonly">
									</td>
								</tr>
								
								<tr>
									<td width="100">제목</td>
									<td width="350">
										<input type="text" name="QSUBJECT" value="[답글]">
									</td>
								</tr>
								
								<tr>
									<td width="100">내용</td>
									<td width="350">
										<textarea name="QCONTENT" rows="15" cols="50">내용입니다.</textarea>
									</td>
								</tr>
								
								<tr>
			            			<th>비밀번호</th>
			            			<td>
			            				<input type="password" name="QPW" value="${QNABean.QPW }">
			            				<form:errors path="QPW" cssClass="err" />
			            			</td>
			            		</tr>
								
								<tr>
									<td colspan="2" align="center">
										<input type="submit" value="댓글쓰기">
										<input type="reset" value="다시작성">
										<input type="button" value="목록보기" onclick="location.href='qna.mall?pageNumber=${pageNumber }'">
									</td>
								</tr>
		
							</table>
						</form>
					</div> 				              
            	</div>
			</div>
    	</div> 
    </section>





<%@include file="../display/bottom.jsp" %>