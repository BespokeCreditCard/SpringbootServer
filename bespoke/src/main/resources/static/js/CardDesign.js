document.getElementById("resetBtn").onclick = function () {
    document.getElementById("card1Div").style.display = "none";
    document.getElementById("card2Div").style.display = "none";
    document.getElementById("card3Div").style.display = "none";
    document.getElementById('select1').value = '';
    document.getElementById('prompt1').value = '';
    document.getElementById('prompt2').value = '';
    document.getElementById('prompt3').value = '';
    document.getElementById('prompt4').value = '';
    document.getElementById('prompt5').value = '';
    document.getElementById('preview').src = selectImageUrl;
    document.getElementById('generatedImg3').src = selectImageUrl;
    document.getElementById('fileInput').value = '';

    document.getElementById("file-edit-button").classList.remove("edited");
    fileDrawn = false;
    isFile = false;
    setDisable(false);

    document.querySelector(".img3-shadow").style.display = "block";
    document.querySelector(".img3-text").style.display = "block";
    document.querySelector(".img3-ic").style.display = "block";
    document.querySelector(".img3-logo").style.display = "block";

    document.getElementById('resultDiv').style.display = "none";
    document.getElementById('generateDiv').style.display = "";// block 인데 ''로 대체
}

async function saveUploadedImg (previewDiv, name) {
	var preview = document.getElementById(previewDiv);
    var previewSrc = preview.src;
    var formData = new FormData();
	try {
		// 이미지 URL에서 Blob 객체를 생성
		response = await fetch(previewSrc, {mode: 'cors'});
		
	    // Blob 객체를 File 객체로 변환
	    let blob = await response.blob();
	    let file = new File([blob], name + ".png", {type: "image/png"});
	    
	    // FormData에 File 객체 추가
	    formData.append('file', file);
	    formData.append('customerName', name);
	    
	    // 서버로 FormData 전송
	    await fetch('/upload/uploadtest', {
	        method: 'POST',
	        body: formData
	    });
	} catch(error) {
	    console.error('### aigenerator - 생성한 이미지 Fetch 실패:', error);
	}
}

const moveToReceiveCardWithUploadedImg = () => {
	const fileInput = document.getElementById('fileInput');
    const file = fileInput.files[0];
    try {
		if (file) {
			fetch('/justGetSeq')
	        .then(response => response.text())
	        .then(async seq => {
	            await saveCanvas("card3Div", seq);
	            window.location.href = contextPath + "/receivecard";
	        })
	        .catch(error => console.error('업로드한 파일 S3 업로드 오류 발생:', error));
		} else {
			fetch('/justGetSeq')
	        .then(response => response.text())
	        .then(async seq => {
	            console.log("test용 - 그냥 넘김");
	            console.log(seq);
	            window.location.href = contextPath + "/receivecard";
	        })			
	        .catch(error => console.error('선택한 카드 S3 업로드 오류 발생:', error));
		}
    } catch(error) {
        console.error(error);
	}
}

// 파일 업로드 하는 함수들 모음 스  크립트
function previewFile() {
    fileDrawn = false;
    document.getElementById("file-edit-button").classList.remove("edited");
    const preview = document.getElementById('preview');
    const preview2 = document.getElementById('generatedImg3');
    const fileInput = document.getElementById('fileInput');
    const file = fileInput.files[0];
    const reader = new FileReader();

    reader.addEventListener('load', function () {
        preview.src = reader.result;
        preview2.src = reader.result;
    }, false);

    if (file) {
        reader.readAsDataURL(file);
    }
}

document.getElementById('fileInput').addEventListener('change', previewFile);

// jsp에서 사용
function showModal() {
	const fileInput = document.getElementById('fileInput');
    const gifModal = document.getElementById('gifModal');
    const imageCanvas = document.getElementById('imageCanvas');
    const modalDefaultImage = document.getElementById('modalDefaultImage');
	const ctx = imageCanvas.getContext('2d');
	
	imageCanvas.style.display = 'block';
    modalDefaultImage.style.display = 'none';
	
    if(fileInput.files[0]) {
		imageCanvas.style.display = 'block';
        modalDefaultImage.style.display = 'none';
    } else {
		let img = new Image();
        img.onload = function() {
            // 캔버스 크기를 이미지 크기에 맞추거나, 적절히 조절할 수 있습니다.
            imageCanvas.width = img.width;
            imageCanvas.height = img.height;
            ctx.drawImage(img, 0, 0, img.width, img.height);
        };
        img.src = modalDefaultImage.src; // 기본 이미지의 src를 사용합니다.
//        alert("파일을 업로드해주세요.");
    }
    new bootstrap.Modal(gifModal).show();
}

