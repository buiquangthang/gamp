$(document).ready(function(){
  // Change the selector if needed
  var $table = $('table.scroll'),
      $bodyCells = $table.find('tbody tr:first').children(),
      colWidth;

  // Adjust the width of thead cells when window resizes
  $(window).resize(function() {
      // Get the tbody columns width array
      colWidth = $bodyCells.map(function() {
          return $(this).width();
      }).get();
      
      // Set the width of thead columns
      $table.find('thead tr').children().each(function(i, v) {
          $(v).width(colWidth[i]);
      });    
  }).resize(); // Trigger resize handler

  // Submit form
  $('#btn-delete-bus-stations-routes').on('click', function(){
    var table = $('#table-added-bus-station');
    var bus_stations = []
    table.find('input[type="checkbox"]:checked').each(function(){
      bus_stations.push(this.value);
    });
    var data_id = $('#bus-route-id').data("id");
    var path = "/bus_routes/" + data_id + "/destroy_bus_stations";
    $('#loader').css("display", "block");
    $.post(path, {list_bus_stations: bus_stations}, function(data) {
      window.location.reload();
    });
  });

  $('#btn-add-bus-stations-routes').on('click', function(){
    var table = $('#table-bus-station').dataTable();
    var bus_stations = []
    table.$('input[type="checkbox"]:checked').each(function(){
      bus_stations.push(this.value);
    });
    var data_id = $('#bus-route-id').data("id");
    var path = "/bus_routes/" + data_id + "/add_bus_stations";
    $('#loader').css("display", "block");
    $.post(path, {list_bus_stations: bus_stations}, function(data) {
      window.location.reload();
    });    
  });


  $('#save-added-bus-station').on('click', function(){
    var bus_stations = [];
    $('#table-added-bus-station .bus-station-checkbox').each(function (i) {
      bus_stations[i] = $(this).val();
    });

    var data_id = $('#bus-route-id').data("id");
    var path = "/bus_routes/" + data_id + "/update_bus_stations";
    $('#loader').css("display", "block");
    $.post(path, {list_bus_stations: bus_stations}, function(data) {
      window.location.reload();
    });
  })

  $('#move-up').on('click', function(){
    var rows_checked = $('.bus-station-checkbox:checked');
    for(i=0; i<rows_checked.length; i++){
      var row = $(rows_checked[i]).closest('tr');
      console.log(rows_checked[i])
      row.insertBefore(row.prev());
    }
  });

  $('#move-down').on('click', function(){
    var rows_checked = $('.bus-station-checkbox:checked');
    for(i=rows_checked.length - 1; i>=0; i--){
      var row = $(rows_checked[i]).closest('tr');
      console.log(rows_checked[i])
      row.insertAfter(row.next());
    }
  });

  $('#search-bus_station-txt').on('keyup',function(e) {
    var pathname = window.location.pathname;
    console.log(pathname);
    var term = $(this).val();
    var data = {term: term};
    $.get(pathname + '/search_bus_stop', data, null, 'script');
  });
})

jQuery(function() {
  $('#table-bus-station').dataTable({
    sPaginationType: "full_numbers",
    bJQueryUI: true,
    scrollY: "400px",
    scrollCollapse: true,
    paging: false
  });

  $('#table-added-bus-station').dataTable({
    sPaginationType: "full_numbers",
    bJQueryUI: true,
    scrollY: "400px",
    scrollCollapse: true,
    paging: false
  });

  $('#table-all-bus-station').dataTable({
    sPaginationType: "full_numbers",
    bJQueryUI: true
  });
});
