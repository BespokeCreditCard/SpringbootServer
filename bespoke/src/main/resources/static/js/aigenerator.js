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
   
//document.getElementById("generateButton").addEventListener("click", function() {
//	
//	var selectObj = document.getElementById("select1");
//	var selectedStyle = promptStyle(selectObj);
//    var promptStyleString = selectedStyle + " style";
//    
//    // 사막에 살고있는
//	var promptDoing = document.getElementById("promptDoing").value;
//    // 펭귄이
//	var promptWho = document.getElementById("promptWho").value;
//    // 북극에서
//	var promptWhere = document.getElementById("promptWhere").value;
//    // 은하수를
//	var promptWhat = document.getElementById("promptWhat").value;
//    // 본다
//	var promptHow = document.getElementById("promptHow").value;
//    
//    var promptRaw =  "A " + promptStyleString + ", " + promptStyleString + ", " + promptStyleString + " image of " + promptDoing + " " + promptWho + " " + promptWhere + " " + promptWhat + " " + promptHow;
//    
//    console.log(promptRaw);
//    console.log("raw 프롬프트");
//    
// 	// imageContainer 변수를 초기화
//    var imageContainer1 = document.getElementById("imageContainer1");
//    var imageContainer2 = document.getElementById("imageContainer2");
// 	
//    fetch("/image", {
//        method: "POST",
//        headers: {
//            "Content-Type": "application/json"
//        },
//        body: JSON.stringify({ promptRaw: promptRaw })
//    })
//    .then(response => {
//        if (response.ok) {
//			
//            return response.json();
//        }
//     	// HTTP 상태 코드가 성공 범위에 포함되지 않는 경우
//        return response.json().then(error => {
//            throw new Error(error.message || "이미지 생성 요청 실패");
//        });
//    })
//    .then(data => {
//     	// 받아온 JSP 코드에서 이미지 img 태그 부분만 추출하여 화면에 표시
////        var [, imageContainerContent1] = data.match(/<div id="imageContainer1".*?>([\s\S]*?)<\/div>/);
////        var [, imageContainerContent2] = data.match(/<div id="imageContainer2".*?>([\s\S]*?)<\/div>/);
//        var imageContainerContent1 = data?.b64ImageData1;
//        var imageContainerContent2 = data?.b64ImageData2;
//     	console.log("imageContainerContent 출력")
//     	
//     	// 이미지 확인용이라 이제 여긴 필요 없을 듯
//        imageContainer1.innerHTML = imageContainerContent1;
//        imageContainer1.style.display = "none";
//        imageContainer2.innerHTML = imageContainerContent2;
//        imageContainer2.style.display = "none";
//        
//        // 이미지 두 장 다 로드 된 후 저장 실행
//        function loadImagePromise(imageElement, imageData) {
//		    return new Promise((resolve, reject) => {
//		        imageElement.onload = () => {
//		            console.log(`${imageElement.id} 로드 완료`);
//		            resolve(`${imageElement.id} 로드 성공`);
//		        };
//		        imageElement.onerror = () => {
//		            console.log(`${imageElement.id} 로드 실패`);
//		            reject(`${imageElement.id} 로드 실패`);
//		        };
//		        imageElement.src = "data:image/png;base64," + imageData;
//		    });
//		}
//		let a = imageContainerContent1.match(/data:image\/png;base64,([^"]+)/);
//        debugger;
//        // 이미지 태그에서 base64 이미지 데이터 추출
//        var b64ImageData1 = imageContainerContent1.match(/data:image\/png;base64,([^"]+)/)[1];
//        var b64ImageData2 = imageContainerContent2.match(/data:image\/png;base64,([^"]+)/)[1];
//        
//        // 카드 이미지 표시
//        var baseImage1 = document.getElementById("baseImage1");
//        var baseImage2 = document.getElementById("baseImage2");
//        
//        baseImage1.style.opacity = "1";
//        baseImage2.style.opacity = "1";
//        
//        console.log("생성한 이미지 로드 완료");
//		
//        // 두 이미지가 모두 로드될 때까지 기다림
//        return Promise.all([
//		    loadImagePromise(baseImage1, b64ImageData1),
//		    loadImagePromise(baseImage2, b64ImageData2)
//		]);
//    })
//    .then(() => {
//        console.log("모든 이미지 로드 완료");
//        // 이미지가 모두 로드된 후에 진행할 작업들을 여기에 작성합니다.
//        console.log("div 선택");
//        // div 통째로 선택
//        var generatedCard1 = document.getElementById("generatedCard1");
//        var generatedCard2 = document.getElementById("generatedCard2");
//        generatedCard1.style.opacity = "1";
//        generatedCard2.style.opacity = "1";
//        
//        console.log("div 선택 완료");
//        
//        // 캔버스를 이미지로 변환하고 저장하는 함수
//        function saveCanvasAsImage(canvas, fileName) {
//            var image = canvas.toDataURL("image/png").replace("image/png", "image/octet-stream");
//            // 이미지 다운로드를 위한 a 태그 생성
//            var link = document.createElement("a");
//            link.download = fileName;
//            link.href = image;
//            document.body.appendChild(link);
//            link.click();
//            document.body.removeChild(link);
//            console.log(fileName + " 저장 완료");
//        }
//                                                     
//    	// html2canvas를 각각 호출하고, 모든 작업이 완료될 때까지 기다림
//        Promise.all([
//            html2canvas(generatedCard1, {useCORS: true}),
//            html2canvas(generatedCard2, {useCORS: true})
//        ]).then(canvases => {
//            // canvases 배열에는 각각의 캔버스 객체가 들어있음
//            var canvas1 = canvases[0];
//            var canvas2 = canvases[1];
//            
//            saveImage1 = document.getElementById("saveImage1");
//            saveImage2 = document.getElementById("saveImage2");
//           	saveImage1.style.opacity = "1";
//           	saveImage2.style.opacity = "1";
//            
//         	// 이미지 저장 버튼 이벤트 리스너 설정
//            saveImage1.addEventListener("click", function() {
//                saveCanvasAsImage(canvas1, "generatedCard1.png");
//            });
//
//            saveImage2.addEventListener("click", function() {
//                saveCanvasAsImage(canvas2, "generatedCard2.png");
//            });
//        }).catch(error => {
//            console.error("오류 발생:", error);
//        });
//	})
//    .catch(error => {
//        var errorMessageContainer = document.getElementById("errorMessageContainer");
//     	
//        // error.message가 정의되어 있는지 먼저 확인
//        var errorMessage = error.message || "알 수 없는 오류가 발생했습니다.";
//     
//        // 에러 메시지가 특정 조건을 충족하는 경우, 사용자에게 경고 메시지 표시
//        if (error instanceof TypeError || error.message.includes("safety system") || error.message.includes("not allowed")) {
//            errorMessageContainer.innerHTML = "저작권 저촉으로 인한 오류가 발생했습니다. 프롬프트를 조정해주세요.";
//        } else {
//            errorMessageContainer.innerHTML = "오류 발생: " + errorMessage;
//        }
//        
//        errorMessageContainer.style.opacity = "1";
//        console.error("오류 발생:", error);
//    });
//});

