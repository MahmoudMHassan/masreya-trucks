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
  var $header = $('#header');
  var $semiwrapper = $('#semiwrapper');
  var $sttwrapper = $('#sttwrapper');
  var $heavywrapper = $('#heavywrapper');
  var $vanwrapper = $('#vanwrapper');
  var $allbutton = $('#allbutton');
  var $sttbutton = $('#sttbutton');
  var $semibutton = $('#semibutton');
  var $heavybutton = $('#heavybutton');
  var $vanbutton = $('#vanbutton');
  var $searchwrapper = $('#searchwrapper');
  var $searchbutton = $('#searchbutton');
  var $body = $('#body');
  var $window = $(window);
  var $listButton = $('#listButton');
  var $buttonList = $('#buttonList');
  var $buttonwrapper = $('#buttonwrapper');


$(function(){
    if ($window.width() < 1430) {
        $searchbutton.css("width","100px");
        $vanbutton.css("width","100px");
        $semibutton.css("width","100px");
        $sttbutton.css("width","100px");
        $heavybutton.css("width","100px");
        $allbutton.css("width","100px");
        $allbutton.css("font-size","13px");
        $sttbutton.css("font-size","10px");
        $heavybutton.css("font-size","10px");
        $vanbutton.css("font-size","10px");
        $semibutton.css("font-size","10px");
        $('#searchtext').css('visibility','hidden');
        $('#searchtext').children().prop('disabled',true);
        $buttonwrapper.css('visibility','hidden');
        $listButton.css('visibility','visible');
     }
    $semiwrapper.css('visibility', 'hidden');
    $sttwrapper.css('visibility', 'hidden');
    $heavywrapper.css('visibility', 'hidden');
    $vanwrapper.css('visibility', 'hidden');
    $semiwrapper.children().prop('disabled', true);
    $heavywrapper.children().prop('disabled', true);
    $sttwrapper.children().prop('disabled', true);
    $vanwrapper.children().prop('disabled', true);

    if(window.location.href.indexOf("&make=")>-1){
        if(window.location.href.indexOf("&type=van")>-1){
            $allbutton.css("background-color","#CDEBCD");
            $vanbutton.css("background-color","#9DE56A");
            $vanwrapper.children().prop('disabled', false);
            $vanwrapper.css('visibility', 'visible');
        }else{
            if(window.location.href.indexOf("&type=heavy")>-1){
                $allbutton.css("background-color","#CDEBCD");
                $heavybutton.css("background-color","#9DE56A");
                $heavywrapper.css('visibility', 'visible');
                $heavywrapper.children().prop('disabled', false);
                }else{
                    if(window.location.href.indexOf("&type=stt")>-1){
                        $allbutton.css("background-color","#CDEBCD");
                        $sttbutton.css("background-color","#9DE56A");
                        $sttwrapper.css('visibility', 'visible');
                        $sttwrapper.children().prop('disabled', false);
                    }else{
                        if(window.location.href.indexOf("&type=semi")>-1){
                            $allbutton.css("background-color","#CDEBCD");
                            $semibutton.css("background-color","#9DE56A");
                            $semiwrapper.css('visibility', 'visible');
                            $semiwrapper.children().prop('disabled', false);
                        }
                    }
                }
            }
        $('#uparrow').css('visibility', 'visible');
        $searchwrapper.css("visibility","visible");
        $header.css("height","310px");
        $body.css("margin-top","310px");
        $semibutton.css('visibility', 'visible');
        $semibutton.fadeIn();
        $sttbutton.css('visibility', 'visible');
        $sttbutton.fadeIn();
        $heavybutton.css('visibility', 'visible');
        $heavybutton.fadeIn();
        $vanbutton.css('visibility', 'visible');
        $vanbutton.fadeIn();
        $allbutton.css('visibility', 'visible');
        $allbutton.fadeIn();
    }else{
        $('#downarrow').css('visibility', 'visible');
        $searchwrapper.css("visibility","hidden");
        $header.css("height","90px");
        $body.css("margin-top","90px");
    }
});
$searchbutton.click(function(e){

    if($header.outerHeight() == 92){
      
        $('#downarrow').css('visibility', 'hidden');
        $('#uparrow').css('visibility', 'visible');
        $semibutton.css('visibility', 'visible');
        $semibutton.fadeIn();
        $sttbutton.css('visibility', 'visible');
        $sttbutton.fadeIn();
        $heavybutton.css('visibility', 'visible');
        $heavybutton.fadeIn();
        $vanbutton.css('visibility', 'visible');
        $vanbutton.fadeIn();
        $allbutton.css('visibility', 'visible');
        $allbutton.fadeIn();
        $searchwrapper.css("visibility","visible");
        $header.stop().animate({height:'310px'},400);
        $searchwrapper.fadeIn();
        $body.stop().animate({marginTop:'310px'},400);
    }else{
        $('#downarrow').css('visibility', 'visible');
        $('#uparrow').css('visibility', 'hidden');
        $semibutton.fadeOut();
        $sttbutton.fadeOut();
        $heavybutton.fadeOut();
        $vanbutton.fadeOut();
        $allbutton.fadeOut();
        $header.stop().animate({height:'90px'},400);
        $searchwrapper.fadeOut();
        $body.stop().animate({marginTop:'90px'},400);
    }
});
$vanbutton.click(function(e){
    $vanwrapper.css("visibility","visible");
    $vanwrapper.children().prop('disabled',false);
    $heavywrapper.children().prop('disabled', true);
    $sttwrapper.children().prop('disabled', true);
    $semiwrapper.children().prop('disabled', true);
    $sttwrapper.css("visibility","hidden");
    $semiwrapper.css("visibility","hidden");
    $heavywrapper.css("visibility","hidden");
    $sttbutton.css("background-color","#CDEBCD");
    $heavybutton.css("background-color","#CDEBCD");
    $semibutton.css("background-color","#CDEBCD");
    $allbutton.css("background-color","#CDEBCD");
    $vanbutton.css("background-color","#9DE56A");
});

