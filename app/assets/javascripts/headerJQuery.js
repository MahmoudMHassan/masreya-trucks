// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
$(document).ready(function() {
$(function(){
  if(window.location.href.indexOf("&make=")>-1){
    $('#searchwrapper').css("visibility","visible");
    $('#trialbutton').css("visibility","visible");
    $('#trialbutton1').css("visibility","visible");
    $('#trialbutton2').css("visibility","visible");
    $('#trialbutton3').css("visibility","visible");
    $('#trialbutton4').css("visibility","visible");

    $('#header').css("height","270px");
    $('#body').css("margin-top","270px");
  }else{
    $('#searchwrapper').css("visibility","hidden");
    $('#trialbutton').css("visibility","hidden");
    $('#trialbutton1').css("visibility","hidden");
    $('#trialbutton2').css("visibility","hidden");
    $('#trialbutton3').css("visibility","hidden");
    $('#trialbutton4').css("visibility","hidden");
    $('#header').css("height","120px");
    $('#body').css("margin-top","120px");
  }
});
$('#searchbutton').click(function(e){

        if($('#header').outerHeight() == 121)
        {
	    $('#searchwrapper').css("visibility","visible");
	     $('#trialbutton').css("visibility","visible");
	     $('#trialbutton1').css("visibility","visible");
	     $('#trialbutton2').css("visibility","visible");
	     $('#trialbutton3').css("visibility","visible");
	     $('#trialbutton4').css("visibility","visible");
	     $('#header').stop().animate({
                height:'270px'
            },400);
	    $('#searchwrapper').fadeIn();
	    $('#trialbutton').fadeIn();
	    $('#trialbutton1').fadeIn();
	    $('#trialbutton2').fadeIn();
	    $('#trialbutton3').fadeIn();
	    $('#trialbutton4').fadeIn();
	    $('#body').stop().animate({
                marginTop:'270px'
            },400);
        }
    else{
            $('#header').stop().animate({
                height:'120px'
            },400);
	    $('#searchwrapper').fadeOut();
	    $('#trialbutton').fadeOut();
	    $('#trialbutton1').fadeOut();
	    $('#trialbutton2').fadeOut();
	    $('#trialbutton3').fadeOut();
	    $('#trialbutton4').fadeOut();
	    $('#body').stop().animate({
                marginTop:'120px'
            },400);

    }e.preventDefault();
})});

