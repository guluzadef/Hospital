$("#job_department").on("change", function(){

  var selected = $(this).val();

  if(selected.length > 0) {
    $('.content').hide();
    $('.content[data-response="op' + selected + '"]').show();
  }else {
    $('.content').show();
  }

})