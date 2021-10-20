<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../display/adminTop.jsp" %>    
<%@include file="../common/common.jsp" %>
<style type="text/css">
	.content{	
	background: #F3F3F3;
	font-size: 17px;
	padding: 40px;
	}
</style>
		
		<div id="layoutSidenav_content">             
               <main>
                    <div class="container-fluid px-4">
                         <h1 class="mt-4">REVIEW REPLY</h1>
                        <ol class="breadcrumb mb-4">
                            <li class="breadcrumb-item active"><a class="btn btn-outline-dark" onClick="javascript:location.href='review.admin'">FRECO 리뷰 내역</a></li>
                        </ol> 
                       
                       
                        <div class="card mb-4">
                            <div class="card-header">
                                <i class="fas fa-table me-1"></i>
                                리뷰 답글 수정
                            </div>
                            <div class="card-body">
                            
                <form action="reviewUpdate.admin" method="post"> 
                <input type="hidden" name="RNUM" value=${rbean.RNUM } >         
                <input type="hidden" name="RREF" value=${rbean.RREF } >         
                 <center>                          
                  <div class="col-lg-9">
                    <div class="container">                   
	 					<table class="table table-hover" align="center">
	    				
					    		<tr>   							
					    			<th width="10%">작성자</th>
					    			<td width="90%">${rbean.RID }</td>					    			
					    		</tr>
    		
					    		<tr>   							
					    			<td colspan="4" align="center"><b> 답변 내용</b></td>
					    		</tr>
					    		<tr>	
					    			<td colspan="4" align="center">
					    				<textarea name="RCONTENT" rows="10" cols="100">${rbean.RCONTENT }</textarea>					    			
					    			</td>
					    		</tr>	
					    		</tr>
					    		<br>
					    		
					    		<tr>
					    			<td align="center" colspan="4">					    				
										<input type="submit" value="수정하기" class="btn btn-outline-dark"> 						
										<input type="button" value="목록가기" class="btn btn-outline-dark" onClick="location.href='review.admin'"> 						
					    			</td>
					    		</tr>			    					    				    				    				    						    		
				    	</table>
			    	 				    				    
				    </div>				              
            	 </div>
                </center>               
				 </form>
                            </div>
                        </div>
                    </div>
                </main>


<%@ include file="../display/adminBottom.jsp" %>