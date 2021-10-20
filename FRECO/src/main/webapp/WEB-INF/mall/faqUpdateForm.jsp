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

<!-- faqUpdateForm.jsp -->

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
    			
    			
	            <form:form commandName="faq" action="faqupdate.mall?pageNumber=${pageNumber}" method="post">
		            <div align="center">
		   				<h3>FAQ 수정하기</h3> <br><br> 
		   			</div>
		   			
		   			<div>		            			 
		            	<table>		            		
		            		<tr>
		            			<th>카테고리</th>
		            			<td>
		            				<input type="hidden" name="FNUM" value="${FNUM}">
		            				<select name="FCATEGORY">
		            					<option value="">선택하세요</option>
		            					<option value="배송문의" <c:if test="${faq.FCATEGORY eq '배송문의'}">selected</c:if> >배송문의</option>
		            					<option value="교환/반품/환불" <c:if test="${faq.FCATEGORY eq '교환/반품/환불'}">selected</c:if> >교환/반품/환불</option>
		            					<option value="주문결제" <c:if test="${faq.FCATEGORY eq '주문결제'}">selected</c:if> >주문결제</option>
		            					<option value="기타문의" <c:if test="${faq.FCATEGORY eq '기타문의'}">selected</c:if> >기타문의</option>
		            				</select>
		            				<form:errors path="FCATEGORY" cssClass="err" />
		            			</td>
		            		</tr>

		            		<tr>
		            			<th>제목</th>
		            			<td>
		            				<input type="text" name="FSUBJECT" value="${faq.FSUBJECT }">
		            				<form:errors path="FSUBJECT" cssClass="err" />
		            			</td>
		            		</tr> 
		            		
		            		<tr>
		            			<th>내용</th>
		            			<td>
		            				<textarea name="FCONTENT" rows="15" cols="50">${faq.FCONTENT}</textarea>
		            				<form:errors path="FCONTENT" cssClass="err" />
		            			</td>
		            		</tr>
		            				            		
		            	</table> <br>

		            	<div align="center">
		            		<input type="submit" value="수정하기"> &nbsp;
							<input type="reset" value="다시작성"> &nbsp;
							<input type="button" value="목록보기" onClick="document.location.href='faq.mall?pageNumber=${pageNumber}'">			
		            	</div>
	            	</div>		                         	 
	            </form:form>
			</div>
   		</div>							
    </section>
   
    <!-- category End -->





<%@include file="../display/bottom.jsp" %>

















