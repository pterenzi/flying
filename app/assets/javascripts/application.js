// This is a manifest file that'll be compiled into including all the files listed below.
// Add new JavaScript/Coffee code in separate files in this directory and they'll automatically
// be included in the compiled file accessible from http://example.com/assets/application.js
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
//= require jquery
//= require jquery_ujs
//= require_tree .

function print(titulo,element){
  $("#dialog").empty();
  $("#print-title").html(titulo);
  $("#dialog").append($("#"+element).html());
  $("#dialog .index_link").remove();
  $("#dialog").dialog({
  buttons: { 
    "Print": function() { $('#dialog').printElement(); },
    "Close": function() { $(this).dialog("close"); }
  },
  title: $("#title h1").html(),
  height: 500,
  width: 800
});
  
    }
     



