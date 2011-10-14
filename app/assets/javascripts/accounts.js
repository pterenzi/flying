// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

function search(action_name){
  if (action_name=='cash_flow'){
    window.location = '/accounts/cash_flow/?start_date=' + $("#start_date").val() + 
    '&end_date=' + $("#end_date").val() + "&client_id=" + 
    $("#client_id").val() + "&supplier_id=" + $("#supplier_id").val();
  }else {
    window.location = '/accounts?start_date=' + $("#start_date").val() + 
    '&end_date=' + $("#end_date").val() + "&supplier_id=" + $("#supplier_id").val();
  }
}

