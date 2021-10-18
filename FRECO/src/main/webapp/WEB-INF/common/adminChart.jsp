<%@page import="java.util.Calendar"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<% SimpleDateFormat date7 = new SimpleDateFormat("yyyy-MM-dd");
Calendar cal7 = Calendar.getInstance();

cal7.add(Calendar.DAY_OF_MONTH,-6);
String day7date = date7.format(cal7.getTime());
request.setAttribute("day7date", day7date);

SimpleDateFormat date6 = new SimpleDateFormat("yyyy-MM-dd");
Calendar cal6 = Calendar.getInstance();

cal6.add(Calendar.DAY_OF_MONTH,-5);
String day6date = date6.format(cal6.getTime());
request.setAttribute("day6date", day6date);

SimpleDateFormat date5 = new SimpleDateFormat("yyyy-MM-dd");
Calendar cal5 = Calendar.getInstance();

cal5.add(Calendar.DAY_OF_MONTH,-4);
String day5date = date5.format(cal5.getTime());
request.setAttribute("day5date", day5date);

SimpleDateFormat date4 = new SimpleDateFormat("yyyy-MM-dd");
Calendar cal4 = Calendar.getInstance();

cal4.add(Calendar.DAY_OF_MONTH,-3);
String day4date = date4.format(cal4.getTime());
request.setAttribute("day4date", day4date);

SimpleDateFormat date3 = new SimpleDateFormat("yyyy-MM-dd");
Calendar cal3 = Calendar.getInstance();

cal3.add(Calendar.DAY_OF_MONTH,-2);
String day3date = date3.format(cal3.getTime());
request.setAttribute("day3date", day3date);

SimpleDateFormat date2 = new SimpleDateFormat("yyyy-MM-dd");
Calendar cal2 = Calendar.getInstance();

cal2.add(Calendar.DAY_OF_MONTH,-1);
String day2date = date2.format(cal2.getTime());
request.setAttribute("day2date", day2date);

SimpleDateFormat date1 = new SimpleDateFormat("yyyy-MM-dd");
Calendar cal1 = Calendar.getInstance();

String day1date = date1.format(cal1.getTime());
request.setAttribute("day1date", day1date);  %>

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
						    data: [${ordercnt}, ${refundcnt}],
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
						    	
						      labels: ["${day7date}","${day6date}","${day5date}","${day4date}","${day3date}","${day2date}","${day1date}"],
						      
						      datasets: [{
						        label: '주문 수',
						       data: [ 
						    	   	
						    	   ${day7cnt},${day6cnt},${day5cnt},${day4cnt},${day3cnt},${day2cnt},${day1cnt}
						    	   	
						    	   	],
						       borderColor: [
						                  'rgb(54, 162, 235)',
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