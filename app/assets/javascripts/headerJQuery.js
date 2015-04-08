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
     $('#semiwrapper').css('visibility', 'hidden');
     $('#sttwrapper').css('visibility', 'hidden');
     $('#heavywrapper').css('visibility', 'hidden');
     $('#vanwrapper').css('visibility', 'hidden');
     $('#semiwrapper').children().prop('disabled', true);
     $('#heavywrapper').children().prop('disabled', true);
     $('#sttwrapper').children().prop('disabled', true);
     $('#vanwrapper').children().prop('disabled', true);
  if(window.location.href.indexOf("&make=")>-1){
    if(window.location.href.indexOf("&type=van")>-1){
      $('#vanwrapper').prop('disabled', false);
    }else{
      if(window.location.href.indexOf("&type=heavy")>-1){
      $('#heavywrapper').attr('disabled', false);
    }else{
      if(window.location.href.indexOf("&type=stt")>-1){
      $('#sttwrapper').attr('disabled', false);
      }else{
	if(window.location.href.indexOf("&type=semi")>-1){
      $('#semiwrapper').attr('disabled', false);
	}
	
      }
    }
    }
    $('#searchwrapper').css("visibility","visible");
    $('#header').css("height","300px");
    $('#body').css("margin-top","300px");
    $('#semibutton').css('visibility', 'visible');
     $('#sttbutton').css('visibility', 'visible');
     $('#heavybutton').css('visibility', 'visible');
     $('#vanbutton').css('visibility', 'visible');
  }else{
    $('#searchwrapper').css("visibility","hidden");
    $('#header').css("height","120px");
    $('#body').css("margin-top","120px");
  }
});
$('#searchbutton').click(function(e){
   
        if($('#header').outerHeight() == 121)
        {	
	  $('#semibutton').css('visibility', 'visible');
	  $('#sttbutton').css('visibility', 'visible');
	  $('#heavybutton').css('visibility', 'visible');
	  $('#vanbutton').css('visibility', 'visible');
	    $('#searchwrapper').css("visibility","visible");
	    
            $('#header').stop().animate({
                height:'300px'
            },400);
	    $('#searchwrapper').fadeIn();
	    $('#body').stop().animate({
                marginTop:'300px'
            },400);
        }
    else{
	    $('#semibutton').css('visibility', 'hidden');
     $('#sttbutton').css('visibility', 'hidden');
     $('#heavybutton').css('visibility', 'hidden');
     $('#vanbutton').css('visibility', 'hidden');
            $('#header').stop().animate({
                height:'120px'
            },400);
	    $('#searchwrapper').fadeOut();
	    $('#body').stop().animate({
                marginTop:'120px'
            },400);
          
    }
})
 $('#vanbutton').click(function(e){
    $('#vanwrapper').css("visibility","visible");
    $('#vanwrapper').children().prop('disabled',false);
    $('#heavywrapper').children().prop('disabled', true);
    $('#sttwrapper').children().prop('disabled', true);
    $('#semiwrapper').children().prop('disabled', true);
    $('#sttwrapper').css("visibility","hidden");
    $('#semiwrapper').css("visibility","hidden");
    $('#heavywrapper').css("visibility","hidden");
    
  
});  
  $('#heavybutton').click(function(e){
    $('#heavywrapper').css("visibility","visible");
    $('#heavywrapper').children().prop('disabled', false);
    $('#vanwrapper').children().prop('disabled', true);
    $('#sttwrapper').children().prop('disabled', true);
    $('#semiwrapper').children().prop('disabled', true);
    $('#semiwrapper').css("visibility","hidden");
    $('#vanwrapper').css("visibility","hidden");
    $('#sttwrapper').css("visibility","hidden");
    
  
}); 
 $('#semibutton').click(function(e){
    $('#semiwrapper').css("visibility","visible");
    $('#semiwrapper').children().prop('disabled', false);
    $('#heavywrapper').children().prop('disabled', true);
    $('#sttwrapper').children().prop('disabled', true);
    $('#vanwrapper').children().prop('disabled', true);
    $('#sttwrapper').css("visibility","hidden");
    $('#vanwrapper').css("visibility","hidden");
    $('#heavywrapper').css("visibility","hidden");
    
  
}); 
  $('#sttbutton').click(function(e){
    $('#sttwrapper').css("visibility","visible");
    $('#sttwrapper').children().prop('disabled', false);
    $('#heavywrapper').children().prop('disabled', true);
    $('#vanwrapper').children().prop('disabled', true);
    $('#semiwrapper').children().prop('disabled', true);
    $('#semiwrapper').css("visibility","hidden");
    $('#heavywrapper').css("visibility","hidden");
    $('#vanwrapper').css("visibility","hidden");
    
  
}); 






});

