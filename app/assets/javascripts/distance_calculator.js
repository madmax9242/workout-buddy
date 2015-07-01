$(document).ready(function() {
  var startPos;
  navigator.geolocation.getCurrentPosition(function(position) {
    startPos = position;
    var lat = startPos.coords.latitude;
    var lon = startPos.coords.longitude;
    document.getElementById('startLat').innerHTML = startPos.coords.latitude;
    document.getElementById('startLon').innerHTML = startPos.coords.longitude;
    getWeather(lat, lon);

  }, function(error) {
  	alert('Error occurred');
  
  });

  navigator.geolocation.watchPosition(function(position) {
  	document.getElementById('currentLat').innerHTML = position.coords.latitude;
  	document.getElementById('currentLon').innerHTML = position.coords.longitude;
  	document.getElementById('distance').innerHTML =
      calculateDistance(startPos.coords.latitude, startPos.coords.longitude,
                        position.coords.latitude, position.coords.longitude);
  });
});

function calculateDistance(lat1, lon1, lat2, lon2) {
  var R = 6371; // km
  var dLat = (lat2 - lat1).toRad();
  var dLon = (lon2 - lon1).toRad(); 
  var a = Math.sin(dLat / 2) * Math.sin(dLat / 2) +
          Math.cos(lat1.toRad()) * Math.cos(lat2.toRad()) * 
          Math.sin(dLon / 2) * Math.sin(dLon / 2); 
  var c = 2 * Math.atan2(Math.sqrt(a), Math.sqrt(1 - a)); 
  var d = R * c;
  d = d * .62137
  return d;
}
Number.prototype.toRad = function() {
  return this * Math.PI / 180;
}

function getWeather(lat, lon)  {

  $.ajax({
    url: "http://api.openweathermap.org/data/2.5/weather?lat=" + lat + "&lon=" + lon,
    type: "get",
    dataType: 'json',

    success: function(data) {
      console.log(data);
      var temp = data["main"]["temp"];
      temp = ((temp - 273.15)*1.8000 + 32);
      $('#temperature').text(temp);
      var forecast = data['weather'][0]['description'];
      $('#forecast').text(forecast);
    },

    error: function(jqXHR, textStatus, errorThrown) {
      alert('Nope');
    }
  })
}


