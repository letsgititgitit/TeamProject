<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../common/common.jsp" %>
<%@include file="../display/top.jsp" %>


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
    <section class="hero">
        <div class="container">
            <div class="row">
            
                <div class="col-lg-3">               
                    <div>
						<h3>고객센터</h3>
						<div><a href="#">공지사항</a></div>
						<div><a href="faq.mall">FAQ</a></div>
						<div><a href="qna.mall">1:1문의</a></div>
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
								<td width="40%"> <a href="detail.mall?QNUM=${QNA.QNUM}"> ${QNA.QSUBJECT} </a></td>
								<td width="15%"> ${QNA.QID} </td>
								<td width="15%"> 
									<fmt:parseDate var="fmtDate" value="${QNA.QREGDATE}" pattern="yyyy-MM-dd"/>
									<fmt:formatDate var="regDate" value="${fmtDate}" pattern="yyyy-MM-dd"/>
									${regDate} 
								</td>
				    		</tr>				    		
				    		</c:forEach>		    				    				    						    		
				    	</table>
			    	 				    				    
				    </div> 				              
            	</div>
            	
    		</div>
    	</div> 
    </section>
   
    <!-- category End -->
    
	


<%@include file="../display/bottom.jsp" %>