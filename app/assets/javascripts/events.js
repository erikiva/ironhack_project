

function initMap() {
  var lati = -33.8688;
  var longi = 151.2195;
  if (($('#event_latitude').val() != '') && ($('#event_longitude').val() != '')){
      var lati = parseFloat($('#event_latitude').val());
      var longi = parseFloat($('#event_longitude').val());
      console.log(lati, longi)
  }
  var map = new google.maps.Map(document.getElementById('map'), {
    center: {lat: lati, lng: longi},
    zoom: 13
  });
  var input = /** @type {!HTMLInputElement} */(
      document.getElementById('event_location'));



  //map.controls[google.maps.ControlPosition.TOP_LEFT].push(input);
  //map.controls[google.maps.ControlPosition.TOP_LEFT].push(types);

  var autocomplete = new google.maps.places.Autocomplete(input);
  autocomplete.bindTo('bounds', map);

  var infowindow = new google.maps.InfoWindow();
  var marker = new google.maps.Marker({
    map: map,
    anchorPoint: new google.maps.Point(0, -29)
  });

  autocomplete.addListener('place_changed', function() {
    infowindow.close();
    marker.setVisible(false);
    var place = autocomplete.getPlace();
    if (!place.geometry) {
      window.alert("Autocomplete's returned place contains no geometry");
      return;
    }

    // If the place has a geometry, then present it on a map.
    if (place.geometry.viewport) {
      map.fitBounds(place.geometry.viewport);
    } else {
      map.setCenter(place.geometry.location);
      map.setZoom(17);  // Why 17? Because it looks good.
    }
    marker.setIcon(/** @type {google.maps.Icon} */({
      url: place.icon,
      size: new google.maps.Size(71, 71),
      origin: new google.maps.Point(0, 0),
      anchor: new google.maps.Point(17, 34),
      scaledSize: new google.maps.Size(35, 35)
    }));
    marker.setPosition(place.geometry.location);
    marker.setVisible(true);

    var address = '';
    if (place.address_components) {
      address = [
        (place.address_components[0] && place.address_components[0].short_name || ''),
        (place.address_components[1] && place.address_components[1].short_name || ''),
        (place.address_components[2] && place.address_components[2].short_name || '')
      ].join(' ');
    }

    infowindow.setContent('<div><strong>' + place.name + '</strong><br>' + address);
    console.log(document.getElementById('event_location').value);

    infowindow.open(map, marker);

    var geocoder = new google.maps.Geocoder();
    var address = document.getElementById('event_location').value;

    geocoder.geocode( { 'address': address}, function(results, status) {

    if (status == google.maps.GeocoderStatus.OK) {
        var latitude = results[0].geometry.location.lat();
        $('#event_latitude').val(latitude);
        var longitude = results[0].geometry.location.lng();
        $('#event_longitude').val(longitude);
        console.log(latitude, longitude);
        }
    });

  });


}

$(document).ready(function(){

  $('.event-form').find('input').keypress(function(e){
    if ( e.which == 13 ) // Enter key = keycode 13
    {
        $(this).next().focus();  //Use whatever selector necessary to focus the 'next' input
        return false;
    }
  });


  $(function () {
      $('#event-datetimepicker').datetimepicker();
  });





});

