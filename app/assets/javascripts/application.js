// This is a manifest file that'll be compiled into including all the files listed below.
// Add new JavaScript/Coffee code in separate files in this directory and they'll automatically
// be included in the compiled file accessible from http://example.com/assets/application.js
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
//= require jquery-1.6.min
//= require jquery_ujs
//= require_tree .

function print(){
  $("#dialog").append($("#main").html());
  $("#dialog").dialog({
  buttons: { 
    "Print": function() { $('#main').printElement(); },
    "Close": function() { $(this).dialog("close"); }
  }
});
  
    }
     



