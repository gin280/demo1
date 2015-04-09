$(document).ready ->
	$('button').hide()
	$(window).scroll ->
		if $(window).scrollTop() > 100 then $('button').fadeIn(500) else $('button').fadeOut(500)
	$('button').click ->
		
		$('html').animate({scrollTop:0},1000)
		