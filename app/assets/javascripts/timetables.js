$(document).ready(function(){
  var $TABLE = $('#table');
  var $BTN = $('#export-btn');
  var $EXPORT = $('#export');

  $('.table-add').click(function () {
    $('#time-tables tr').each(function(){
       $(this).append('<td contenteditable="true">12:00</td>');       
    })
    // $TABLE.find('table').append($clone);
  });

  $('.table-remove').click(function () {
    $(this).parents('tr').detach();
  });

  $('.table-up').click(function () {
    var $row = $(this).parents('tr');
    if ($row.index() === 1) return; // Don't go above the header
    $row.prev().before($row.get(0));
  });

  $('.table-down').click(function () {
    var $row = $(this).parents('tr');
    $row.next().after($row.get(0));
  });

  // A few jQuery helpers for exporting only
  jQuery.fn.pop = [].pop;
  jQuery.fn.shift = [].shift;

  $BTN.click(function () {
    var $rows = $TABLE.find('tr:not(:hidden)');
    var headers = [];
    var data = [];
    
    console.log($rows);
    // Get the headers (add special header logic here)
    $($rows).find('.bus-stop').each(function () {
      headers.push($(this).text().replace(/\n|\r/g, ""));
    });
    
    var myTableArray = [];
    $("table#time-tables tr").each(function() { 
        var arrayOfThisRow = [];
        var tableData = $(this).find('td');
        if (tableData.length > 0) {
            tableData.each(function() { arrayOfThisRow.push($(this).text().replace(/\n|\r/g, ""))});
            myTableArray.push(arrayOfThisRow);
        }
    });

    for(i=1; i < myTableArray[0].length; i++){
      var h = {};
      for(j=0; j < myTableArray.length; j++){
        if(myTableArray[j][i])
          h[headers[j]] = myTableArray[j][i];
      }
      data.push(h);
    }
    
    // Output the result
    $EXPORT.text(JSON.stringify(data));
  });
})
