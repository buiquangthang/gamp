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
  $('#btn-delete-places-routes').on('click', function(){
    $('#form-delete-places-routes').submit()
  });

  $('#btn-add-places-routes').on('click', function(){
    $('#form-add-places-routes').submit()
  });

  $('#move-up').on('click', function(){
    var rows_checked = $('.place-checkbox:checked');
    for(i=0; i<rows_checked.length; i++){
      var row = $(rows_checked[i]).closest('tr');
      console.log(rows_checked[i])
      row.insertBefore(row.prev());
    }
  });

  $('#move-down').on('click', function(){
    var rows_checked = $('.place-checkbox:checked');
    for(i=rows_checked.length - 1; i>=0; i--){
      var row = $(rows_checked[i]).closest('tr');
      console.log(rows_checked[i])
      row.insertAfter(row.next());
    }
  });

  $('#search-place-txt').on('keyup',function(e) {
    var pathname = window.location.pathname;
    console.log(pathname);
    var term = $(this).val();
    var data = {term: term};
    $.get(pathname + '/search_bus_stop', data, null, 'script');
  });
})
