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
      $('#allbutton').css("border","2px solid");
      $('#vanbutton').css("border","4px solid");
      $('#vanwrapper').children().prop('disabled', false);
      $('#vanwrapper').css('visibility', 'visible');
    }else{
	  if(window.location.href.indexOf("&type=heavy")>-1){
	    $('#allbutton').css("border","2px solid");
	    $('#heavybutton').css("border","4px solid");
	    $('#heavywrapper').css('visibility', 'visible');
	    $('#heavywrapper').children().prop('disabled', false);
	     }else{
	      if(window.location.href.indexOf("&type=stt")>-1){
		$('#allbutton').css("border","2px solid");
		$('#sttbutton').css("border","4px solid");
		$('#sttwrapper').css('visibility', 'visible');
		$('#sttwrapper').children().prop('disabled', false);
		 }else{
		  if(window.location.href.indexOf("&type=semi")>-1){
		    $('#allbutton').css("border","2px solid");
		    $('#semibutton').css("border","4px solid");
		    $('#semiwrapper').css('visibility', 'visible');
		    $('#semiwrapper').children().prop('disabled', false);
		    }
	
		  }
	      }
	 }
    $('#searchwrapper').css("visibility","visible");
    $('#header').css("height","300px");
    $('#body').css("margin-top","300px");
    $('#semibutton').css('visibility', 'visible');
    $('#semibutton').fadeIn();
    $('#sttbutton').css('visibility', 'visible');
    $('#sttbutton').fadeIn();
    $('#heavybutton').css('visibility', 'visible');
    $('#heavybutton').fadeIn();
    $('#vanbutton').css('visibility', 'visible');
    $('#vanbutton').fadeIn();
    $('#allbutton').css('visibility', 'visible');
    $('#allbutton').fadeIn();
  }else{
    $('#searchwrapper').css("visibility","hidden");
    $('#header').css("height","120px");
    $('#body').css("margin-top","120px");
  }
});
$('#searchbutton').click(function(e){
   
        if($('#header').outerHeight() == 122)
        {	
	  $('#semibutton').css('visibility', 'visible');
	  $('#semibutton').fadeIn();
	  $('#sttbutton').css('visibility', 'visible');
	  $('#sttbutton').fadeIn();
	  $('#heavybutton').css('visibility', 'visible');
	  $('#heavybutton').fadeIn();
	  $('#vanbutton').css('visibility', 'visible');
	  $('#vanbutton').fadeIn();
	  $('#allbutton').css('visibility', 'visible');
	  $('#allbutton').fadeIn();
	  
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
	  $('#semibutton').fadeOut();
	  $('#sttbutton').fadeOut();
	  $('#heavybutton').fadeOut();
	  $('#vanbutton').fadeOut();
	  $('#allbutton').fadeOut();
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
    $('#sttbutton').css("border","2px solid");
    $('#heavybutton').css("border","2px solid");
    $('#semibutton').css("border","2px solid");
    $('#allbutton').css("border","2px solid");
    $('#vanbutton').css("border","4px solid");
    
  
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
    $('#sttbutton').css("border","2px solid");
    $('#heavybutton').css("border","4px solid");
    $('#semibutton').css("border","2px solid");
    $('#allbutton').css("border","2px solid");
    $('#vanbutton').css("border","2px solid");
  
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
    $('#sttbutton').css("border","2px solid");
    $('#heavybutton').css("border","2px solid");
    $('#semibutton').css("border","4px solid");
    $('#allbutton').css("border","2px solid");
    $('#vanbutton').css("border","2px solid");
  
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
    $('#sttbutton').css("border","4px solid");
    $('#heavybutton').css("border","2px solid");
    $('#semibutton').css("border","2px solid");
    $('#allbutton').css("border","2px solid");
    $('#vanbutton').css("border","2px solid");
  
}); 
  $('#allbutton').click(function(e){
    $('#sttwrapper').children().prop('disabled', true);
    $('#heavywrapper').children().prop('disabled', true);
    $('#vanwrapper').children().prop('disabled', true);
    $('#semiwrapper').children().prop('disabled', true);
    $('#sttwrapper').css("visibility","hidden");
    $('#semiwrapper').css("visibility","hidden");
    $('#heavywrapper').css("visibility","hidden");
    $('#vanwrapper').css("visibility","hidden");
    $('#sttbutton').css("border","2px solid");
    $('#heavybutton').css("border","2px solid");
    $('#semibutton').css("border","2px solid");
    $('#allbutton').css("border","4px solid");
    $('#vanbutton').css("border","2px solid");
  
}); 
});

