function initialize() {

  if(document.getElementById("venue_map") == null || typeof(google) == 'undefined'){
    return
  }
  var map;

  var mapOptions = {
      zoom: 15,
      scrollwheel: false,
      center: new google.maps.LatLng(latitude, longitude),
      mapTypeId: 'roadmap',
      disableDefaultUI: true
  };

  // Display a map on the page
  map = new google.maps.Map(document.getElementById("venue_map"), mapOptions);

  var position = new google.maps.LatLng(latitude, longitude);
  marker = new google.maps.Marker({
      position: position,
      draggable: true,
      title: venue_title,
      map: map
  });
};

(function(d, script) {
    key = 'AIzaSyDP0yT1jc0W95Vj5z5Hcg3RMe_uodjI5Tk';
    script = d.createElement('script');
    script.type = 'text/javascript';
    script.async = true;
    script.onload = initialize;
    script.src = '//maps.googleapis.com/maps/api/js?callback=initialize&key='+key;
    d.getElementsByTagName('head')[0].appendChild(script);
}(document));

$(document).on('turbolinks:load', initialize);
