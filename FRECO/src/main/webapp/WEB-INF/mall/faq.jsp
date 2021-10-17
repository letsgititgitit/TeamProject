<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../common/common.jsp" %>
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

 <!-- aside Section Begin -->
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
				    </div> 				              
            	</div>
            	
    		</div>
    	</div> 
    </section>
    ${pageInfo.pagingHtml }
    <!-- category End -->


<%@include file="../display/bottom.jsp" %>