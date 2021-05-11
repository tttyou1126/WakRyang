<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<%@ include file="/WEB-INF/include/include-header.jspf"%>

<link href="/css/bootstrap.min.css" rel="stylesheet">

<style>

</style>

<meta charset="UTF-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<title>Diagonal Slideshow | Codrops</title>
		<meta name="description" content="A triple view diagonal slideshow with content preview." />
		<meta name="keywords" content="" />
		<meta name="author" content="Codrops" />
		<link rel="shortcut icon" href="favicon.ico">
		<link rel="stylesheet" type="text/css" href="/css/aboutMe/base.css" />
		<script>
		document.documentElement.className = "js";
		var supportsCssVars = function() { var e, t = document.createElement("style"); return t.innerHTML = "root: { --tmp-var: bold; }", document.head.appendChild(t), e = !!(window.CSS && window.CSS.supports && window.CSS.supports("font-weight", "var(--tmp-var)")), t.parentNode.removeChild(t), e };
		supportsCssVars() || alert("Please view this demo in a modern browser that supports CSS Variables.");
		</script>

</head>
<body class="loading">
<div style="position: relative; z-index: 2;"> <%-- 210511 z-index를 이용하여 메뉴바 항상 위에 배치됨 --%>
<%@ include file="/WEB-INF/jsp/home/homeMenu.jsp"%>
</div>
<div style="position: relative; z-index: 1;">
		<svg class="hidden">
			<symbol id="icon-arrow" viewBox="0 0 24 24">
				<title>arrow</title>
				<polygon points="6.3,12.8 20.9,12.8 20.9,11.2 6.3,11.2 10.2,7.2 9,6 3.1,12 9,18 10.2,16.8 " />
			</symbol>
			<symbol id="icon-drop" viewBox="0 0 24 24">
				<title>drop</title>
				<path d="M12,21c-3.6,0-6.6-3-6.6-6.6C5.4,11,10.8,4,11.4,3.2C11.6,3.1,11.8,3,12,3s0.4,0.1,0.6,0.3c0.6,0.8,6.1,7.8,6.1,11.2C18.6,18.1,15.6,21,12,21zM12,4.8c-1.8,2.4-5.2,7.4-5.2,9.6c0,2.9,2.3,5.2,5.2,5.2s5.2-2.3,5.2-5.2C17.2,12.2,13.8,7.3,12,4.8z" />
				<path d="M12,18.2c-0.4,0-0.7-0.3-0.7-0.7s0.3-0.7,0.7-0.7c1.3,0,2.4-1.1,2.4-2.4c0-0.4,0.3-0.7,0.7-0.7c0.4,0,0.7,0.3,0.7,0.7C15.8,16.5,14.1,18.2,12,18.2z" />
			</symbol>
			<symbol id="icon-longarrow" viewBox="0 0 54 24">
				<title>longarrow</title>
				<path d="M.42 11.158L12.38.256c.333-.27.696-.322 1.09-.155.395.166.593.467.593.903v6.977h38.87c.29 0 .53.093.716.28.187.187.28.426.28.716v5.98c0 .29-.093.53-.28.716a.971.971 0 0 1-.716.28h-38.87v6.977c0 .416-.199.717-.592.903-.395.167-.759.104-1.09-.186L.42 12.62a1.018 1.018 0 0 1 0-1.462z" />
			</symbol>
			<symbol id="icon-navarrow" viewBox="0 0 408 408">
				<title>navarrow</title>
				<polygon fill="#fff" fill-rule="nonzero" points="204 0 168.3 35.7 311.1 178.5 0 178.5 0 229.5 311.1 229.5 168.3 372.3 204 408 408 204"></polygon>
			</symbol>
		</svg>
		<main>
			<div class="frame">
				<header class="codrops-header">
					<h1 class="codrops-header__title">Diagonal Slideshow</h1>
					<div class="codrops-links">
						<a class="github" href="https://github.com/codrops/DiagonalSlideshow/">GitHub</a>
						<a class="codrops-icon codrops-icon--prev" href="https://tympanus.net/Development/SlideOutBoxMenu/" title="Previous Demo">
							<svg class="icon icon--arrow">
								<use xlink:href="#icon-arrow"></use>
							</svg>
						</a>
						<a class="codrops-icon codrops-icon--drop" href="https://tympanus.net/codrops/?p=35765" title="Back to the article">
							<svg class="icon icon--drop">
								<use xlink:href="#icon-drop"></use>
							</svg>
						</a>
					</div>
				</header>
			</div>
			<div class="slideshow">
				<div class="slideshow__deco"></div>
				<div class="slide">
					<div class="slide__img-wrap">
						<div class="slide__img" style="background-image: url(/images/aboutMe/1.jpg);"></div>
					</div>
					<div class="slide__side">Introduction to Developers</div>
					<div class="slide__title-wrap">
					<span class="slide__number">1 .</span>
						<h3 class="slide__title">개발자 소개</h3>
						<h4 class="slide__subtitle">Introduction to Developers</h4>
					</div>
				</div>
				<div class="slide">
					<div class="slide__img-wrap">
						<div class="slide__img" style="background-image: url(/images/aboutMe/career.png);"></div>
					</div>
					<div class="slide__side">Career</div>
					<div class="slide__title-wrap">
					<span class="slide__number">2 .</span>
						<h3 class="slide__title">경력</h3>
						<h4 class="slide__subtitle">Career</h4>
					</div>
				</div>
				<div class="slide">
					<div class="slide__img-wrap">
						<div class="slide__img" style="background-image: url(/images/aboutMe/skill.png);"></div>
					</div>
					<div class="slide__side">Skill</div>
					<div class="slide__title-wrap">
					<span class="slide__number">3 .</span>
						<h3 class="slide__title">기술</h3>
						<h4 class="slide__subtitle">Skill</h4>
					</div>
				</div>
				<div class="slide">
					<div class="slide__img-wrap">
						<div class="slide__img" style="background-image: url(/images/aboutMe/project.png);"></div>
					</div>
					<div class="slide__side">Project History</div>
					<div class="slide__title-wrap">
					<span class="slide__number">4 .</span>
						<h3 class="slide__title">프로젝트 이력</h3>
						<h4 class="slide__subtitle">Project History</h4>
					</div>
				</div>
				<button class="nav nav--prev">
					<svg class="icon icon--navarrow-prev">
						<use xlink:href="#icon-navarrow"></use>
					</svg>
				</button>
				<button class="nav nav--next">
					<svg class="icon icon--navarrow-next">
						<use xlink:href="#icon-navarrow"></use>
					</svg>
				</button>
			</div>
			<div class="content">
				<div class="content__item">
					<span class="content__number">1</span>
					<h3 class="content__title">개발자 소개</h3>
					<h4 class="content__subtitle">A tree needs to be your friend if you're going to paint him</h4>
					<div class="content__text">Just let this happen. We just let this flow right out of our minds. Just relax and let it flow. That easy. Let's put some happy little clouds in our world. It's a very cold picture, I may have to go get my coat. It’s about to freeze me to death. This is gonna be a happy little seascape. Let's go up in here, and start having some fun The least little bit can do so much. Work on one thing at a time. Don't get carried away - we have plenty of time. Put your feelings into it, your heart, it's your world. These trees are so much fun. I get started on them and I have a hard time stopping.</div>
				</div>
				<div class="content__item">
					<span class="content__number">2</span>
					<h3 class="content__title">경력</h3>
					<h4 class="content__subtitle">This is probably the greatest thing to happen in my life</h4>
					<div class="content__text">We're not trying to teach you a thing to copy. We're just here to teach you a technique, then let you loose into the world. Now, we're going to fluff this cloud. We don't have anything but happy trees here. Let's do that again. Use what you see, don't plan it. Let's go up in here, and start having some fun The least little bit can do so much. Work on one thing at a time. Don't get carried away - we have plenty of time. Put your feelings into it, your heart, it's your world. These trees are so much fun. I get started on them and I have a hard time stopping.</div>
				</div>
				<div class="content__item">
					<span class="content__number">3</span>
					<h3 class="content__title">기술</h3>
					<h4 class="content__subtitle">The only guide is your heart</h4>
					<div class="content__text">Let's go up in here, and start having some fun The least little bit can do so much. Work on one thing at a time. Don't get carried away - we have plenty of time. Put your feelings into it, your heart, it's your world. These trees are so much fun. I get started on them and I have a hard time stopping. But we're not there yet, so we don't need to worry about it. Now let's put some happy little clouds in here. What the devil. A thin paint will stick to a thick paint. I'm going to mix up a little color. </div>
				</div>
				<div class="content__item">
					<span class="content__number">4</span>
					<h3 class="content__title">프로젝트 이력</h3>
					<h4 class="content__subtitle">The only prerequisite is that it makes you happy</h4>
					<div class="content__text">See. We take the corner of the brush and let it play back-and-forth. This is unplanned it really just happens. I'm sort of a softy, I couldn't shoot Bambi except with a camera. I guess I'm a little weird. I like to talk to trees and animals. That's okay though; I have more fun than most people. We'll play with clouds today. Didn't you know you had that much power? You can move mountains. You can do anything. Let's go up in here, and start having some fun The least little bit can do so much. Work on one thing at a time. Don't get carried away - we have plenty of time. Put your feelings into it, your heart, it's your world. These trees are so much fun. I get started on them and I have a hard time stopping.</div>
				</div>
				<button class="content__close">
					<svg class="icon icon--longarrow">
						<use xlink:href="#icon-longarrow"></use>
					</svg>
				</button>
			</div>
		</main>
		<script src="/js/aboutMe/imagesloaded.pkgd.min.js"></script>
		<script src="/js/aboutMe/charming.min.js"></script>
		<script src="/js/aboutMe/TweenMax.min.js"></script>
		<script src="/js/aboutMe/demo.js"></script>
		</div>
	</body>
</html>

