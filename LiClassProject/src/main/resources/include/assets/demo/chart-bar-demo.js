
// Set new default font family and font color to mimic Bootstrap's default styling
Chart.defaults.global.defaultFontFamily = '-apple-system,system-ui,BlinkMacSystemFont,"Segoe UI",Roboto,"Helvetica Neue",Arial,sans-serif';
Chart.defaults.global.defaultFontColor = '#292b2c';
// Bar Chart Example
var ctx = document.getElementById("myBarChart");

var myLineChart = new Chart(ctx, {
  type: 'horizontalBar',
  data: {
    labels: ['계정', '매출', '예약'],
    datasets: [{
      label: '어제',
      data: [${userState.INACTIVEUSER}, 3, 20],
      backgroundColor: "rgb(204,229,255)",
      borderColor: "rgb(204,229,255)",
    },
      {
        label: '오늘',
        data: [${userState.ACTIVEUSER}, 7, 14],
        backgroundColor: "rgb(255,229,204)",
        borderColor: "rgb(255,229,204)",
      }]
  },
  options: {
    responsive: true,
    title: {
      display: false,
      text: 'Report',
    },
    tooltips: {
      mode: 'index',
      intersect: false,
    },
    hover: {
      mode: 'nearest',
      intersect: true
    },
    scales: {
      yAxes: [{
        display: true,
        scaleLabel: {
          display: false,
          labelString: 'x축'
        },
        gridLines :{
          display: false,
        },
      }],
      xAxes: [{
        display: true,
        ticks: {
          display :false,
          autoSkip: false
        },
        gridLines :{
          display: false,
        },
        scaleLabel: {
          display: false,
          labelString: 'y축'
        },

      }]
    },
    legend:{
      display : false
    }
  }
});
