<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/include/include-header.jspf"%>
<link
	href="https://fonts.googleapis.com/css2?family=Josefin+Sans:wght@400;700&family=Roboto+Mono:wght@400;700&display=swap"
	rel="stylesheet">
<link rel="stylesheet" href="/fonts/home/icomoon/style.css">

<link rel="stylesheet" href="/css/home/bootstrap.min.css">
<link rel="stylesheet" href="/css/home/magnific-popup.css">
<link rel="stylesheet" href="/css/home/jquery-ui.css">
<link rel="stylesheet" href="/css/home/owl.carousel.min.css">
<link rel="stylesheet" href="/css/home/owl.theme.default.min.css">

<link rel="stylesheet" href="/css/home/lightgallery.min.css">

<link rel="stylesheet" href="/css/home/bootstrap-datepicker.css">

<link rel="stylesheet" href="/fonts/home/flaticon/font/flaticon.css">

<link rel="stylesheet" href="/css/home/swiper.css">

<link rel="stylesheet" href="/css/home/aos.css">

<link rel="stylesheet" href="/css/home/style.css">

<%-- 210504 날씨 api --%>
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.15.3/css/all.css"
	integrity="sha384-SZXxX4whJ79/gErwcOYf+zWLeJdY/qpuqC4cAa9rOGUstPomtqpuNWT9wdPEn2fk"
	crossorigin="anonymous">



<header class="site-navbar py-3" id="top" role="banner">

	<div class="container-fluid">
		<div class="row align-items-center">

			<div class="col-6 col-xl-2">
				<a href="${path}/home/sunhome.do" class="text-White h2 mb-0">${sessionScope.userName}</a>
			</div>


			<div class="col-10 col-md-8 d-none d-xl-block">
				<nav
					class="site-navigation position-relative text-right text-lg-center"
					role="navigation">

					<ul class="site-menu js-clone-nav mx-auto d-none d-lg-block">
						<li class="active"><a href="${path}/home/sunhome.do">Main</a></li>
						<li class="has-children"><a href="single.html">introduction</a>
							<ul class="dropdown">
								<li><a href="#">About Me</a></li>
								<li><a href="#">Skill</a></li>
								<li><a href="#">Project</a></li>
								<li><a href="#">Career</a></li>
								<li><a href="#">Resume</a></li>
								<li class="has-children"><a href="#">Trail Development</a>
									<ul class="dropdown">
										<li><a href="https://github.com/tttyou1126">GitHub</a></li>
										<li><a href="#">Blog</a></li>
									</ul></li>
							</ul></li>
							<li class="has-children"><a href="single.html">Practice</a>
							<ul class="dropdown">
								<li><a href="${path}/sample/board.do">Board</a></li>
								
								<%-- 210504 날씨 api --%>
								<li class="has-children">
									<a href="#">Weather</a>
								<ul class="dropdown">
									<li><a href="#">
										<div class="seoul_CurrIcon"></div>
										</a>
									</li>
									<li><a href="#">
										<div class="incheon_CurrIcon"></div>
										</a>
									</li>
									<li><a href="#">
										<div class="wonju_CurrIcon"></div>
										</a>
									</li>
									<li><a href="#">
										<div class="busan_CurrIcon"></div>
										</a>
									</li>
									<li><a href="#">
										<div class="gwangju_CurrIcon"></div>
										</a>
									</li>
									<li><a href="#">
										<div class="jeju_CurrIcon"></div>
										</a>
									</li>
								</ul>
								</li>
							</ul>
							</li>
						<li><a href="contact.html">Contact</a></li>


						<c:if test="${sessionScope.userAuth == 'ADMIN'}">
							<li><a href="${path}/member/list.do">회원관리</a></li>
						</c:if>				
					</ul>
				</nav>
			</div>




			<div class="col-6 col-xl-2 text-right">
				<c:choose>
					<c:when test="${empty sessionScope.userName}">
						<ul class="navbar-nav">
							<li class="nav-item"><a class="nav-link js-scroll-trigger"
								href="${path}/main/loginScreen.do"><font size="6">로그인</font></a>
							</li>
						</ul>
					</c:when>
					<c:when test="${not empty sessionScope.userName}">
						<ul class="navbar-nav">
							<li class="nav-item"><a class="nav-link js-scroll-trigger"
								href="${path}/member/logout.do"><font size="6">로그아웃</font></a></li>
						</ul>
					</c:when>
					<c:otherwise>
						<ul class="navbar-nav">
							<li class="nav-item"><a class="nav-link js-scroll-trigger"
								href="${path}/main/loginScreen.do"><font size="6">로그인</font></a>
							</li>
						</ul>
					</c:otherwise>
				</c:choose>
			</div>
		</div>
	</div>

