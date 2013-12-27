$(document).ready(function() {
  if ("geolocation" in navigator) {
    
    var options = {
      enableHighAccuracy: true,
      timeout: 10000
    };
    
    function success(pos) {
      var latitude = pos.coords.latitude;
      var longitude = pos.coords.longitude;
      
      $(".coords").append("Your coordinates are " + latitude + "," + longitude);
    };
    
    function error(err) {
      $(".coords").append("ERROR(" + err.code + '): ' + err.message);
    };
    
    navigator.geolocation.getCurrentPosition(success, error, options);
    
  } else {
    $(".coords").append("Sorry, your browser does not support this functionality!\n We recommend Google Chrome!");
  }
});
