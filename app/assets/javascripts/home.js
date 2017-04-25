function defaultMap() {
  var mapCanvas = document.getElementById("home-map");
  var mapOptions = {
      center: new google.maps.LatLng(16.065439, 108.201907),
      zoom: 13
  };
  var map = new google.maps.Map(mapCanvas, mapOptions);
}
