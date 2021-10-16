<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../display/adminTop.jsp" %>    
    
				<div id="layoutSidenav_content">
                <main>
                    <div class="container-fluid px-4">
                         <h1 class="mt-4">MEMBER INQUIRY LIST</h1>
                        <ol class="breadcrumb mb-4">
                            <li class="breadcrumb-item active">FRECO 문의 내역</li>
                        </ol> 
                        <center>
                       <div class="col-xl-4 col-md-6">
                                <div class="card bg-danger text-white mb-4 justify-content-between">
                                    <div class="card-body">답변 대기<h3>0개</h3></div>
                                    <div class="card-footer d-flex align-items-center justify-content-between">                                   
                                       	 <a class="small text-white stretched-link" type="button" onClick="#">확인하기</a>                                                                                                   
                                        <div class="small text-white"><i class="fas fa-angle-right"></i></div>
                                    </div>                                          
                                </div>
                            </div>
                            </center>    
                       
                        <div class="card mb-4">
                            <div class="card-header">
                                <i class="fas fa-table me-1"></i>
                                MEMBER INQUIRY LIST
                            </div>
                            <div class="card-body">
                                <table id="datatablesSimple">
                                    <thead>
                                        <tr>
                                            <th>아이디</th>
                                            <th>제목</th>
                                            <th>내용</th>
                                            <th>상태확인</th>
                                            <th>미정</th>
                                            <th>미정</th>
                                            <th>미정</th>
                                        </tr>
                                    </thead>
                            
                                    <tbody>
                                        <tr>
                                            <td>1</td>
                                            <td>System</td>
                                            <td>홍길동</td>
                                            <td>01033334444</td>
                                            <td>17342 서울특별시 우현로 67 강서힐스테이트 121동 303호</td>
                                            <td>1</td>
                                            <td>1000</td>
                                        </tr>
                                     
                              
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </main>

<%@ include file="../display/adminBottom.jsp" %> 