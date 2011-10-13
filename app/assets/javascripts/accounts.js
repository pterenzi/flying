// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

function search(){
  window.location = '/accounts?start_date=' + $("#start_date").val() + 
  '&end_date=' + $("#end_date").val() + "&client_id=" + 
  $("#client_id").val() + "&supplier_id=" + $("#supplier_id").val();
}

