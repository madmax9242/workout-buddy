// Using e1 for exercise #1. Trying to dry up code
var results;
var type;

function drawChart(e1, e2, e3, e4, e5, e6, results) {

  // Columns require datatype and name
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
  
    // Checks the URL of the show page to determine which list of exercises to put on the columns

    if (window.location.pathname == "/back_results" || window.location.pathname == "/back_results/show") {
      type = "back_results";
    } else if (window.location.pathname == "/chest_results")  {
      type = "chest_results"
        
    } else if (window.location.pathname == "/legs_results")  {
      type = "legs_results";
    }
    // Use type variable from initial check to see which database column to pull from
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
          // Makes sure that only the data that was logged by the current user shows up on their graph
          if (array[(array.length - 1)] == userTest)  {
            // Then removes the user_id data since it isn't in the graph
            array.splice(-1,1);
            // Had to make a counter variable for the days/workouts logged. It increments for ever record pulled instead of relying on the entry ID which could be scattered
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