<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../common/common.jsp" %>
<%@include file="./../display/top_header.jsp" %> 
<%@include file="../display/top.jsp" %>

<style>
  summary {
    cursor: pointer;
  }

  summary {
    list-style: none;
  }
  summary::-webkit-details-marker {
    display: none;
  }

</style>

 <!-- Breadcrumb Section Begin -->
    <section class="breadcrumb-section set-bg" data-setbg="img/breadcrumb.jpg">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 text-center">
                    <div class="breadcrumb__text">
                        <h2>자주 하는 질문(FAQ)</h2>
                        <div class="breadcrumb__option">
                            <span>고객센터 - </span>
                            <span>자주 하는 질문(FAQ)</span>
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
    					<table class="table table-hover">
    						<tr>
				    			<td>번호</td>
				    			<td>카테고리</td>
				    			<td align="center">제목</td>
				    		</tr>
				    		
				    		<c:forEach var="faq" items="${lists }">			    					    		
				    		<tr class="menu">
				    			<td width="10%" > ${faq.FNUM} </td>
				    			<td width="15%"> ${faq.FCATEGORY} </td>
				    			<td width="75%">
				    				<details>
				    					<summary> ${faq.FSUBJECT} </summary>
				    					<p> ${faq.FCONTENT} </p>												    				
				    				</details>
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