$(document).on('click', '.input-remove-row', function(){ 
  var tr = $(this).closest('tr');
  tr.fadeOut(200, function(){
    tr.remove();
     calc_total()
});
});

$(function(){
  $('.preview-add-button').click(function(){
      var form_data = {};
      form_data["status"] = $('.payment-form #status option:selected').text();
      form_data["amount"] = parseFloat($('.payment-form input[name="amount"]').val()).toFixed(2);
      form_data["remove-row"] = '<span class="glyphicon glyphicon-remove"></span>';
      var row = $('<tr></tr>');
      $.each(form_data, function( type, value ) {
          $('<td class="input-'+type+'"></td>').html(value).appendTo(row);
          
      });
      $('<input name="a[]" value="'+form_data["status"]+'" type="hidden"></input>').html(form_data["status"]).appendTo(row);

      $('.preview-table > tbody:last').append(row); 
  });
});
