<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <!-- Jquery 라이브러리 -->
    <script src="https://code.jquery.com/jquery-3.6.3.min.js" crossorigin="anonymous"></script>
    <!-- 슬릭 -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.9.0/slick-theme.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.9.0/slick.min.css">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.9.0/slick.min.js"></script>
    <%@ include file="../header/header.jsp" %>
</head>
<style>
    .slick-current>
	    div {
	        display: flex;
	        border-radius: 100rem;
	        background: radial-gradient(circle, rgba(255,255,255,0.8) 0%, rgba(255,255,255,0.1) 100%);
	        box-shadow: 0 0 20px rgba(255,255,255,0.2);
	    }
	
	    .container {
	        width: 241.25px; height: 420px;
	        transition : all 0.1s;
	        align-items: center;
	        position: relative;
	        margin: 13% 5% 10% 23%;
	        top: 5%;
	
	    }
	    .overlay {
	        position: absolute;
	        width: 241.25px;
	        height: 375px;
	        background: linear-gradient(105deg, transparent 40%, rgba(255, 219, 112, 0.8) 45%, rgba(132, 50, 255 ,0.6) 50%, transparent 54%);
	        filter: brightness(1.1) opacity(0.0);
	        mix-blend-mode: color-dodge;
	        background-size: 150% 150%;
	        background-position: 100%;
	        transition: all 0.1s;
	        /*z-index: 1;*/
	    }
	    .card {
	        width: 241.25px; height: 375px;
	        /*이미지 임시 설정*/
	        background-image: url("/imgs/22.png");
	        background-size: cover;
	        border-radius: 1rem;
	    }
</style>
<body style="background-color: #6c757d">
    <section style="width: 100%;display: flex;align-items: center;justify-content: center">
        <h1 class="card-title" style="align-items: center;">1순위</h1>
    </section>
    <section style="width: 100%; height: 100%; display: flex; align-items: center; justify-content: center;">
        <div class="slider-for" style="width: 95%;height: 100%; min-height: 10%; align-items: center">
            <div class="container">
                <div class="overlay"></div>
                <div class="card" data-img-index="1" style="background-image: url('/imgs/21.png');"></div>
            </div>
            <div class="container">
                <div class="overlay"></div>
                <div class="card" data-img-index="2" style="background-image: url('/imgs/22.png');"></div>
            </div>
            <div class="container">
                <div class="overlay"></div>
                <div class="card" data-img-index="3" style="background-image: url('/imgs/40.png');"></div>
            </div>
            <div class="container">
                <div class="overlay"></div>
                <div class="card" data-img-index="4" style="background-image: url('/imgs/42.png');"></div>
            </div>
            <div class="container">
                <div class="overlay"></div>
                <div class="card" data-img-index="5" style="background-image: url('/imgs/44.png');"></div>
            </div>
        </div>
    </section>
    <section style="width: 100%; display: flex; flex-direction:column; align-items: center;justify-content: center">
        <h2>카드혜택, 카드혜택</h2>
        <button type="button" class="btn btn-primary">카드선택</button>
    </section>
</body>
<script>
    $(document).ready(function() {
        $('.slider-for').slick({
            slide : 'div', //슬라이드 되어야 할 태그 ex) div, li
            infinite : true, //무한 반복 옵션
            slidesToShow : 3, // 한 화면에 보여질 컨텐츠 개수
            slidesToScroll : 1, //스크롤 한번에 움직일 컨텐츠 개수
            speed : 1000, // 다음 버튼 누르고 다음 화면 뜨는데까지 걸리는 시간(ms)
            arrows : true, // 옆으로 이동하는 화살표 표시 여부
            dots : false, // 스크롤바 아래 점으로 페이지네이션 여부
            autoplay : false, // 자동 스크롤 사용 여부
            autoplaySpeed : 3000, // 자동 스크롤 시 다음으로 넘어가는데 걸리는 시간 (ms)
            pauseOnHover : false, // 슬라이드 이동시 마우스 호버하면 슬라이더 멈추게 설정
            vertical : false, // 세로 방향 슬라이드 옵션
            prevArrow : "<button type='button' class='btn btn-info' style='position: absolute;top: 110%;left: 100px;'>이전</button>",		// 이전 화살표 모양 설정
            nextArrow : "<button type='button' class='btn btn-info' style='position: absolute;top: 110%;right: 100px;'>다음</button>",	 	// 다음 화살표 모양 설정
            centerMode: true, // 센터 모드
            draggable : true, // 드래그 여부
            focusOnSelect: true // 클릭시 이동

        });
    });
</script>
<script>

    function movingContainer(e, container, overlay) {
        var x = e.offsetX;
        var y = e.offsetY;
        var rotateY = -1 / 10 * x + 20;
        var rotateX = 4 / 50 * y - 20;

        overlay.style = `background-position : ` + x / 20 + y / 20 + `%; filter : opacity(` + x / 2000 + `) brightness(1.2)`;

        container.style = `transform : perspective(350px) rotateX(` + rotateX + `deg) rotateY(` + rotateY + `deg)`;
    }

    function movingOut(e, container, overlay) {
        overlay.style = 'filter : opacity(0)';
        container.style = 'transform : perspective(350px) rotateY(0deg) rotateX(0deg)';
    }

    function removeAllEventListeners(element) {
        var clone = element.cloneNode(true);
        element.parentNode.replaceChild(clone, element);
    }

    function beforeChangeHandler(event, slick, currentSlide, nextSlide) {

        var beforeContainer = document.querySelector('[data-slick-index="' + currentSlide + '"] .container');
        var beforeOverlay = document.querySelector('[data-slick-index="' + currentSlide + '"] .overlay');
        var container = document.querySelector('[data-slick-index="' + nextSlide + '"] .container');
        var overlay = document.querySelector('[data-slick-index="' + nextSlide + '"] .overlay');

        removeAllEventListeners(beforeContainer);
        removeAllEventListeners(beforeOverlay);

        container.addEventListener('mousemove', function(e) { movingContainer(e, container, overlay) });
        container.addEventListener('mouseout', function(e) { movingOut(e, container, overlay) });

        var card = document.querySelector('[data-slick-index="' + nextSlide + '"] .card');
        var title = document.querySelector('.card-title');
        var imgIndex = card.getAttribute('data-img-index');
        title.innerText = imgIndex+" 순위";

    }
    $('.slider-for').on('beforeChange', beforeChangeHandler);
    var firstContainer = document.querySelector('.container');
    var firstOverlay = document.querySelector('.overlay');
    firstContainer.addEventListener('mousemove', function(e) { movingContainer(e, firstContainer, firstOverlay) });
    firstContainer.addEventListener('mouseout', function(e) { movingOut(e, firstContainer, firstOverlay) });


</script>
</html>