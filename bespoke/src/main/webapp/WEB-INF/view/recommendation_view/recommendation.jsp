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
		    width: 241.25px;
		    height: 420px;
		    transition: all 0.1s;
		    align-items: center;
		    position: relative;
		    margin: 13% 5% 10% 23%;
		    top: 5%;
		}
	    .overlay {
		    position: absolute;
		    width: 241.25px; 
		    height: 375px; 
		    background: linear-gradient(105deg, transparent 40%, rgba(255, 219, 112, 0.8) 45%, rgba(132, 50, 255, 0.6) 50%, transparent 54%);
		    filter: brightness(1.1) opacity(0.0);
		    mix-blend-mode: color-dodge;
		    background-size: 150% 150%;
		    background-position: 100%;
		    transition: all 0.1s;
		}
	    .card {
		    width: 241.25px; /* 변경 */
		    height: 375px; /* 변경 */
		    background-size: cover;
		    border-radius: 1rem;
		}
</style>
<body style="background-color: #6c757d">
    <section style="width: 100%;display: flex;align-items: center;justify-content: center">
        <h1 class="card-title" style="align-items: center;">1 순위</h1>
    </section>
    <section style="width: 100%; height: 100%; display: flex; align-items: center; justify-content: center;">
		<div class="slider-for" style="width: 95%; height: 100%; min-height: 10%; align-items: center;">
			<c:forEach var="imageUrl" items="${imageUrls}" varStatus="imageStatus">
				<div class="container">
				    <div class="overlay"></div>
				    <div class="card" id="${imageStatus.index}" style="background-image: url('<c:out value="${imageUrl}"/>');"></div>
				</div>
			</c:forEach>
		</div>
    </section>
    
    <section style="width: 100%; display: flex; flex-direction:column; align-items: center;justify-content: center">
        <div class="benefit-card">
        	<h2 id="benefits"></h2>
        </div>
		<form id="selectCardId" action="/design/carddesign" method="GET">
			<input type="hidden" name="selectId">
			<button type="button" class="btn btn-primary" onclick="selectCardAndSubmit()">카드선택</button>
		</form>
    </section>
</body>
<script>
    // JSON 문자열을 JavaScript 객체로 변환합니다.
    var categoryClasses = JSON.parse('${categoryClassJson}');

    // JSON 배열의 첫 번째 배열을 찾아서 텍스트로 결합합니다.
    var firstCategoryClassText = categoryClasses[0].join(', ');

    // 결합된 텍스트를 <h2> 태그 안에 설정합니다.
    document.getElementById('benefits').innerText = firstCategoryClassText;
</script>
<script>
    function selectCardAndSubmit() {
        // 여기서 카드 선택에 관련된 동작 수행
        window.location.href = '../design/carddesign'; // 카드 선택 페이지로 이동

        // 여기서 확인 버튼에 관련된 동작 수행
        document.getElementById('select').submit(); // 폼 제출
    }
</script>
<script>
	function beforeChangeHandler(event, slick, currentSlide, nextSlide) {
	    // 다음 슬라이드의 카드 ID 가져오기
	    var currentSlideId = $('[data-slick-index="' + currentSlide + '"] .card').attr('id');
	    
	    // 폼의 hidden input에 선택된 카드의 ID 설정
	    document.getElementById('selectCardId').querySelector('input[name="selectId"]').value = currentSlideId;
	}
	
	$(document).ready(function() {
	    // 슬라이더 초기화 및 이벤트 핸들러 등록
	    $('.slider-for').slick({
	        slide: 'div',
	        infinite: true,
	        slidesToShow: 3,
	        slidesToScroll: 1,
	        speed: 1000,
	        arrows: true,
	        dots: false,
	        autoplay: false,
	        autoplaySpeed: 3000,
	        pauseOnHover: false,
	        vertical: false,
	        prevArrow: "<button type='button' class='btn btn-info' style='position: absolute;top: 110%;left: 100px;'>이전</button>",
	        nextArrow: "<button type='button' class='btn btn-info' style='position: absolute;top: 110%;right: 100px;'>다음</button>",
	        centerMode: true,
	        draggable: true,
	        focusOnSelect: true,
	        // 슬라이드 변경 전 이벤트 핸들러 등록
	        onBeforeChange: beforeChangeHandler
	    });
	});
	
	// 카드 선택 및 폼 제출 함수
	function selectCardAndSubmit() {
	    // 여기서 카드 선택에 관련된 동작 수행 (예: 폼 제출)
	    document.getElementById('selectCardId').submit(); // 폼 제출
	}
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
        var benefitCard = document.querySelector('body > section:nth-child(5) > .benefit-card > h2');
        
        removeAllEventListeners(beforeContainer);
        removeAllEventListeners(beforeOverlay);

        container.addEventListener('mousemove', function(e) { movingContainer(e, container, overlay) });
        container.addEventListener('mouseout', function(e) { movingOut(e, container, overlay) });
		
        var card = document.querySelector('[data-slick-index="' + nextSlide + '"] .card');
        var title = document.querySelector('.card-title');
        var imgIndex = card.getAttribute('data-img-index');
        var categoryClasses = JSON.parse('${categoryClassJson}');
        
        title.innerText = (parseInt(card.getAttribute('id')) + 1).toString() + " 순위";
        benefitCard.textContent = categoryClasses[card.getAttribute('id')];
        
    }
    $('.slider-for').on('beforeChange', beforeChangeHandler);
    var firstContainer = document.querySelector('.container');
    var firstOverlay = document.querySelector('.overlay');
    firstContainer.addEventListener('mousemove', function(e) { movingContainer(e, firstContainer, firstOverlay) });
    firstContainer.addEventListener('mouseout', function(e) { movingOut(e, firstContainer, firstOverlay) });


</script>

</html>