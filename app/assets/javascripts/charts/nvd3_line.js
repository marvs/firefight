var member = $('#member_name').text();
var parseDate = d3.time.format("%d-%m-%Y").parse;

d3.json("/members/get_troops_stats?id="+member, function(error, data) {
  data.forEach(function(d) {
    d.values.forEach(function(v) {
      v.x = new Date(v.x).getTime();
      v.y = +v.y;
    })
  })  
  var chart_data = data;
  
  nv.addGraph(function() {  
    var chart = nv.models.lineChart();

    chart.xAxis
       .axisLabel('Date')
       .tickFormat(function(d) { return d3.time.format("%d %b")(new Date(d)) });

    chart.yAxis
       .axisLabel('Number of Troops')
       .tickFormat(d3.format('d'));
    
    d3.select('#chart svg')
      .datum(chart_data)
      .transition().duration(500)
      .call(chart);

    nv.utils.windowResize(function() { d3.select('#chart svg').call(chart) });

    return chart;
  });

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

