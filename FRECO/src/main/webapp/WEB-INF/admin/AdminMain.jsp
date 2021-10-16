<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ include file="../display/adminTop.jsp" %> 
<%@include file="../common/common.jsp" %> 
          <!--   content -->                
            <div id="layoutSidenav_content">
                <main>
                    <div class="container-fluid px-4">
                         <h1 class="mt-4">ADMIN MAIN</h1>
                        <ol class="breadcrumb mb-4">
                            <li class="breadcrumb-item active">FRECO 관리자</li>
                        </ol> 
                        <div class="row">
                            <div class="col-xl-4 col-md-6">
                                <div class="card bg-primary text-white mb-4">
                                    <div class="card-body">오늘 주문 <h2>0개</h2></div>                                 
                                </div>
                            </div>
                           
                            <div class="col-xl-4 col-md-6">
                                <div class="card bg-success text-white mb-4">
                                    <div class="card-body">관리자 처리 완료 <h2>0개</h2></div>                        
                                </div>
                            </div>
                            <div class="col-xl-4 col-md-6">
                                <div class="card bg-danger text-white mb-4">
                                    <div class="card-body">관리자 미처리 현황 <h2>0개</h2></div>                               
                                </div>
                            </div>
                        </div>
                        
                        <div class="row">
                            <div class="col-xl-6">
                                <div class="card mb-4">
                                    <div class="card-header">
                                        <i class="fas fa-chart-area me-1"></i>
                                        주문/환불 차트
                                    </div>
                                    <div class="card-body"><center><canvas id="levelChart" width="200" height="230"></canvas></center></div>
                                </div>
                            </div>
                            <div class="col-xl-6">
                                <div class="card mb-4">
                                    <div class="card-header">
                                        <i class="fas fa-chart-bar me-1"></i>
                                        주문수 차트
                                    </div>
                                    <div class="card-body"><canvas id="orderChart" width="100%" height="40"></canvas></div>
                                </div>
                            </div>
                        </div>
                        
                         <div class="card mb-4">
                            <div class="card-header">
                                <i class="fas fa-table me-1"></i>
                                ORDER LIST
                            </div>
                            <div class="card-body">
                                <table id="datatablesSimple">
                                    <thead>
                                        <tr>
                                            <th>주문 번호</th><!-- 누르면 주문 정보로 넘어감 -->
                                            <th>아이디</th>
                                           <!--  <th>상품</th>
                                            <th>가격</th> -->
                                            <th>주문 날짜</th>
                                            <th>처리 현황</th>
                                            <!-- 환불은 버튼으로 이동 refund.admin 가서 CartInfo의 total point, total price 0으로,
                                            	member 테이블 point 적립됐던거 빼기(mid로 member 테이블에서 mpoint 구하고 적립된 point구해서 빼기), 
                                            	mcoupon이 null이라면 다시 update 내용은 coupon 테이블에서 갖고 오고 -->
                                        </tr>
                                    </thead>
                                   
                                    <tbody>
                                        <tr>
                                        	<td><input type="button" class="btn btn-outline-dark btn-sm" value="12312" onClick="location.href='orderDetail.admin'"></td>
                                            <td>lee</td>
                                         <!--    <td>Edinburgh</td>
                                            <td>15000</td> -->
                                            <td>2011/04/25</td>                        
                                            <td>
                                            
                                            	<%--  <c:choose>
                                            	<c:when test="">
                                            		<input type="button" class="btn btn-outline-danger btn-sm" value="환불" onClick="">
                                            	</c:when>
                                            	<c:otherwise>
                                            		<input type="button" class="btn btn-outline-dark btn-sm" value="주문" onClick="">
                                            	</c:otherwise>
                                            </c:choose> --%>
                                            	<input type="button" class="btn btn-outline-danger btn-sm" value="환불" onClick="">
                                            </td>
                                        </tr>
                                       
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                   
              <!-- 차트 설정 -->
              <script>
					 var ctx = document.getElementById("levelChart");
					 var myLineChart = new Chart(ctx, {
					 	type: 'pie',
					 	data: {
					  labels: [
					    '구매',
					    '환불'
					  ],
						  datasets: [{
						    label: 'Dataset',
						    data: [10, 50],
						    backgroundColor: [
						      'rgb(54, 162, 235)',
						      'rgb(255, 99, 132)'
						    ],
						    hoverOffset: 2
						  }]
					  },
					  options: {
					        responsive: false
					     }
					});
					
					 
					 
					 var ctx2 = document.getElementById("orderChart");
						var myLineChart2 = new Chart(ctx2, {
						     type: 'line',   
						     data: {
						      labels: ["월요일", "화요일", "수요일", "목요일", "금요일", "토요일", "일요일"],
						      datasets: [{
						        label: '주문 수',
						       data: [ 
						    	   	
						    	   10, 69, 90, 41, 36, 45, 20
						    	   	
						    	   	],
						       borderColor: [
						                  'rgba(255, 99, 132, 0.2)',//red
						                ]            	        
						      }]
						     },
						     options: {
						         scales: {
						             yAxes: [{
						                 stacked: true
						             }]
						         }
						     }
						 });
					
				</script> 
 
                
 
                </main>
<%@ include file="../display/adminBottom.jsp" %>               
