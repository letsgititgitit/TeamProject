
 var ctx = document.getElementById("pieChart");
 var myLineChart = new Chart(ctx, {
 	type: 'pie',
 	data: {
  labels: [
    '구매',
    '환불'
  ],
	  datasets: [{
	    label: 'Dataset',
	    data: [100, 50],
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



 //기본 꺽은 선형 차트
 var ctx2 = document.getElementById("myChart2");
 var myLineChart2 = new Chart(ctx2, {
     type: 'line',   
     data: {
      labels: ["월요일", "화요일", "수요일", "목요일", "금요일", "토요일", "일요일"],
      datasets: [{
        label: '주문 수',
       data: [75, 69, 90, 41, 36, 45, 20],
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
 
 
 
