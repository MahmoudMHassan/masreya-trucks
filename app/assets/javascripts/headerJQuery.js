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
    $('#header').css("height","250px");
  }else{
    $('#header').data('size','big');
    $('#searchwrapper').hide();
  }
});

$('#searchbutton').click(function(){
   
        if($('#header').data('size') == 'big')
        {
            $('#header').data('size','small');
            $('#header').stop().animate({
                height:'250px'
            },600);
	    $('#searchwrapper').fadeIn();

        }
    else{
        if($('#header').data('size') == 'small')
        {
            $('#header').data('size','big');
            $('#header').stop().animate({
                height:'150px'
            },600);
	    $('#searchwrapper').fadeOut();

        }  
    }
});
 
