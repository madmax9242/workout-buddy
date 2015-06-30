// Using e1 for exercise #1. Trying to dry up code
var results;
var type;

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
    width: 600,
    height: 500
  };

  var chart = new google.charts.Line(document.getElementById('linechart_material'));

  chart.draw(data, options);
}

function getDataPoints () {
  


    if (window.location.pathname == "/back_results" || window.location.pathname == "/back_results/show") {
      type = "back_results";
    } else if (window.location.pathname == "/chest_results")  {
      type = "chest_results"
        
    } else if (window.location.pathname == "/legs_results")  {
      type = "legs_results";
    }
    
    $.ajax( {
      url: "/" + type,
      type: "get",
      dataType: "json",

      success: function(data)  {
        var results = []; 
        var counter = 1;   
        for (var i = 0; i < data.length; i++) {
          var array = $.map(data[i], function(value, index) {
            return [value];
          });

          var userTest = parseInt($('#userId').val());
          console.log(userTest);
          if (array[(array.length - 1)] == userTest)  {
            array.splice(-1,1);
            array[0] = (counter);
            results.push(array);
            counter++;
          }

        }

        if (type == "back_results") {
          google.setOnLoadCallback(drawChart("Seated Row", "Lat Pulldown", "Renegade Row", "Seated Good Mornings", "Deadlift", "Deltoid Fly", results));
        } else if (type == "chest_results")  {
          google.setOnLoadCallback(drawChart("Flat Bench Press", "Incline Dumbbell Press", "Cable Fly", "Decline Bench Press", "Incline Fly", "Stabilization Pushup", results));
        
        } else if (type == "legs_results")  {
          google.setOnLoadCallback(drawChart("Back Squat", "Calf Raises", "Leg Press", "Leg Curl", "Leg Extension", "Lunges", results));
        }
            

      },
      failure: function() {
        console.log("No dice");
      }
    
    });

}