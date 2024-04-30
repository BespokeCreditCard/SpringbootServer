// Function to calculate percentage and label
function calculatePercentageWithLabel(data, labels) {
  var total = data.reduce((acc, val) => acc + val, 0);
  return data.map((value, index) => {
    var percentage = Math.round((value / total) * 100);
    return `${labels[index]}: ${percentage}% (${value})`;
  });
}

// Pie Chart Example
var ctx = document.getElementById("myPieChart");
var myPieChart = new Chart(ctx, {
  type: 'doughnut',
  data: {
    labels: ["가구", "가전제품", "건강식품", "건물및시설관리", "건축/자재",
    "광학제품", "농업", "레져업소", "레져용품", "문화/취미",
    "보건/위생", "보험", "사무/통신기기", "서적/문구", "수리서비스",
    "숙박업", "신변잡화", "여행업", "연료판매", "용역서비스",
    "유통업비영리", "유통업영리", "음식료품", "의료기관", "의류",
    "일반/휴게음식", "자동차정비/유지", "자동차판매", "주방용품",
    "직물", "학원", "회원제형태업소"],
    datasets: [{
      data: [20, 50, 30, 10, 25, 15, 35, 45, 20, 30, 15, 25, 40, 20, 35, 10, 5, 20, 30, 25, 15, 10, 40, 20, 50, 30, 15, 25, 40, 20, 35, 10], // 예시 데이터 (각 항목의 값을 나타냄)
      backgroundColor: ['#4e73df', '#1cc88a', '#36b9cc', '#ff9900', '#ff6600', '#ff3300', '#33cc33', '#ff0000', '#cc00ff', '#6600ff', '#009999', '#ff66cc', '#9966ff', '#66ff66', '#ffff00', '#ff99cc', '#ff9966', '#ffcc66', '#99cc00', '#ff33cc', '#33ccff', '#cccc00', '#ccccff', '#ffcccc', '#ffccff', '#ccffff', '#ffffcc', '#ccffcc', '#ccff99', '#ff9999', '#ffcc99', '#ff9999'], // 색상 설정
      hoverBackgroundColor: ['#2e59d9', '#17a673', '#2c9faf', '#ffcc00', '#ff9933', '#ff6600', '#00ff00', '#ff5050', '#9900cc', '#3300cc', '#006666', '#ff33cc', '#6600cc', '#00cc00', '#ffff00', '#ff66cc', '#ff9966', '#ffcc66', '#99cc00', '#ff33cc', '#33ccff', '#cccc00', '#ccccff', '#ffcccc', '#ffccff', '#ccffff', '#ffffcc', '#ccffcc', '#ccff99', '#ff9999', '#ffcc99', '#ff9999'], // 호버 효과 색상 설정
      hoverBorderColor: "rgba(234, 236, 244, 1)",
    }],
  },
  options: {
    maintainAspectRatio: false,
    tooltips: {
      backgroundColor: "rgb(255,255,255)",
      bodyFontColor: "#858796",
      borderColor: '#dddfeb',
      borderWidth: 1,
      xPadding: 15,
      yPadding: 15,
      displayColors: false,
      caretPadding: 10,
      callbacks: {
        label: function(tooltipItem, data) {
          return calculatePercentageWithLabel(data.datasets[tooltipItem.datasetIndex].data, data.labels)[tooltipItem.index];
        }
      }
    },
    legend: {
      display: false
    },
    cutoutPercentage: 80,
  },
});
