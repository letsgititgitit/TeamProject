<%@page import="member.model.MemberDao"%>
<%@page import="member.model.MemberBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="./../common/common.jsp" %> 
<% MemberBean loginInfo = (MemberBean)session.getAttribute("loginInfo"); %>
        <div class="header__top">
            <div class="container">
                <div class="row">
                   <div class="col-lg-12 col-md-12">
                        <div class="header__top__right">
                        <!-- 사용자님 반갑습니다 | 로그아웃 -->
                    <c:choose>
                    	<c:when test="${loginInfo.getMID()	== null }">
                            <div class="header__top__right__auth">
                               <a href="login.me">로그인&nbsp;</a>
                            </div>
                                 <a>&nbsp;|&nbsp;</a> 
                            <div class="header__top__right__auth">
                               <a href="registerForm.me">&nbsp;회원가입</a>
                            </div>
                        </c:when> 
                        <c:otherwise>
                        	<div class="header__top__right__auth">
                              	<a>${loginInfo.getMNAME()}님 반갑습니다</a>
                            </div>
                                 <a>&nbsp;|&nbsp;</a> 
                            <div class="header__top__right__auth">
                               <a href="Logout.jsp">&nbsp;로그아웃</a>
                            </div>
                        </c:otherwise>
                     </c:choose>
                        </div>                       
                    </div>
                    
                </div>
            </div>
        </div>
      