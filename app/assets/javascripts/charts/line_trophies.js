var member = $('#member_name').text();
var parseDate = d3.time.format("%d-%m-%Y").parse;

d3.json("/members/get_trophies_stats?id="+member, function(error, data) {
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
    
    d3.select('#line_trophies svg')
      .datum(chart_data)
      .transition().duration(500)
      .call(chart);

    nv.utils.windowResize(function() { d3.select('#line_trophies svg').call(chart) });

    return chart;
  });

});

