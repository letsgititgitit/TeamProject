<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %> 
<%@ include file="../display/adminTop.jsp" %> 

<style type="text/css">
	.err{
		color: black;
		font-size: 10px;
		font-weight: bold;	
	}
	.notice{
		color: red;
		font-size: 13px;
		font-weight: bold;
	}
</style>    

<script>

	var fsel = new Array('생활용품','식품','베이비&키즈','반려동물');
	var ssel = [
			['리빙','주방','욕실'],
			['과일','채소','육류&계란','해산물','간편식&밀키트'],
			['식품','생활용품'],
			['사료','간식','용품']		
	];
		
	function init(selCate,selSub){
		//alert(1);
		f_sel = freco.PCATEGORY;
		s_sel = freco.PSUBCATEGORY;
		
		for(var i=0;i<fsel.length;i++){
			if(fsel[i]==selCate){
				f_sel.options[i+1]= new Option(fsel[i]);
				f_sel.options[i+1].selected=true;
				for(var j=0;j<ssel[i].length;j++){
					if(ssel[i][j]==selSub){
						s_sel.options[j+1]= new Option(ssel[i][j]);
						s_sel.options[j+1].selected=true;
					}
					else{
						s_sel.options[j+1]= new Option(ssel[i][j]);
					}
				}
			}//if
			else{
				f_sel.options[i+1]= new Option(fsel[i]);
			}
					
		}	
	}//
	
	function chPCATEGORY(){
		//alert(1);
		f_sel = freco.PCATEGORY;
		s_sel = freco.PSUBCATEGORY;
		
		fIndex = f_sel.selectedIndex;
		//alert(fIndex);
		
		for(var i=s_sel.length;i>0;i--){
			s_sel.options[i]=null;	
		}
		
		for(var i=0;i<ssel[fIndex-1].length;i++){
			s_sel.options[i+1] = new Option(ssel[fIndex-1][i]);
		}		
	}


</script>
    
  
    <!-- content -->
	<div id="layoutSidenav_content">
                <main>
                    <div class="container-fluid px-4">
                         <h1 class="mt-4">PRODUCT UPDATE</h1>
                        <ol class="breadcrumb mb-4">
                            <li class="breadcrumb-item active">FRECO 상품 수정</li>
                        </ol> 
		               <div class="card mb-4">
                          <form:form action="pupdate.product" method="post" enctype="multipart/form-data" name="freco" commandName="productBean">
                          	<input type="hidden" name="PNUM" value="${productBean.PNUM }">
                          	<br>  
                          	<table align="center" height="550">
                          		<tr>
                          			<td>이름&nbsp;</td>
                          			<td><input class="form-control-sm" type="text" name="PNAME" value="${productBean.PNAME }">
                          				<form:errors cssClass="err" path="PNAME"/>
                          			</td>	
                          		</tr>
                          		<tr>
                          			<td>수량&nbsp;</td>
                          			<td><input class="form-control-sm" type="text" name="PQTY" value="${productBean.PQTY }">
                          				<%-- <form:errors cssClass="err" path="PQTY"/> --%>
                          			</td>                        		
                          		</tr>
                          		<tr>
                          			<td>가격&nbsp;</td>
                          			<td><input class="form-control-sm" type="text" name="PPRICE" value="${productBean.PPRICE }">
                          				<%-- <form:errors cssClass="err" path="PPRICE"/> --%>
                          			</td>                       		
                          		</tr>
                          		<tr>
                          			<td>카테고리&nbsp;</td>
                          			<td>
                          				<select class="form-control-sm" name="PCATEGORY" onChange="chPCATEGORY()">
                          					<option value="">카테고리 선택</option>                        				
                         				</select> 
                         				<form:errors cssClass="err" path="PCATEGORY"/>                      
                          			</td>                       		
                          		</tr>
                          		<tr>
                          			<td>세부카테고리&nbsp;</td>
                          			<td>
                          				<select class="form-control-sm" name="PSUBCATEGORY">
                          					<option value="">세부 선택</option>
                          				</select>                      
                          				<form:errors cssClass="err" path="PSUBCATEGORY"/>      			
                          			</td>                       		
                          		</tr>
                          		<tr>
                          			<td>이미지1&nbsp;</td>
                          			<td><input class="form-control-sm" type="file" name="UPLOAD1"> ${productBean.PIMG1 }
                          				<input type="hidden" name="OLDUPLOAD1" value="${productBean.PIMG1 }">
                          			</td>                       		
                          		</tr>
                          		<tr>
                          			<td>이미지2&nbsp;</td>
                          			<td><input class="form-control-sm" type="file" name="UPLOAD2"> ${productBean.PIMG2 }
                          				<input type="hidden" name="OLDUPLOAD2" value="${productBean.PIMG2 }">
                          			</td>                       		
                          		</tr>
                          		<tr>
                          			<td>이미지3&nbsp;</td>
                          			<td><input class="form-control-sm" type="file" name="UPLOAD3"> ${productBean.PIMG3 }
                          				<input type="hidden" name="OLDUPLOAD3" value="${productBean.PIMG3 }">
                          			</td>                       		
                          		</tr>
                          		<tr>
                          			<td>이미지4&nbsp;</td>
                          			<td><input class="form-control-sm" type="file" name="UPLOAD4"> ${productBean.PIMG4 }
                          				<input type="hidden" name="OLDUPLOAD4" value="${productBean.PIMG4 }">
                          			</td>                       		
                          		</tr>
                          		<tr>
                          			<td>이미지5&nbsp;</td>
                          			<td><input class="form-control-sm" type="file" name="UPLOAD5"> ${productBean.PIMG5 }
                          				<input type="hidden" name="OLDUPLOAD5" value="${productBean.PIMG5 }">
                          			</td>                       		
                          		</tr>
                          		
                          		<tr>
                          			<td>상품 정보&nbsp;</td>
                          			<td><input class="form-control-sm" type="file" name="INFOUPLOAD"> ${productBean.PINFOIMG }
                          				<input type="hidden" name="OLDINFOUPLOAD" value="${productBean.PINFOIMG }">
                          			</td>                       		
                          		</tr>
                          		<tr>
                          			<td>상품 설명&nbsp;</td>
                          			<td><input class="form-control-sm" type="file" name="SUBUPLOAD"> ${productBean.PSUBIMG }
                          				<input type="hidden" name="OLDSUBUPLOAD" value="${productBean.PSUBIMG }">
                          			</td>                       		
                          		</tr>
                          		<tr>                 
                          			<td colspan="2" align="center"><input type="submit" class="btn btn-outline-dark" value="상품 수정">                       			
                          			<input type="button" class="btn btn-outline-dark" value="이전화면" onClick="location.href='javascript:history.go(-1)'"></td>                        			
                          		</tr>                                     
                          	</table>
                          	<center>
                          	<p class="notice">※파일 미 선택시 기존 파일이 유지됩니다</p>
                          	</center>
                          </form:form>
                    
                        <br></div>
                    </div>
                    
                </main>
                
<%@ include file="../display/adminBottom.jsp" %> 