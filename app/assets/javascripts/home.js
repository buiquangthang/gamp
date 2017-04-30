function defaultMap(obj_string) {
  var mapCanvas = document.getElementById(obj_string);
  var mapOptions = {
      center: new google.maps.LatLng(16.065439, 108.201907),
      zoom: 13
  };
  var map = new google.maps.Map(mapCanvas, mapOptions);
}
