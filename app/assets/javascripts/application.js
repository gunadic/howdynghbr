// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require jquery
//= require jquery_ujs
//= require foundation
//= require pickadate/picker 
//= require pickadate/picker.date 
//= require pickadate/picker.time 
//= require_tree .

$(function(){ 
  // $(".meetup_location").hide();
  $(document).foundation(); 
  $("#meetup_category_id").chosen();
  $("#meetup_neighborhood_id").chosen().change(function(e) {
    var id = $(e.target).val();
    $.ajax({
      url: '/locations',
      data: {id: id},
      type: "GET",
      dataType: "json",
      context: this,
      success: function(data) {
        console.log(data);
        addAll(data);
      },
      error: function(){
        alert("Something went wrong. Please try again in a moment.");
      }
    });
  });
  function addAll(data){
    var options = $("#meetup_location_id");
    _.each(data, function(d){ 
      options.append($("<option />").val(d.id).text(d.name));
    });
    options.chosen();
  // $(".meetup_location").show();
  }
  $("#meetup_meetup_time").pickatime({
    formatSubmit: 'HH:i'
  });
  $("#meetup_meetup_date").pickadate();
  // $("#meetup_location_id").chosen();


});
