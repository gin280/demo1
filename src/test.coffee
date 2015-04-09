$(document).ready ->
	
	showtime = ->
		checktime = (i) ->
			if i<10 then return i = '0'+i else return i
		myDate = new Date()
		year = myDate.getFullYear()
		month = myDate.getMonth()+1
		date = myDate.getDate()
		d = myDate.getDay()#星期几
		h = myDate.getHours()
		m = myDate.getMinutes()
		s =myDate.getSeconds()
		m = checktime(m)
		s= checktime(s)
		weekday =[
			'星期天'
			'星期一'
			'星期二'
			'星期三'
			'星期四'
			'星期五'
			'星期六'
		]
		$('.one').text(year+'年'+month+'月'+date+'日'+' '+weekday[d]+h+':'+m+':'+s)
		setTimeout(showtime,500)	
	showtime()

	#
	showtime2 = ->
		curtime = new Date()
		endtime = new Date('2015/2/28')
		lefttime = Math.ceil((endtime.getTime()-curtime.getTime())/(24*60*60*1000))
		$('.two').text(lefttime);
	showtime2()

	#
	showtime3 = ->
		curtime = new Date()
		endtime = new Date('2015/2/28,12:00:00')
		lefttime = parseInt((endtime.getTime()-curtime.getTime())/1000)
		d = parseInt(lefttime/(24*60*60))
		h = parseInt(lefttime/(60*60)%24)
		m = parseInt(lefttime/60%60)
		s = parseInt(lefttime%60)
		$('.three').text(d+'天'+h+'小时'+m+'分'+s+'秒')
		if lefttime <= 0 then $('.three').text('时间到了呀')
		setTimeout(showtime3,500)
	showtime3()

	#
	area = $('#marquee2')
	con1 = $('#con1')
	con2 = $('#con2')
	speed = 50
	area.scrollTop(0)
	scrollUp = ->
		if area.scrollTop() >= con1[0].scrollHeight
			return area.scrollTop(0)
		else
			area[0].scrollTop += 3
		

	myScroll = setInterval(scrollUp,speed)	
	$('li').mouseenter ->
		clearInterval(myScroll)
	$('li').mouseout ->
		myScroll = setInterval(scrollUp,speed)

	
	###
	iliH = 24
	time = null
	delay = 2000
	area2 = $('#marquee3')
	area2[0].innerHTML+=area2[0].innerHTML
	startScroll = ->
		time = setInterval(scrollUp2,speed)
		area2[0].scrollTop++
	scrollUp2 = ->
		if area2[0].scrollTop % iliH is 0 
			clearInterval(time)
			setTimeout(startScroll,delay)
		else
			area2[0].scrollTop++
			if area2[0].scrollTop >= area2[0].scrollHeight/2
				area2[0].scrollTop = 0
	setTimeout(startScroll,delay)
	###
	
	checkscroll = ->
		aPin = $( ".box" )
		lastPinH = aPin.last().get(0).offsetTop + Math.floor(aPin.last().height()/2)
		wT = $(window).scrollTop()
		dH = $(document).width()
		if lastPinH < wT+dH then return true else return false
	$(window).scroll ->
		dataInt ={'data':[{'src':'0.jpg'},{'src':'1.jpg'},{'src':'2.jpg'},{'src':'3.jpg'}]}
		if checkscroll()
			for index,value of dataInt.data
				oBox = '<div class="box"><div class="pic">'+'<img src="img/images/'+value.src+'">'
				$('.container').append(oBox)
				