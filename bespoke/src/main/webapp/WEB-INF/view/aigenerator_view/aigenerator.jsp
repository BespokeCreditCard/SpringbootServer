<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri ="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>AI 이미지 생성</title>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/html2canvas/1.3.2/html2canvas.min.js"></script>
    <link rel="stylesheet" type="text/css" href="/css/aigenerator.css">
</head>
<body>
	<h1>AiImage 요청 보내기</h1>
    
    <select id="select1" onchange="promptStyle(this);">
            <option value="Hyperrealism">극사실주의</option>
            <option value="Surrealism">초현실주의</option>
            <option value="Animation">애니메이션</option>
            <option value="Futurism">미래주의</option>
            <option value="Pop Art">팝 아트</option>
            <option value="Minimalism">미니멀리즘</option>
            <option value="Impressionism">인상주의</option>
            <option value="Expressionism">표현주의</option>
            <option value="Cubism">입체주의</option>
            <option value="Abstract Art">추상주의</option>
            <option value="Renaissance">르네상스</option>
            <option value="Baroque">바로크</option>
            <option value="Traditional Korean Painting">전통 한국화</option>
            <option value="Sketch">스케치</option>
            <option value="Graffiti">그라피티</option>
            <option value="Three Kingdoms Period Murals">삼국시대 벽화</option>
    </select>
    
    <textarea id="promptDoing" placeholder="~~ 하고있는" rows="2" cols="10"></textarea>
    <textarea id="promptWho" placeholder="~~ 이/가" rows="2" cols="10"></textarea>
    <textarea id="promptWhere" placeholder="~~ 에서" rows="2" cols="10"></textarea>
    <textarea id="promptWhat" placeholder="~~ 를" rows="2" cols="10"></textarea>
    <textarea id="promptHow" placeholder="~~ 한다" rows="2" cols="10"></textarea>

    <button id="generateButton">이미지 생성 요청 보내기</button>
    
    <!-- 저작권 에러 메세지 -->
    <div id="errorMessageContainer"></div>
    
    <div id="imageContainer1" style="opacity: 0;">
    <img class="generatedImage1" src="data:image/png;base64, ${b64ImageData1}" alt="AI Image"/>
    </div>

    <div id="imageContainer2" style="opacity: 0;">
    <img class="generatedImage2" src="data:image/png;base64, ${b64ImageData2}" alt="AI Image2"/>
    </div>
	
    <div id="generatedCard1" style="opacity: 0; width: 386px; height: 600px; position: relative; border-radius: 5%; overflow: hidden;">
	    <!-- 위쪽 20%를 차지하는 네모 박스 -->
	    <div style="position: absolute; top: 0; left: 0; width: 100%; height: 30%; background-color: black; opacity: 0.45; z-index: 3;"></div>
		<!-- 로컬 폰트를 적용할 div -->
	    <div id="woori_text">Woori Card</div>
	    <!-- 이미지들 -->
	    <img id="baseImage1" src="${pageContext.request.contextPath}/imgs/1235.png" style="height: 100%; width: 100%; position: relative; top: 0px; left: 0; z-index: 1;" />
	    <img id="icImage" src="${pageContext.request.contextPath}/imgs/12345.jpg" style="transform: rotate(90deg); height: 10%; position: absolute; top: 10%; left: 45%; z-index: 3;" />
	   	<img id="masterCardLogo" src="${pageContext.request.contextPath}/imgs/master.png" style="height: 25%; position: absolute; top: 77%; left: 60%; z-index: 3;" />
	</div>
    <button id="saveImage1" style="opacity: 0; z-index: 3;">선택</button>
	
	<div id="generatedCard2" style="opacity: 0; width: 386px; height: 600px; position: relative; border-radius: 5%; overflow: hidden;">
	    <!-- 위쪽 20%를 차지하는 네모 박스 -->
	    <div style="position: absolute; top: 0; left: 0; width: 100%; height: 30%; background-color: black; opacity: 0.45; z-index: 3;"></div>
		<!-- 로컬 폰트를 적용할 div -->
	    <div id="woori_text">Woori Card</div>
	    <!-- 이미지들 -->
	    <img id="baseImage2" src="${pageContext.request.contextPath}/imgs/1235.png" style="height: 100%; width: 100%; position: relative; top: 0px; left: 0; z-index: 1;" />
	    <img id="icImage" src="${pageContext.request.contextPath}/imgs/12345.jpg" style="transform: rotate(90deg); height: 10%; position: absolute; top: 10%; left: 45%; z-index: 3;" />
	   	<img id="masterCardLogo" src="${pageContext.request.contextPath}/imgs/master.png" style="height: 25%; position: absolute; top: 77%; left: 60%; z-index: 3;" />
	</div>
    <button id="saveImage2" style="opacity: 0; z-index: 3;">선택</button>
    
	<script src="/js/aigenerator.js"></script>
</body>
</html>