function setDisable(isTrue) {
    if(isTrue) {
        document.getElementById("select1").value = '';
        document.getElementById("select1").disabled = true;
        document.getElementById("prompt1").value = '';
        document.getElementById("prompt1").disabled = true;
        document.getElementById("prompt2").value = '';
        document.getElementById("prompt2").disabled = true;
        document.getElementById("prompt3").value = '';
        document.getElementById("prompt3").disabled = true;
        document.getElementById("prompt4").value = '';
        document.getElementById("prompt4").disabled = true;
        document.getElementById("prompt5").value = '';
        document.getElementById("prompt5").disabled = true;

        document.getElementById("nonFileImgButton").disabled = true;
    } else {
        document.getElementById("select1").disabled = false;
        document.getElementById("prompt1").disabled = false;
        document.getElementById("prompt2").disabled = false;
        document.getElementById("prompt3").disabled = false;
        document.getElementById("prompt4").disabled = false;
        document.getElementById("prompt5").disabled = false;
        document.getElementById("nonFileImgButton").disabled = false;
    }
}

// 모달 이미지편집 함수들
let canvas = document.getElementById('imageCanvas');
let ctx = canvas.getContext('2d');
let reader = new FileReader();
let img = new Image();
let mousePressed = false;
let fileDrawn = false;
let lastX, lastY;

document.getElementById('fileInput').addEventListener('change', handleImage, false);

canvas.addEventListener('mousedown', function (e) {
    mousePressed = true;
    let adjustedCoords = getAdjustedCoords(e.pageX, e.pageY);
    draw(adjustedCoords.x, adjustedCoords.y, false);
});

canvas.addEventListener('mousemove', function (e) {
    if (mousePressed) {
        let adjustedCoords = getAdjustedCoords(e.pageX, e.pageY);
        draw(adjustedCoords.x, adjustedCoords.y, true);
    }
});

canvas.addEventListener('mouseup', function () {
    mousePressed = false;
});

canvas.addEventListener('mouseleave', function () {
    mousePressed = false;
});

function getAdjustedCoords(pageX, pageY) {
    // 모달 창의 위치와 크기를 확인하고, 그에 맞게 좌표값을 조정
    let modal = document.getElementById('gifModal'); // 모달의 ID로 변경
    let modalRect = modal.getBoundingClientRect();
    let canvasRect = canvas.getBoundingClientRect();
    let adjustedX = pageX - canvasRect.left + modalRect.left;
    let adjustedY = pageY - canvasRect.top + modalRect.top;
    return { x: adjustedX, y: adjustedY };
}

function draw(x, y, isDown) {
    if(!fileDrawn) {
        let fileEditButton = document.getElementById("file-edit-button");
        fileEditButton.classList.add("edited");
    }
    fileDrawn = true;
    setDisable(false);
    if (isDown) {
        ctx.beginPath();
        ctx.globalCompositeOperation = "destination-out"
        ctx.lineWidth = document.getElementById('brushSize').value;
        ctx.lineJoin = "round";
        ctx.moveTo(lastX, lastY);
        ctx.lineTo(x, y);
        ctx.closePath();
        ctx.stroke();
    }
    lastX = x; lastY = y;
}

function handleImage(e) {
    setDisable(true);
    let reader = new FileReader();
    reader.onload = function (event) {
        img.onload = function () {
            canvas.width = img.width;
            canvas.height = img.height;
            ctx.drawImage(img, 0, 0);
        }
        img.src = event.target.result;
    }
	reader.readAsDataURL(e.target.files[0]);
}

// 로컬에 마스크 이미지 저장
function saveImage() {
    let image = canvas.toDataURL("image/png").replace("image/png", "image/octet-stream");
    let link = document.createElement('a');
    link.download = "mask.png";
    link.href = image;
    link.click();
}

// 스타일 - 화풍
var promptStyle = function (selectObj){
       var selectedIndex = selectObj.selectedIndex;
       var selectedValue = selectObj.options[selectedIndex].value;
       return selectedValue;
   };

// 프롬프트1
var selectedprompt1 = function (selectObj){
       var selectedIndex = selectObj.selectedIndex;
       var selectedValue = selectObj.options[selectedIndex].value;
       return selectedValue;
   };
   
