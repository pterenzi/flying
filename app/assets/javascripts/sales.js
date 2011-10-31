// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
function search(){
  window.location = '/sales?start_date=' + $("#start_date").val() + 
  '&end_date=' + $("#end_date").val() + "&client_id=" + 
  $("#client_id").val();
}

 function calculate_total_sale(){
   var hours = $("#sale_hours").val().replace(",", ".");
   if (_.isEmpty(hours)){
     $("#total_value").empty();
   }else{
     total = parseFloat($("#sale_value").val()) * parseFloat(hours);
     $("#total_value").html(total);
   }
 }
