$( document ).ready(function() {
	var content = $('body').html();
	var re1 = /<!--START WIDGET-->/gi;
	var re2 = /<!--COLBREAK-->/gi;
	var re3 = /<!--SLIDEBREAK-->/gi;
	var re4 = /<!--END WIDGET-->/gi;
	var re5 = /(\[)(.*)(\])(\()(#.*)(\))({id=)(.*)(})/gi;
	var re6 = /(<a)( href=".*">.*<\/a>)({id=)(.*)(})/gi;
	var newcontent = content.replace(re5, '<a href=\"$5\" class=\"callout\" id=\"$8\">$2<\/a>').replace(re6, '$1 class=\"callout\" id=\"$4\"$2').replace(re1, '</div></div><div id="myCarousel" class="carousel slide" data-interval="false"><div class="carousel-inner"><div class="active item"><div class="row-fluid"><div class="block span4">').replace(re2, '</div><div class="block span4">').replace(re3, '</div></div></div><div class="item"><div class="row-fluid"><div class="block span4">').replace(re4, '</div></div></div><a class="carousel-control left" href="#myCarousel" data-slide="prev">&lsaquo;</a><a class="carousel-control right" href="#myCarousel" data-slide="next">&rsaquo;</a></div><div id="container" class="row-fluid"><div class="span8 offset2">');
	$('body').html(newcontent);
});

$(document).ready(function () {
  $(".callout").click(function() {
    $('.callout').css('background-color', 'transparent');
    var $href = $(this).attr('href').slice(1);
    $('#' + $href).css('background-color', '#ccc');
    $(this).css('background-color', '#ccc');
  });
});