// 내가 하는 방식(async await 이용)
document.getElementById("generateButton").addEventListener("click", async() => {
	
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
	
	// 프롬프트 예외처리 필요(돈나가니깐)
    if(!promptDoing && !promptWho && !promptWhere && !promptWhat && !promptHow) {
		alert("생성 프롬프트 텍스트를 입력해주세요");
		return;
	}
    
    var promptRaw =  "A " + promptStyleString + ", " + promptStyleString + ", " + promptStyleString + " image of " + promptDoing + " " + promptWho + " " + promptWhere + " " + promptWhat + " " + promptHow;
    
    console.log(promptRaw);
    console.log("raw 프롬프트");
    
 	// imageContainer 변수를 초기화
    var imageContainer1 = document.getElementById("imageContainer1");
    var imageContainer2 = document.getElementById("imageContainer2");

 	try {
		 
	    let response = await fetch("/image", {
	        method: "POST",
	        headers: {
	            "Content-Type": "application/json"
	        },
	        body: JSON.stringify({ promptRaw: promptRaw })
	    });
	    
	    let result = await response.json();
	    
	    if(response.status != 200) {
			 throw new Error(result.message || "이미지 생성 요청 실패");
		}
		
		var imageContainerContent1 = result?.b64ImageData1;
	    var imageContainerContent2 = result?.b64ImageData2;
	 	console.log("imageContainerContent 출력");
	    
	    // 이미지 태그에서 base64 이미지 데이터 추출
	    var b64ImageData1 = imageContainerContent1.match(/data:image\/png;base64,([^"]+)/)[1];
	    var b64ImageData2 = imageContainerContent2.match(/data:image\/png;base64,([^"]+)/)[1];
	    
	    // 카드 이미지 표시
	    var baseImage1 = document.getElementById("baseImage1");
	    var baseImage2 = document.getElementById("baseImage2");
	    
	    baseImage1.style.opacity = "1";
	    baseImage2.style.opacity = "1";
	    
	    console.log("생성한 이미지 로드 완료");
		
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
		
	    // 두 이미지가 모두 로드될 때까지 기다림
	    Promise.all([
		    loadImagePromise(baseImage1, b64ImageData1),
		    loadImagePromise(baseImage2, b64ImageData2)
		]);    
		
		console.log("모든 이미지 로드 완료");
        // 이미지가 모두 로드된 후에 진행할 작업들을 여기에 작성합니다.
        console.log("div 선택");
		
		// 다른 기능의 함수라서 함수 나눠야 할것 같은데 일단 기존대로 여기 넣음(파일 이미지 저장기능), 중복제거, 이름 설정 가능하도록 변경)
		// 매개변수 ->      (div 이름,  saveImage div 숫자, 파일저장이름)
		await saveCanvas("generatedCard1", 1, "generatedCard1");
		await saveCanvas("generatedCard2", 2, "generatedCard2");
		
    } catch(error) {
		var errorMessageContainer = document.getElementById("errorMessageContainer");
     	
        // error.message가 정의되어 있는지 먼저 확인
        var errorMessage = error.message || "알 수 없는 오류가 발생했습니다.";
     
        // 에러 메시지가 특정 조건을 충족하는 경우, 사용자에게 경고 메시지 표시
        // TypeError에는 null 등 다른 오류도 있기때문에 저작권 오류라고 말하기엔 다른 것 같음
        if (error instanceof TypeError || error.message.includes("safety system") || error.message.includes("not allowed")) {
            errorMessageContainer.innerHTML = "저작권 저촉으로 인한 오류가 발생했습니다. 프롬프트를 조정해주세요.";
        } else {
            errorMessageContainer.innerHTML = "오류 발생: " + errorMessage;
        }
        
        errorMessageContainer.style.opacity = "1";
        console.error("오류 발생:", error);
	}
	
});

// 이미지 파일 저장 함수
async function saveCanvas (generatedCard, number, name) {
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
    
    // div 통째로 선택
    var selectedDiv = document.getElementById(generatedCard);
    selectedDiv.style.opacity = "1";
                                                 
	// html2canvas를 각각 호출하고, 모든 작업이 완료될 때까지 기다림
    let canvas = await html2canvas(selectedDiv, {useCORS: true});
    
    saveImage = document.getElementById(`saveImage${number}`);
   	saveImage.style.opacity = "1";
    
 	// 이미지 저장 버튼 이벤트 리스너 설정
    saveImage.addEventListener("click", function() {
        saveCanvasAsImage(canvas, name + ".png");
    });

}