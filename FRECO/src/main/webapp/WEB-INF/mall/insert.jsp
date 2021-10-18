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

<!-- insert.jsp -->

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
    			
    			
	            <form:form commandName="QNABean" action="insert.mall" method="post">
		            <div align="center">
		   				<h3>글쓰기</h3> <br><br> 
		   			</div>
		   			
		   			<div>		            			 
		            	<table>
		            		<tr>
		            			<th>작성자</th>
		            			<td>
		            				<input type="text" name="QID" value="${loginInfo.MID}" readonly>
		            				<form:errors path="QID" cssClass="err" />
		            				<input type="hidden" name="QREPLY" value="답변대기">
		            			</td>
		            		</tr>

		            		<tr>
		            			<th>제목</th>
		            			<td>
		            				<input type="text" name="QSUBJECT" value="${QNABean.QSUBJECT }">
		            				<form:errors path="QSUBJECT" cssClass="err" />
		            			</td>
		            		</tr> 
		            		
		            		<tr>
		            			<th>내용</th>
		            			<td>
		            				<textarea name="QCONTENT" rows="15" cols="50">${QNABean.QCONTENT }</textarea>
		            				<form:errors path="QCONTENT" cssClass="err" />
		            			</td>
		            		</tr>
		            		
		            		<tr>
		            			<th>비밀번호</th>
		            			<td>
		            				<input type="password" name="QPW" value="${QNABean.QPW }">
		            				<form:errors path="QPW" cssClass="err" />
		            			</td>
		            		</tr>
		            	</table> <br>

		            	<div align="center">
		            		<input type="submit" value="글쓰기"> &nbsp;
							<input type="reset" value="다시작성"> &nbsp;
							<input type="button" value="목록보기" onClick="document.location.href='qna.mall?pageNumber=${pageNumber}'">			
		            	</div>
	            	</div>		                         	 
	            </form:form>
			</div>
   		</div>							
    </section>
   
    <!-- category End -->





<%@include file="../display/bottom.jsp" %>

















