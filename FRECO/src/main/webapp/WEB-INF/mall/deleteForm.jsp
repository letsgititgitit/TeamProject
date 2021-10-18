<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../common/common.jsp" %>
<%@include file="./../display/top_header.jsp" %> 
<%@include file="../display/top.jsp" %>

<!-- deleteForm.jsp <Br> -->


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
            <form action="delete.mall?pageNumber=${pageNumber}" method="post">
            	<input type="hidden" name="QNUM" value="${QNUM}">
	            <div align="center">
	   				비밀번호 &nbsp;&nbsp; <input type="password" name="QPW" value="${QNABean.QPW }">

	   			</div><br>
	   			
	   			<div align="center">
	   				<input type="submit" value="삭제"> &nbsp;&nbsp;
	   				<input type="button" value="목록보기" onClick="document.location.href='qna.mall?pageNumber=${pageNumber}'">			
	   			</div>
			</form>
		</div>
	</section>







<%@include file="../display/bottom.jsp" %>