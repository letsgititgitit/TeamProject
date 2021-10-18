<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../common/common.jsp" %>
<%@include file="./../display/top_header.jsp" %> 
<%@include file="../display/top.jsp" %>


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
    <!-- Breadcrumb Section End -->
    
    <br><br> 
    
    <!-- QNA Section Begin -->
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
                    	<div align="right">
                    		<a href="insert.mall">글쓰기</a>                  		
                    	</div> <br>        
                    	
    					<table class="table table-hover">
    						<tr>   							
				    			<th>번호</th>
				    			<th>답변상태</th>
				    			<th>제목</th>
				    			<th>작성자</th>
				    			<th>작성일</th>
				    		</tr>
				    		
				    		<c:forEach var="QNA" items="${lists }">			    					    		
				    		<tr class="menu">
				    			<td width="10%" > ${QNA.QNUM} </td>
				    			<td width="15%"> ${QNA.QREPLY} </td>
								<td width="40%"> 
									<c:if test="${QRELEVEL > 0 }">
										${width} = 30 * ${QRELEVEL}									
										<img src="../../img/level.gif" width="${width}" height="15">
										<img src="../../img/re.gif">
									</c:if>
									<c:if test="${QRELEVEL <= 0 }">
										<img src="../../img/level.gif" width="${width}" height="15">
									</c:if>
									<a href="detail.mall?QNUM=${QNA.QNUM}&pageNumber=${pageInfo.pageNumber}"> ${QNA.QSUBJECT} </a>
								</td>
								<td width="15%"> ${QNA.QID} </td>
								<td width="15%"> 
									<fmt:parseDate var="fmtDate" value="${QNA.QREGDATE}" pattern="yyyy-MM-dd"/>
									<fmt:formatDate var="regDate" value="${fmtDate}" pattern="yyyy-MM-dd"/>
									${regDate} 
								</td>
				    		</tr>				    		
				    		</c:forEach>		    				    				    						    		
				    	</table>
				    	
				    	<div align="center">
            				${pageInfo.pagingHtml }
            			</div>				    				    	 				    				    
				    </div>
				              
            	</div>          	
    		</div>
    	</div> 
    </section>
   
    <!-- category End -->
    
	


<%@include file="../display/bottom.jsp" %>