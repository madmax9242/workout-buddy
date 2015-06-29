// Using e1 for exercise #1. Trying to dry up code
var results;

function drawChart(e1, e2, e3, e4, e5, e6, results) {

  var data = new google.visualization.DataTable();
  data.addColumn('number', 'Day');
  data.addColumn('number', e1);
  data.addColumn('number', e2);
  data.addColumn('number', e3);
  data.addColumn('number', e4);
  data.addColumn('number', e5);
  data.addColumn('number', e6);

  data.addRows(results);

  var options = {
    chart: {
      title: 'Workout Progression',
    },
    width: 900,
    height: 500
  };

  var chart = new google.charts.Line(document.getElementById('linechart_material'));

  chart.draw(data, options);
}

function getDataPoints () {
  
  $.ajax( {
    url: "./show",
    type: "get",
    dataType: "json",

    success: function(data)  {
      var results = [];
      var type = "back";     
      for (var i = 0; i < data.length; i++) {
        var array = $.map(data[i], function(value, index) {
          return [value];
        });
        array.splice(-1,1);
        results.push(array);
        console.log(results);
        // return results;
      }

      if (type == "back") {
        drawChart("Seated Row", "Lat Pulldown", "Renegade Row", "Seated Good Mornings", "Deadlift", "Deltoid Fly", results);
      
      } else if (type == "chest")  {
        drawChart();
      
      } else if (type == "legs")  {
        drawChart();
      }
          

    },
    failure: function() {
      console.log("No dice");
    }
  });
}