$heavybutton.click(function(e){
    $heavywrapper.css("visibility","visible");
    $heavywrapper.children().prop('disabled', false);
    $vanwrapper.children().prop('disabled', true);
    $sttwrapper.children().prop('disabled', true);
    $semiwrapper.children().prop('disabled', true);
    $semiwrapper.css("visibility","hidden");
    $vanwrapper.css("visibility","hidden");
    $sttwrapper.css("visibility","hidden");
    $sttbutton.css("background-color","#CDEBCD");
    $heavybutton.css("background-color","#9DE56A");
    $semibutton.css("background-color","#CDEBCD");
    $allbutton.css("background-color","#CDEBCD");
    $vanbutton.css("background-color","#CDEBCD");
});

$semibutton.click(function(e){
    $semiwrapper.css("visibility","visible");
    $semiwrapper.children().prop('disabled', false);
    $heavywrapper.children().prop('disabled', true);
    $sttwrapper.children().prop('disabled', true);
    $vanwrapper.children().prop('disabled', true);
    $sttwrapper.css("visibility","hidden");
    $vanwrapper.css("visibility","hidden");
    $heavywrapper.css("visibility","hidden");
    $sttbutton.css("background-color","#CDEBCD");
    $heavybutton.css("background-color","#CDEBCD");
    $semibutton.css("background-color","#9DE56A");
    $allbutton.css("background-color","#CDEBCD");
    $vanbutton.css("background-color","#CDEBCD");
});

$sttbutton.click(function(e){
    $sttwrapper.css("visibility","visible");
    $sttwrapper.children().prop('disabled', false);
    $heavywrapper.children().prop('disabled', true);
    $vanwrapper.children().prop('disabled', true);
    $semiwrapper.children().prop('disabled', true);
    $semiwrapper.css("visibility","hidden");
    $heavywrapper.css("visibility","hidden");
    $vanwrapper.css("visibility","hidden");
    $sttbutton.css("background-color","#9DE56A");
    $heavybutton.css("background-color","#CDEBCD");
    $semibutton.css("background-color","#CDEBCD");
    $allbutton.css("background-color","#CDEBCD");
    $vanbutton.css("background-color","#CDEBCD");
});

$allbutton.click(function(e){
    $sttwrapper.children().prop('disabled', true);
    $heavywrapper.children().prop('disabled', true);
    $vanwrapper.children().prop('disabled', true);
    $semiwrapper.children().prop('disabled', true);
    $sttwrapper.css("visibility","hidden");
    $semiwrapper.css("visibility","hidden");
    $heavywrapper.css("visibility","hidden");
    $vanwrapper.css("visibility","hidden");
    $sttbutton.css("background-color","#CDEBCD");
    $heavybutton.css("background-color","#CDEBCD");
    $semibutton.css("background-color","#CDEBCD");
    $allbutton.css("background-color","#9DE56A");
    $vanbutton.css("background-color","#CDEBCD");
});

$window.on('resize', function(){
    if ($window.width() < 1430) { 
        $searchbutton.css("width","100px");
        $vanbutton.css("width","100px");
        $semibutton.css("width","100px");
        $sttbutton.css("width","100px");
        $heavybutton.css("width","100px");
        $allbutton.css("width","100px");
        $allbutton.css("font-size","13px");
        $sttbutton.css("font-size","10px");
        $heavybutton.css("font-size","10px");
        $vanbutton.css("font-size","10px");
        $semibutton.css("font-size","10px");
        $('#searchtext').css('visibility','hidden');
        $('#searchtext').children().prop('disabled',true);
        $buttonwrapper.css('visibility','hidden');
        $listButton.css('visibility','visible');
    }else{
        $searchbutton.css("width","150px");
        $vanbutton.css("width","150px");
        $semibutton.css("width","150px");
        $sttbutton.css("width","150px");
        $heavybutton.css("width","150px");
        $allbutton.css("width","150px");
        $allbutton.css("font-size","20px");
        $sttbutton.css("font-size","15px");
        $heavybutton.css("font-size","15px");
        $vanbutton.css("font-size","15px");
        $semibutton.css("font-size","15px");
        $('#searchtext').css('visibility','visible');
        $('#searchtext').children().prop('disabled',false);
        $buttonwrapper.css('visibility','visible');
        $listButton.css('visibility','hidden');
    }
});

$window.scroll(function(){
    if($window.scrollLeft() > -500){
        $header.css('right',-$window.scrollLeft());
    }
});

$listButton.hover(function() {$buttonList.css('visibility','visible');}
                 , function() {$buttonList.css('visibility','hidden');}
);

$buttonList.hover(function() {$buttonList.css('visibility','visible');}
                 , function() {$buttonList.css('visibility','hidden');}
);

});


