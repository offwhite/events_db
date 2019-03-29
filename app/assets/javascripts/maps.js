function initialize() {

  if(document.getElementById("venue_map") == null || typeof(google) == 'undefined'){
    return
  }
  var map;

  var light = '#b7fb36'
  var grey = '#212a37'
  var secondary = '#ae74e8'

  var mapOptions = {
      zoom: 15,
      scrollwheel: false,
      center: new google.maps.LatLng(latitude, longitude),
      mapTypeId: 'roadmap',
      disableDefaultUI: true,
      styles: [
            {elementType: 'geometry', stylers: [{color: '#242f3e'}]},
            {elementType: 'labels.text.stroke', stylers: [{color: '#242f3e'}]},
            {elementType: 'labels.text.fill', stylers: [{color: '#746855'}]},
            {
              featureType: 'administrative.locality',
              elementType: 'labels.text.fill',
              stylers: [{color: light}]
            },
            {
              featureType: 'poi',
              elementType: 'labels.text.fill',
              stylers: [{color: secondary}]
            },
            {
              featureType: 'poi.park',
              elementType: 'geometry',
              stylers: [{color: '#263c3f'}]
            },
            {
              featureType: 'poi.park',
              elementType: 'labels.text.fill',
              stylers: [{color: secondary}]
            },
            {
              featureType: 'road',
              elementType: 'geometry',
              stylers: [{color: '#38414e'}]
            },
            {
              featureType: 'road',
              elementType: 'geometry.stroke',
              stylers: [{color: '#212a37'}]
            },
            {
              featureType: 'road',
              elementType: 'labels.text.fill',
              stylers: [{color: '#9ca5b3'}]
            },
            {
              featureType: 'road.highway',
              elementType: 'geometry',
              stylers: [{color: '#746855'}]
            },
            {
              featureType: 'road.highway',
              elementType: 'geometry.stroke',
              stylers: [{color: grey}]
            },
            {
              featureType: 'road.highway',
              elementType: 'labels.text.fill',
              stylers: [{color: light}]
            },
            {
              featureType: 'transit',
              elementType: 'geometry',
              stylers: [{color: '#2f3948'}]
            },
            {
              featureType: 'transit.station',
              elementType: 'labels.text.fill',
              stylers: [{color: light}]
            },
            {
              featureType: 'water',
              elementType: 'geometry',
              stylers: [{color: '#17263c'}]
            },
            {
              featureType: 'water',
              elementType: 'labels.text.fill',
              stylers: [{color: '#515c6d'}]
            },
            {
              featureType: 'water',
              elementType: 'labels.text.stroke',
              stylers: [{color: '#17263c'}]
            },{
              featureType: 'poi.business',
              stylers: [{visibility: 'off'}]
            },
            {
              featureType: 'transit',
              elementType: 'labels.icon',
              stylers: [{visibility: 'off'}]
            }
          ]
  };

  // Display a map on the page
  map = new google.maps.Map(document.getElementById("venue_map"), mapOptions);

  var position = new google.maps.LatLng(latitude, longitude);
  var image = '/map-marker.png';
  marker = new google.maps.Marker({
      position: position,
      draggable: false,
      title: venue_title,
      map: map,
      icon: image
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
