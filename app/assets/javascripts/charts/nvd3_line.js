nv.addGraph(function() {  
  var chart = nv.models.lineChart();

  chart.xAxis
     .axisLabel('Date')
     .tickFormat(d3.format(',r'));

  chart.yAxis
     .axisLabel('Number of Troops')
     .tickFormat(d3.format('.02f'));

  d3.select('#chart svg')
    .datum(sinAndCos())
    .transition().duration(500)
    .call(chart);

  nv.utils.windowResize(function() { d3.select('#chart svg').call(chart) });

  return chart;
});

/* Generate Data */

function sinAndCos() {
  var sin = [],
     cos = [];

  for (var i = 0; i < 100; i++) {
   sin.push({x: i, y: Math.sin(i/10)});
   cos.push({x: i, y: .5 * Math.cos(i/10)});
  }

  return [
   {
     values: sin,
     key: 'Troops Donated',
     color: '#00FF00'
   },
   {
     values: cos,
     key: 'Troops Received',
     color: '#FF0000'
   }
  ];
}

//var parseDate = d3.time.format("%Y-%m-%d_%H:%M:%S+%Z");
//
//data.forEach(function(d) {
//    d.date = parseDate(d.date);
//});
