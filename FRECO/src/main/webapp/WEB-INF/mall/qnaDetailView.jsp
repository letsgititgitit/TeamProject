<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../common/common.jsp" %>
<%@include file="./../display/top_header.jsp" %> 
<%@include file="../display/top.jsp" %>



<!-- qnaDetailView.jsp  <br> -->



 <!-- aside Section Begin -->
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
    <!-- aside Section End -->
    
    <br><br> 



<!-- Hero Section Begin -->
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
                    	<div align="center">
                    		<h2>상세보기</h2>                  		
                    	</div> <br>        
                    	
    					<table class="table table-hover">
	    						<tr>   							
					    			<th>번호</th>
					    			<td>${qna.QNUM}</td>
					    		</tr>
					    		
					    		<tr>   							
					    			<th>답변상태</th>
					    			<td style="color: red">${qna.QREPLY}</td>
					    		</tr>
					    		
					    		<tr>   							
					    			<th>작성자</th>
					    			<td>${qna.QID}</td>
					    		</tr>
					    		
					    		<tr>   							
					    			<th>제목</th>
					    			<td>${qna.QSUBJECT}</td>
					    		</tr>
					    		
					    		<tr>   							
					    			<th>내용</th>
					    			<td>${qna.QCONTENT}</td>
					    		</tr>
					    		
					    		<tr>   							
					    			<th>작성일</th>
					    			<td>
					    				<fmt:parseDate var="fmtDate" value="${qna.QREGDATE}" pattern="yyyy-MM-dd"/>
										<fmt:formatDate var="regDate" value="${fmtDate}" pattern="yyyy-MM-dd"/>
										${regDate}
									</td>
					    		</tr>	
					    		<br>
					    		
					    		<tr>
					    			<td align="center" colspan="2">
					    				<input type="button" value="글수정" onClick="location.href='update.mall?QNUM=${qna.QNUM}&pageNumber=${pageNumber}'"> 
										<input type="button" value="글삭제" onClick="location.href='delete.mall?QNUM=${qna.QNUM}&pageNumber=${pageNumber}'">
										<input type="button" value="답글쓰기" onClick="location.href='reply.mall?QREF=${qna.QREF}&QRESTEP=${qna.QRESTEP }&QRELEVEL=${qna.QRELEVEL }&pageNumber=${pageNumber}'"> 
										<input type="button" value="글목록" onClick="location.href='qna.mall?pageNumber=${pageNumber}'">			
					    			</td>
					    		</tr>			    					    				    				    				    						    		
				    	</table>
			    	 				    				    
				    </div> 				              
            	</div>
            	
    		</div>
    	</div> 
    </section>
   
    <!-- category End -->




<%@include file="../display/bottom.jsp" %>









