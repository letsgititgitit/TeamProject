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
</style>    

<script>

	var fsel = new Array('생활용품','식품','베이비&키즈','반려동물');
	var ssel = [
			['리빙','주방','욕실'],
			['과일','채소','육류&계란','해산물','간편식&밀키트'],
			['식품','생활용품'],
			['사료','간식','용품']		
	];
	
	function init(){
		//alert(1);
		f_sel = freco.PCATEGORY;
		s_sel = freco.PSUBCATEGORY;
		
		for(var i=0;i<fsel.length;i++){
			f_sel.options[i+1]= new Option(fsel[i]);
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
                         <h1 class="mt-4">PRODUCT INSERT</h1>
                        <ol class="breadcrumb mb-4">
                            <li class="breadcrumb-item active">FRECO 상품 등록</li>
                        </ol> 
		               <div class="card mb-4">
                          <form:form action="pinsert.product" method="post" enctype="multipart/form-data" name="freco" commandName="productBean">
                          	<br>  
                          	<table align="center" height="550" width="400">
                          		<tr>
                          			<td>이름&nbsp;</td>
                          			<td><input class="form-control-sm" type="text" name="PNAME" placeholder="상품 이름">
                          				<form:errors cssClass="err" path="PNAME"/>
                          			</td>	
                          		</tr>
                          		<tr>
                          			<td>수량&nbsp;</td>
                          			<td><input class="form-control-sm" type="text" name="PQTY" value="50">
                          				<%-- <form:errors cssClass="err" path="PQTY"/> --%>
                          			</td>                        		
                          		</tr>
                          		<tr>
                          			<td>가격&nbsp;</td>
                          			<td><input class="form-control-sm" type="text" name="PPRICE" value="10000">
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
                          			<td><input class="form-control-sm" type="file" name="UPLOAD1"></td>                       		
                          		</tr>
                          		<tr>
                          			<td>이미지2&nbsp;</td>
                          			<td><input class="form-control-sm" type="file" name="UPLOAD2"></td>                       		
                          		</tr>
                          		<tr>
                          			<td>이미지3&nbsp;</td>
                          			<td><input class="form-control-sm" type="file" name="UPLOAD3"></td>                       		
                          		</tr>
                          		<tr>
                          			<td>이미지4&nbsp;</td>
                          			<td><input class="form-control-sm" type="file" name="UPLOAD4"></td>                       		
                          		</tr>
                          		<tr>
                          			<td>이미지5&nbsp;</td>
                          			<td><input class="form-control-sm" type="file" name="UPLOAD5"></td>                       		
                          		</tr>
                          		
                          		<tr>
                          			<td>상품 정보&nbsp;</td>
                          			<td><input class="form-control-sm" type="file" name="INFOUPLOAD">
                          			</td>                       		
                          		</tr>
                          		<tr>
                          			<td>상품 설명&nbsp;</td>
                          			<td><input class="form-control-sm" type="file" name="SUBUPLOAD">
                          			</td>                       		
                          		</tr>
                          		<tr>                 
                          			<td colspan="2" align="center"><input type="submit" class="btn btn-outline-dark" value="상품 등록">                       			
                          			<input type="button" class="btn btn-outline-dark" value="이전화면" onClick="location.href='javascript:history.go(-1)'"></td>                        			
                          		</tr>                
                          	</table>
                          	
                          </form:form>
                    
                        <br></div>
                    </div>
                    
                </main>
                
<%@ include file="../display/adminBottom.jsp" %> 