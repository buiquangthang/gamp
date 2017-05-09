function defaultMap(obj_string) {
  var mapCanvas = document.getElementById(obj_string);
  var mapOptions = {
      center: new google.maps.LatLng(16.065439, 108.201907),
      zoom: 13
  };
  var map = new google.maps.Map(mapCanvas, mapOptions);
}

function initialise(){
  var mapOptions={};
  mapOptions.zoom=13;
  mapOptions.center=new google.maps.LatLng(16.065439, 108.201907);
  mapOptions.mapTypeId=google.maps.MapTypeId.ROADMAP;
  
  var map=new google.maps.Map(document.getElementById('home-map'), mapOptions);
  
  var directionsRendererOptions={};
  directionsRendererOptions.draggable=false;
  directionsRendererOptions.hideRouteList=true;
  directionsRendererOptions.suppressMarkers=false;
  directionsRendererOptions.preserveViewport=false;
  var directionsRenderer=new google.maps.DirectionsRenderer(directionsRendererOptions);
  var directionsService=new google.maps.DirectionsService();
  
  var contextMenuOptions={};
  contextMenuOptions.classNames={menu:'context_menu', menuSeparator:'context_menu_separator'};
  
  //  create an array of ContextMenuItem objects
  //  an 'id' is defined for each of the four directions related items
  var menuItems=[];
  menuItems.push({className:'context_menu_item', eventName:'directions_origin_click', id:'directionsOriginItem', label:'Directions from here'});
  menuItems.push({className:'context_menu_item', eventName:'directions_destination_click', id:'directionsDestinationItem', label:'Directions to here'});
  menuItems.push({className:'context_menu_item', eventName:'clear_directions_click', id:'clearDirectionsItem', label:'Clear directions'});
  menuItems.push({className:'context_menu_item', eventName:'get_directions_click', id:'getDirectionsItem', label:'Get directions'});
  //  a menuItem with no properties will be rendered as a separator
  menuItems.push({});
  menuItems.push({className:'context_menu_item', eventName:'zoom_in_click', label:'Zoom in'});
  menuItems.push({className:'context_menu_item', eventName:'zoom_out_click', label:'Zoom out'});
  menuItems.push({});
  menuItems.push({className:'context_menu_item', eventName:'center_map_click', label:'Center map here'});
  contextMenuOptions.menuItems=menuItems;
  
  var contextMenu=new ContextMenu(map, contextMenuOptions);
  
  google.maps.event.addListener(map, 'rightclick', function(mouseEvent){
    contextMenu.show(mouseEvent.latLng);
  });
  
  //  create markers to show directions origin and destination
  //  both are not visible by default
  var markerOptions={};
  markerOptions.icon='http://www.google.com/intl/en_ALL/mapfiles/markerA.png';
  markerOptions.map=null;
  markerOptions.position=new google.maps.LatLng(0, 0);
  markerOptions.title='Directions origin';
  
  var originMarker=new google.maps.Marker(markerOptions);
  
  markerOptions.icon='http://www.google.com/intl/en_ALL/mapfiles/markerB.png';
  markerOptions.title='Directions destination';
  var destinationMarker=new google.maps.Marker(markerOptions);
  
  //  listen for the ContextMenu 'menu_item_selected' event
  google.maps.event.addListener(contextMenu, 'menu_item_selected', function(latLng, eventName){
    switch(eventName){
      case 'directions_origin_click':
        originMarker.setPosition(latLng);
        if(!originMarker.getMap()){
          originMarker.setMap(map);
        }
        $('#start-point-txt').val(originMarker.getPosition().lat() + ', ' + originMarker.getPosition().lng());
        break;
      case 'directions_destination_click':
        destinationMarker.setPosition(latLng);
        if(!destinationMarker.getMap()){
          destinationMarker.setMap(map);
        }
        $('#end-point-txt').val(destinationMarker.getPosition().lat() + ', ' + destinationMarker.getPosition().lng());
        break;
      case 'clear_directions_click':
        directionsRenderer.setMap(null);
        //  set CSS styles to defaults
        document.getElementById('clearDirectionsItem').style.display='';
        document.getElementById('directionsDestinationItem').style.display='';
        document.getElementById('directionsOriginItem').style.display='';
        document.getElementById('getDirectionsItem').style.display='';
        break;
      case 'get_directions_click':
        var directionsRequest={};
        directionsRequest.destination = destinationMarker.getPosition();
        directionsRequest.origin = originMarker.getPosition();
        directionsRequest.travelMode = google.maps.TravelMode.DRIVING;
        
        directionsService.route(directionsRequest, function(result, status){
          if(status===google.maps.DirectionsStatus.OK){
            //  hide the origin and destination markers as the DirectionsRenderer will render Markers itself
            originMarker.setMap(null);
            destinationMarker.setMap(null);
            directionsRenderer.setDirections(result);
            directionsRenderer.setMap(map);
            //  hide all but the 'Clear directions' menu item
            document.getElementById('clearDirectionsItem').style.display='block';
            document.getElementById('directionsDestinationItem').style.display='none';
            document.getElementById('directionsOriginItem').style.display='none';
            document.getElementById('getDirectionsItem').style.display='none';
          } else {
            alert('Sorry, the map was unable to obtain directions.\n\nThe request failed with the message: '+status);
          }
        });
        break;
      case 'zoom_in_click':
        map.setZoom(map.getZoom()+1);
        break;
      case 'zoom_out_click':
        map.setZoom(map.getZoom()-1);
        break;
      case 'center_map_click':
        map.panTo(latLng);
        break;
    }
    if(originMarker.getMap() && destinationMarker.getMap() && document.getElementById('getDirectionsItem').style.display===''){
      //  display the 'Get directions' menu item if it is not visible and both directions origin and destination have been selected
      document.getElementById('getDirectionsItem').style.display='block';
    }
  });
}

$(document).ready(function(){
  $('#search-bus-btn').on('click', function(){
    var pathname = window.location.pathname;
    console.log(pathname);
    var startPoint = $('#start-point-txt').val();
    var endPoint = $('#end-point-txt').val();
    var data = {start_point: startPoint, end_point: endPoint};
    $.get(pathname + 'search/index', data, null, 'script');
  });
});
