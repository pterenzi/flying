// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

function search(){
  window.location = '/flights?start_date=' + $("#start_date").val() + 
      '&end_date=' + $("#end_date").val() + "&instructor_id=" + 
      $("#instructor_id").val() + "&client_id=" + $("#client_id").val() +
      "&aircraft_id=" + $("#aircraft_id").val();
}

function change_aircraft(){
  $.ajax({
    url: "/aircrafts/" + $("#flight_aircraft_id").val() + "/retrieve_aircraft_type_name",
    type: "GET",
    success: function(aircraft_type_name) {
      $("#aircraft_type_name").html(aircraft_type_name)
    },
    error: $("#aircraft_type_name").html("&nbsp;")
  });
}

function change_client_dac(){
  $.ajax({
    url: "/clients/" + $("#flight_client_id").val() + "/retrieve_client_dac",
    type: "GET",
    success: function(client_dac) {
      $("#client_dac").html(client_dac)
    },
    error: $("#client_dac").html("&nbsp;")
  });
}

function load_form(f){
  $.ajax({
    url: "/flights/" + $("#flight_aircraft_id").val() + "/load_aircraft_type_form",
    type: "GET",
    data: {f: f},
    success: function(form) {
      $("#partial").empty();
      $("#partial").html(form);
    },
    error: $("#partial").html("&nbsp;")
  });
}