// 프롬프트2
var selectedprompt2 = function (selectObj){
       var selectedIndex = selectObj.selectedIndex;
       var selectedValue = selectObj.options[selectedIndex].value;
       return selectedValue;
   };
   
// 프롬프트3
var selectedprompt3 = function (selectObj){
       var selectedIndex = selectObj.selectedIndex;
       var selectedValue = selectObj.options[selectedIndex].value;
       return selectedValue;
   };
   
// 프롬프트t4
var selectedprompt4 = function (selectObj){
       var selectedIndex = selectObj.selectedIndex;
       var selectedValue = selectObj.options[selectedIndex].value;
       return selectedValue;
   };
   
// 프롬프트5
var selectedprompt5 = function (selectObj){
       var selectedIndex = selectObj.selectedIndex;
       var selectedValue = selectObj.options[selectedIndex].value;
       return selectedValue;
   };

// 변환 버튼
document.getElementById("convertBtn").addEventListener("click", async() => {
	var selectObj = document.getElementById("select1");	
	var selectedStyle = promptStyle(selectObj);
	
	var promptObj1 = document.getElementById("prompt1");	
	var prompt1 = selectedprompt1(promptObj1);
	
	var promptObj2 = document.getElementById("prompt2");	
	var prompt2 = selectedprompt2(promptObj2);
	
	var promptObj3 = document.getElementById("prompt3");	
	var prompt3 = selectedprompt3(promptObj3);
	
	var promptObj4 = document.getElementById("prompt4");	
	var prompt4 = selectedprompt4(promptObj4);
	
	var promptObj5 = document.getElementById("prompt5");	
	var prompt5 = selectedprompt5(promptObj5);
	
    var promptStyleString = selectedStyle + " style";
    var imgStyle;
    
    // photograph이 좀 더 실사에 가까움
   	if (["Expressionism", "Surrealism", "Cubism", "Pop Art", "Abstract Art", "Minimalism", "Baroque", "Sketch", "Animation", "Graffiti"].includes(selectedStyle)) {
   		imgStyle = "image";
   	} else if (["Hyperrealism", "Impressionism", "Renaissance", "Traditional Korean Painting", "Three Kingdoms Period Murals", "Futurism"].includes(selectedStyle)) {
   		imgStyle = "photograph";
   	} else {
   		// 예상치 못한 스타일 값에 대한 처리
   		imgStyle = "image";
   	}    
	
	// 파일 업로드 안하고 프롬프트만 써서 변환 누르면 mode 0
	// 파일 업로드만 해서 변환 누르면 mode 1
	// 파일 업로드 하고 마스크 이미지 만든 후 변환 누르면 mode 2
	var uploadedImg = document.getElementById("fileInput").files[0]
	var maskImg = canvas.toDataURL();
	
	var isFile = uploadedImg ? true : false;
	var mode = fileDrawn ? 2 : isFile ? 1 : 0;
	
	var promptKorean = prompt1 + "를 " + prompt2 + "하는 " + prompt3 + "로 " + prompt4 + "간 " + prompt5;
	var promptIsNull = !prompt1 && !prompt2 && !prompt3 && !prompt4 && !prompt5;
    
    // 마스킹은 했는데 프롬프트 안쓰거나 / 업로드 안했는데 프롬프트 안쓰면 alert
    if((fileDrawn && promptIsNull) || (!isFile && promptIsNull) ) {
		alert("생성 프롬프트 텍스트를 입력해주세요. \n이미지를 업로드하시고 초기화하셨다면 새로고침해주세요.");
		return;
	}
	
	// 모달 표시
 	document.getElementById("loadingDiv").style.zIndex = "1";
 	document.getElementById("card1Div").style.display = "none";
   	document.getElementById("card2Div").style.display = "none";
    document.getElementById("card3Div").style.display = "none";
    
    document.getElementById("arrowCard").style.display = "block";
    document.getElementById('resultDiv').style.display = "";// block 인데 ''로 대체
    document.getElementById('generateDiv').style.display = "none";
    
    // 로딩 gif 확인을 위한 test용 timeout
    function delay(ms) {
	  return new Promise(resolve => setTimeout(resolve, ms));
	}
	
	async function waitAndRun(ms) {
		await delay(ms);
		console.log(ms);
		console.log('1초가 지났습니다!');
	}
	
	// DeepL 번역 API
	try {
	    let response = await fetch("http://15.165.82.28:5000/translate", {
	        method: "POST",
	        headers: {
	            "Content-Type": "application/json"
	        },
	        body: JSON.stringify({promptKorean: promptKorean})
	    });
	
	    if (response.status != 200) {
	        let errorResult = await response.json();
	        throw new Error(errorResult.message || "번역 실패");
	    }
		
	    let result = await response.json();
	    var translatedPrompt = result?.translatedPrompt;
	} catch (error) {
        console.error("오류 발생:", error);
    }

    
    var prompt;
	if (mode == 2){
	    prompt =  translatedPrompt;	
	} else {
	    prompt =  "A " + promptStyleString + ", " + promptStyleString + ", " + promptStyleString + " " + imgStyle + " of " + translatedPrompt;		
	}    
    
	// 하나의 json으로 보내기 위한 FormData 객체
	var formData = new FormData();
	formData.append('prompt', prompt);
	formData.append('mode', mode);
	formData.append('input_img', uploadedImg);
	if (fileDrawn) {
	    formData.append('mask_img', maskImg);
	}

 	try {
	    let response = await fetch("http://15.165.82.28:5000/generate_img", {
	            method: "POST",
	            body: formData
	        });
	    
	    let result = await response.json();
	    
	    if(response.status != 200) {
			 throw new Error(result.message || "이미지 생성 요청 실패");
		}

	    var b64ImageData1 = result?.b64_img1;
	    var b64ImageData2 = result?.b64_img2;
	    	    
		// 카드 이미지 표시
	    var card1 = document.getElementById("generatedImg1");
	    var card2 = document.getElementById("generatedImg2");

		// 이미지 두 장 다 로드 된 후 저장 실행
	    function loadImagePromise(imageElement, imageData) {
		    return new Promise((resolve, reject) => {
		        imageElement.onload = () => {
		            resolve(`${imageElement.id} 로드 성공`);
		        };
		        imageElement.onerror = () => {
		            reject(`${imageElement.id} 로드 실패`);
		        };
		        imageElement.src = "data:image/png;base64," + imageData;
		    });
		}
		// 1초 동안 로딩 창을 보여주고, 그 후 이미지 로드 시작
		waitAndRun(1000).then(() => {
		    // 두 이미지가 모두 로드될 때까지 기다림
		    Promise.all([
		        loadImagePromise(card1, b64ImageData1),
		        loadImagePromise(card2, b64ImageData2)
		    ]).then(() => {
		        // 생성한 이미지 표지
				document.getElementById("loadingDiv").style.zIndex = "-1";
			    document.getElementById("card1Div").style.display = "block";
			    document.getElementById("card2Div").style.display = "block";
                document.getElementById("card3Div").style.display = "block";

                if(!isFile && !promptIsNull) {
                    document.querySelector(".img3-shadow").style.display = "none";
                    document.querySelector(".img3-text").style.display = "none";
                    document.querySelector(".img3-ic").style.display = "none";
                    document.querySelector(".img3-logo").style.display = "none";
                }
		    });
		});
		
    } catch(error) {
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
	}
	
});

