<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../common/common.jsp" %>
<%@include file="./../display/top_header.jsp" %> 
<%@include file="../display/top.jsp" %>

<script type="text/javascript">
	function aClick() {
		alert("작성자만 볼 수 있습니다.");
	}
</script>


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
                    	 		<!-- <li><a href="#">공지사항</a></li> -->
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
				    		
				    		<!-- 현재 게시판 레코드의 토탈 갯수 - ((현재 페이지-1) * 한 화면에 보여질 레코드의 갯수) -->
				    		<c:set var="vnum" value="${count - (pageInfo.pageNumber-1) * 5}"/>  
				    		<c:forEach var="QNA" items="${lists }">				    				    					    		
					    		<tr class="menu">
					    			<td width="10%" >
					    				${vnum }	    				
					    			</td>
					    			<td width="15%"> ${QNA.QREPLY} </td>
									<td width="40%"> 
										<c:if test="${QNA.QRELEVEL > 0 }">
											<c:set var="width" value="${QNA.QRELEVEL * 30}"/>								
											<img src="img/level.gif" width="${width}" height="15">
											<img src="img/re.gif">
										</c:if>
										<c:if test="${QNA.QRELEVEL <= 0 }">
											<img src="img/level.gif" width="${width}" height="15">
										</c:if>
										
										<!-- 관리자로 로그인 했을 경우  -->
										<c:if test="${ loginInfo.getMID() eq 'ADMIN' }">
											<a href="detail.mall?QNUM=${QNA.QNUM}&pageNumber=${pageInfo.pageNumber}"> ${QNA.QSUBJECT}</a>
										</c:if>																				
										<!-- 사용자로 로그인 했을 경우  -->
										<c:if test="${ loginInfo.getMID() != 'ADMIN' }">
											<!-- QNA에서 제목 클릭해서 detailView로 넘어갈 때 관리자 답변일 경우  -->
											<c:if test="${ QNA.QID eq 'ADMIN' }">
												<a href="detail.mall?QNUM=${QNA.QNUM}&pageNumber=${pageInfo.pageNumber}"> ${QNA.QSUBJECT}</a>
											</c:if>
											<!-- QNA에서 제목 클릭해서 detailView로 넘어갈 때 관리자 답변이 아닐 경우  -->
											<c:if test="${ QNA.QID != 'ADMIN' }">
												<!-- QNA에서 제목 클릭해서 detailView로 넘어갈 때 작성자와 로그인한 사람이 다를 경우  -->
												<c:if test="${QNA.QID != loginInfo.getMID()}">											
													<a href="qna.mall?QNUM=${QNA.QNUM}&pageNumber=${pageInfo.pageNumber}" onClick="aClick()"> ${QNA.QSUBJECT}</a>												
												</c:if>
												<!-- QNA에서 제목 클릭해서 detailView로 넘어갈 때 작성자와 로그인한 사람이 같을 경우  -->
												<c:if test="${QNA.QID eq loginInfo.getMID()}">																							
													<a href="detail.mall?QNUM=${QNA.QNUM}&pageNumber=${pageInfo.pageNumber}"> ${QNA.QSUBJECT}</a>
												</c:if>	
											</c:if>
										</c:if>
									</td>
									<td width="15%"> ${QNA.QID} </td>
									<td width="15%"> 
										<fmt:parseDate var="fmtDate" value="${QNA.QREGDATE}" pattern="yyyy-MM-dd"/>
										<fmt:formatDate var="regDate" value="${fmtDate}" pattern="yyyy-MM-dd"/>
										${regDate} 
									</td>
					    		</tr>
					    		<c:set var="vnum" value="${vnum-1 }" />			    					    		
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