</header>


<script type="text/javascript">
	$(document)
			.ready(
					<%-- 210504 날씨 api --%>
					function() {
						let weatherIcon = {
							'01' : 'fas fa-sun',
							'02' : 'fas fa-cloud-sun',
							'03' : 'fas fa-cloud',
							'04' : 'fas fa-cloud-meatball',
							'09' : 'fas fa-cloud-sun-rain',
							'10' : 'fas fa-cloud-showers-heavy',
							'11' : 'fas fa-poo-storm',
							'13' : 'far fa-snowflake',
							'50' : 'fas fa-smog'
						};
						$.ajax({
									url : 'http://api.openweathermap.org/data/2.5/weather?q=seoul&APPID=2e376c0b2999c2284b43c3e128124930&units=metric',
									dataType : 'json',
									type : 'GET',
									success : function(data) {
										var $Icon = (data.weather[0].icon).substr(0, 2);
										var $Temp = Math.floor(data.main.temp) + 'º';
										var $city = data.name;
										$('.seoul_CurrIcon').append($city);
										$('.seoul_CurrIcon').append('<i class="' + weatherIcon[$Icon] +'"></i>');
										$('.seoul_CurrIcon').append($Temp);
										
										
										
									}
								})
						$.ajax({  
									url : 'http://api.openweathermap.org/data/2.5/weather?q=jeju&APPID=2e376c0b2999c2284b43c3e128124930&units=metric',
									dataType : 'json',
									type : 'GET',
									success : function(data) {
										var $Icon = (data.weather[0].icon).substr(0, 2);
										var $Temp = Math.floor(data.main.temp) + 'º';
										var $city = data.name;
										$('.jeju_CurrIcon').append($city);
										$('.jeju_CurrIcon').append('<i class="' + weatherIcon[$Icon] +'"></i>');
										$('.jeju_CurrIcon').append($Temp);
									}
								})
						$.ajax({  
									url : 'http://api.openweathermap.org/data/2.5/weather?q=busan&APPID=2e376c0b2999c2284b43c3e128124930&units=metric',
									dataType : 'json',
									type : 'GET',
									success : function(data) {
										var $Icon = (data.weather[0].icon).substr(0, 2);
										var $Temp = Math.floor(data.main.temp) + 'º';
										var $city = data.name;
										$('.busan_CurrIcon').append($city);
										$('.busan_CurrIcon').append('<i class="' + weatherIcon[$Icon] +'"></i>');
										$('.busan_CurrIcon').append($Temp);
									}
								})
						$.ajax({  
									url : 'http://api.openweathermap.org/data/2.5/weather?q=gwangju&APPID=2e376c0b2999c2284b43c3e128124930&units=metric',
									dataType : 'json',
									type : 'GET',
									success : function(data) {
										var $Icon = (data.weather[0].icon).substr(0, 2);
										var $Temp = Math.floor(data.main.temp) + 'º';
										var $city = data.name;
										$('.gwangju_CurrIcon').append($city);
										$('.gwangju_CurrIcon').append('<i class="' + weatherIcon[$Icon] +'"></i>');
										$('.gwangju_CurrIcon').append($Temp);
									}
								})
						$.ajax({  
									url : 'http://api.openweathermap.org/data/2.5/weather?q=incheon&APPID=2e376c0b2999c2284b43c3e128124930&units=metric',
									dataType : 'json',
									type : 'GET',
									success : function(data) {
										var $Icon = (data.weather[0].icon).substr(0, 2);
										var $Temp = Math.floor(data.main.temp) + 'º';
										var $city = data.name;
										$('.incheon_CurrIcon').append($city);
										$('.incheon_CurrIcon').append('<i class="' + weatherIcon[$Icon] +'"></i>');
										$('.incheon_CurrIcon').append($Temp);
									}
								})
								
						$.ajax({  
									url : 'http://api.openweathermap.org/data/2.5/weather?q=wonju&APPID=2e376c0b2999c2284b43c3e128124930&units=metric',
									dataType : 'json',
									type : 'GET',
									success : function(data) {
										var $Icon = (data.weather[0].icon).substr(0, 2);
										var $Temp = Math.floor(data.main.temp) + 'º';
										var $city = data.name;
										$('.wonju_CurrIcon').append($city);
										$('.wonju_CurrIcon').append('<i class="' + weatherIcon[$Icon] +'"></i>');
										$('.wonju_CurrIcon').append($Temp);
									}
								})		
					});
</script>