document.querySelector("#selectGeneratedImg1").onclick = async function() {
	try {
		fetch('/justGetSeq')
        .then(response => response.text())
        .then(async seq => {
            // 받아온 SEQ 값을 saveCanvas 함수에 인자로 넘겨줌
            await saveCanvas("card1", seq);
            window.location.href = contextPath + "/receivecard";
        })
        .catch(error => console.error('Error fetching SEQ:', error));
    } catch(error) {
        console.error(error);
	}
};

document.querySelector("#selectGeneratedImg2").onclick = async function() {
	try {
		fetch('/justGetSeq')
        .then(response => response.text())
        .then(async seq => {
            await saveCanvas("card2", seq);
			window.location.href = contextPath + "/receivecard";
        })
        .catch(error => console.error('Error fetching SEQ:', error));
    } catch(error) {
        console.error(error);
	}
};

// 이미지 서버로 전송
async function saveCanvas (generatedCard, name) {
    var selectedDiv = document.getElementById(generatedCard);
    selectedDiv.style.opacity = "1";
    let canvas = await html2canvas(selectedDiv, {useCORS: true});
    
    canvas.toBlob(async function(blob) {
        var formData = new FormData();
        formData.append('file', blob, name + ".png");
        formData.append('customerName', name);
        
        try {
	        await fetch('/upload/uploadtest', {
	            method: 'POST',
	            body: formData
	        });
        } catch(error) {
            console.error('### aigenerator - 생성한 이미지 Fetch 실패:', error);			
		}
    });
}

