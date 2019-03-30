function initialize() {

  if(document.getElementById("venue_map") == null || typeof(google) == 'undefined'){
    return
  }
  var map;

  var light = '#b7fb36'
  var grey = '#212a37'
  var secondary = '#ae74e8'

  var bounds = new google.maps.LatLngBounds();

  var mapOptions = {
      zoom: 15,
      scrollwheel: true,
      center: new google.maps.LatLng(map_locations[0][0], map_locations[0][1]),
      mapTypeId: 'roadmap',
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
          ],
      disableDefaultUI: true,
      zoomControl: false
  };

  // Display a map on the page
  var map = new google.maps.Map(document.getElementById("venue_map"), mapOptions);

  var image = '/map-marker.png';

  var infoWindow = new google.maps.InfoWindow(), marker, i;

  for (i = 0; i < map_locations.length; i++) {
    var position = new google.maps.LatLng(map_locations[i][0], map_locations[i][1]);
    marker = new google.maps.Marker({
        position: position,
        draggable: false,
        animation: google.maps.Animation.DROP,
        title: map_locations[i][2],
        map: map,
        icon: image
    });

    // extend bounds to fit markers
    bounds.extend(marker.position);

    if(map_locations[i].length > 3){
      google.maps.event.addListener(marker, 'click', (function(marker, i) {
        return function() {
          infoWindow.setContent("<h3><a href='"+map_locations[i][3]+"'>"+map_locations[i][2]+"</a></h3>");
          infoWindow.open(map, marker);
        }
      })(marker, i));
    }
  }

  //now fit the map to the newly inclusive bounds
  if(map_locations.length > 1){
    map.fitBounds(bounds);
  }
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
