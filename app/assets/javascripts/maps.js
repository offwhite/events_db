function initialize() {

  if(document.getElementById("venue_map") == null){
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

//$(document).on('turbolinks:load', ready);
