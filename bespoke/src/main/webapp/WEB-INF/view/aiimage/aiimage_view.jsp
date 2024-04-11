<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri ="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>AI 이미지 생성</title>
    <style>
        /* 로컬 폰트 추가 */
        @font-face {
            font-family: "Nanum Gothic";
            src: url("/fonts/WooridaumR.ttf") format("truetype");
        }
        
        /* woori_text div에 폰트 적용 */
        #woori_text {
            font-family: "Nanum Gothic", sans-serif;
            font-weight: bold; /* 굵게 설정 */
            font-style: italic; /* 기울임 설정 */
            font-size: 20px;
            color: white;
            background: none; 
            position: absolute; 
            top: 3%; 
            left: 6%; 
            z-index: 3;
        }
        
        /* 저작권 저촉 에러 메세지 */
	    #errorMessageContainer {
	        color: red; /* 글씨색 */
	        font-weight: bold; /* 글씨체 굵게 */
	        margin: 20px 0; /* 상하 여백 추가 */
            z-index: 3;
            opacity: 0;
	    }
	        
    </style>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/html2canvas/1.3.2/html2canvas.min.js"></script>
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
	
	
    <script>
       	// 스타일 - 화풍
       	var promptStyle = function (selectObj){
               // 우선 selectbox에서 선택된 index를 찾고 
               var selectedIndex = selectObj.selectedIndex;
               // 선택된 index의 value를 찾고 
               var selectedValue = selectObj.options[selectedIndex].value;
               // 원하는 동작을 수행한다. 여기서는 그냥 alert해주는 식으로만 처리함. 
               console.log(selectedValue);
               return selectedValue;
           };
           
        document.getElementById("generateButton").addEventListener("click", function() {
        	
        	var selectObj = document.getElementById("select1");
        	var selectedStyle = promptStyle(selectObj);
            var promptStyleString = selectedStyle + " style";
            
            // 사막에 살고있는
        	var promptDoing = document.getElementById("promptDoing").value;
            // 펭귄이
        	var promptWho = document.getElementById("promptWho").value;
            // 북극에서
        	var promptWhere = document.getElementById("promptWhere").value;
            // 은하수를
        	var promptWhat = document.getElementById("promptWhat").value;
            // 본다
        	var promptHow = document.getElementById("promptHow").value;
            
            var promptRaw =  "A " + promptStyleString + ", " + promptStyleString + ", " + promptStyleString + " image of " + promptDoing + " " + promptWho + " " + promptWhere + " " + promptWhat + " " + promptHow;
            
            console.log(promptRaw);
            console.log("raw 프롬프트");
            
         	// imageContainer 변수를 초기화
            var imageContainer1 = document.getElementById("imageContainer1");
            var imageContainer2 = document.getElementById("imageContainer2");
         	
            fetch("/image", {
                method: "POST",
                headers: {
                    "Content-Type": "application/json"
                },
                body: JSON.stringify({ promptRaw: promptRaw })
            })
            .then(response => {
                if (response.ok) {
                    return response.text();
                }
             	// HTTP 상태 코드가 성공 범위에 포함되지 않는 경우
                return response.json().then(error => {
                    throw new Error(error.message || "이미지 생성 요청 실패");
                });
            })
            .then(data => {
             	// 받아온 JSP 코드에서 이미지 img 태그 부분만 추출하여 화면에 표시
	            var [, imageContainerContent1] = data.match(/<div id="imageContainer1".*?>([\s\S]*?)<\/div>/);
	            var [, imageContainerContent2] = data.match(/<div id="imageContainer2".*?>([\s\S]*?)<\/div>/);
             	console.log("imageContainerContent 출력")
             	
             	// 이미지 확인용이라 이제 여긴 필요 없을 듯
	            imageContainer1.innerHTML = imageContainerContent1;
	            imageContainer1.style.display = "none";
	            imageContainer2.innerHTML = imageContainerContent2;
	            imageContainer2.style.display = "none";
	            
	            // 이미지 두 장 다 로드 된 후 저장 실행
	            function loadImagePromise(imageElement, imageData) {
				    return new Promise((resolve, reject) => {
				        imageElement.onload = () => {
				            console.log(`${imageElement.id} 로드 완료`);
				            resolve(`${imageElement.id} 로드 성공`);
				        };
				        imageElement.onerror = () => {
				            console.log(`${imageElement.id} 로드 실패`);
				            reject(`${imageElement.id} 로드 실패`);
				        };
				        imageElement.src = "data:image/png;base64," + imageData;
				    });
				}
	            
	            // 이미지 태그에서 base64 이미지 데이터 추출
	            var b64ImageData1 = imageContainerContent1.match(/data:image\/png;base64,([^"]+)/)[1];
	            var b64ImageData2 = imageContainerContent2.match(/data:image\/png;base64,([^"]+)/)[1];
	            
	            // 카드 이미지 표시
	            var baseImage1 = document.getElementById("baseImage1");
	            var baseImage2 = document.getElementById("baseImage2");
	            
	            baseImage1.style.opacity = "1";
	            baseImage2.style.opacity = "1";
	            
	            console.log("생성한 이미지 로드 완료");
				
	            // 두 이미지가 모두 로드될 때까지 기다림
	            return Promise.all([
				    loadImagePromise(baseImage1, b64ImageData1),
				    loadImagePromise(baseImage2, b64ImageData2)
				]);
            })
            .then(() => {
                console.log("모든 이미지 로드 완료");
                // 이미지가 모두 로드된 후에 진행할 작업들을 여기에 작성합니다.
                console.log("div 선택");
                // div 통째로 선택
                var generatedCard1 = document.getElementById("generatedCard1");
                var generatedCard2 = document.getElementById("generatedCard2");
                generatedCard1.style.opacity = "1";
                generatedCard2.style.opacity = "1";
                
                console.log("div 선택 완료");
                
	            // 캔버스를 이미지로 변환하고 저장하는 함수
                function saveCanvasAsImage(canvas, fileName) {
                    var image = canvas.toDataURL("image/png").replace("image/png", "image/octet-stream");
                    // 이미지 다운로드를 위한 a 태그 생성
                    var link = document.createElement("a");
                    link.download = fileName;
                    link.href = image;
                    document.body.appendChild(link);
                    link.click();
                    document.body.removeChild(link);
                    console.log(fileName + " 저장 완료");
                }
	                                                         
            	// html2canvas를 각각 호출하고, 모든 작업이 완료될 때까지 기다림
                Promise.all([
                    html2canvas(generatedCard1, {useCORS: true}),
                    html2canvas(generatedCard2, {useCORS: true})
                ]).then(canvases => {
                    // canvases 배열에는 각각의 캔버스 객체가 들어있음
                    var canvas1 = canvases[0];
                    var canvas2 = canvases[1];
                    
                    saveImage1 = document.getElementById("saveImage1");
                    saveImage2 = document.getElementById("saveImage2");
                   	saveImage1.style.opacity = "1";
                   	saveImage2.style.opacity = "1";
                    
                 	// 이미지 저장 버튼 이벤트 리스너 설정
                    saveImage1.addEventListener("click", function() {
                        saveCanvasAsImage(canvas1, "generatedCard1.png");
                    });

                    saveImage2.addEventListener("click", function() {
                        saveCanvasAsImage(canvas2, "generatedCard2.png");
                    });
                }).catch(error => {
                    console.error("오류 발생:", error);
                });
			})
            .catch(error => {
                var errorMessageContainer = document.getElementById("errorMessageContainer");
             	
                // error.message가 정의되어 있는지 먼저 확인
                var errorMessage = error.message || "알 수 없는 오류가 발생했습니다.";
             
                // 에러 메시지가 특정 조건을 충족하는 경우, 사용자에게 경고 메시지 표시
                if (error instanceof TypeError || error.message.includes("safety system") || error.message.includes("not allowed")) {
                    errorMessageContainer.innerHTML = "저작권 저촉으로 인한 오류가 발생했습니다. 프롬프트를 조정해주세요.";
                } else {
                    errorMessageContainer.innerHTML = "오류 발생: " + errorMessage;
                }
                
                errorMessageContainer.style.opacity = "1";
                console.error("오류 발생:", error);
            });
        });
    </script>
    

</body>
</html>

