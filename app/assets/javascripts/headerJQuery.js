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

$(function(){
  if(window.location.href.indexOf("&make=")>-1){
    $('#searchwrapper').css("visibility","visible");
    $('#header').css("height","270px");
    $('#body').css("margin-top","270px");
  }else{
    $('#searchwrapper').css("visibility","hidden");
  }
});

$('#searchbutton').click(function(){
   
        if($('#header').height() == 120)
        {	
	    $('#searchwrapper').css("visibility","visible");
            $('#header').stop().animate({
                height:'270px'
            },400);
	    $('#searchwrapper').fadeIn();
	    $('#body').stop().animate({
                marginTop:'270px'
            },400);
        }
    else{
            $('#header').stop().animate({
                height:'120px'
            },400);
	    $('#searchwrapper').fadeOut();
	    $('#body').stop().animate({
                marginTop:'120px'
            },400);
          
    }
});
 
