document.getElementById("resetBtn").onclick = function () {
    document.getElementById("card1").style.display = "none";
    document.getElementById("card2").style.display = "none";
    document.getElementById('select1').value = '';
    document.getElementById('promptDoing').value = '';
    document.getElementById('promptWho').value = '';
    document.getElementById('promptWhere').value = '';
    document.getElementById('promptWhat').value = '';
    document.getElementById('promptHow').value = '';

    document.getElementById('fileInput').value = '';
    document.getElementById('preview').src = '/imgs/1235.png';
    document.getElementById("file-edit-button").classList.remove("edited");
    fileDrawn = false;
}

// 모달 표시 함수
function showGIFModal (gifSrc) {
    // var gifModal = new bootstrap.Modal(document.getElementById('gifModal'));
    var gifImage = document.getElementById('gifImage2');
    gifImage.src = gifSrc;
    // gifModal.show();
    document.getElementById("loadingDiv").style.zIndex = "4";

//    // 백엔드로 전달
//    uploadFile();
//    // 백엔드에서 답을 받으면 닫히는 함수를 넣어야함
//    setTimeout(function() {
//        // gifModal.hide();
//        document.getElementById("loadingDiv").style.zIndex = "-1";
//        document.getElementById("card1").style.display = "block";
//        document.getElementById("card2").style.display = "block";
//    }, 1000);

    // 모달이 닫힐 때의 이벤트 리스너 추가
    // gifModal._element.addEventListener('hidden.bs.modal', function () {
    //     // 선택1과 선택2에 해당하는 컨테이너 표시
    //     document.getElementById("card1").style.display = "block";
    //     document.getElementById("card2").style.display = "block";
    // });
}





const moveToReceiveCardWithUploadedImg = () => {
    let files = document.getElementById("fileInput").files[0];
    if(files) {
        let formData = new FormData();
        formData.append("files", files);
        fetch("/receivecard", {
            method: "POST",
            headers: {
            },
            body: formData
        }).then((response) => {
            if(response.status === 200) {
                window.location.href="/receivecard";
            }
        })
    } else {
        alert("파일을 업로드해주세오");
        return;
    }
}

// 파일 업로드 하는 함수들 모음 스크립트
function previewFile() {
    fileDrawn = false;
    document.getElementById("file-edit-button").classList.remove("edited");
    const preview = document.getElementById('preview');
    const fileInput = document.getElementById('fileInput');
    const file = fileInput.files[0];
    const reader = new FileReader();


    reader.addEventListener('load', function () {
        preview.src = reader.result;
    }, false);

    if (file) {
        reader.readAsDataURL(file);
    }
}

function uploadFile() {
    const fileInput = document.getElementById('fileInput');
    const file = fileInput.files[0];

    if (file) {
        //파일이 있다면 실행될 함수
        console.log('Selected file:', file);
    } else {
        // 파일이 없다면 실행될 함수
        console.log('No file selected');
    }
}

document.getElementById('fileInput').addEventListener('change', previewFile);

function showModal() {
    if(document.getElementById('fileInput').files[0]) {
        new bootstrap.Modal(document.getElementById('gifModal')).show();
    } else {
        alert("파일을 업로드해주세요.");
    }
}

function setDisable(isTrue) {
    if(isTrue) {
        document.getElementById("select1").value = '';
        document.getElementById("select1").disabled = true;
        document.getElementById("promptDoing").value = '';
        document.getElementById("promptDoing").disabled = true;
        document.getElementById("promptWho").value = '';
        document.getElementById("promptWho").disabled = true;
        document.getElementById("promptWhere").value = '';
        document.getElementById("promptWhere").disabled = true;
        document.getElementById("promptWhat").value = '';
        document.getElementById("promptWhat").disabled = true;
        document.getElementById("promptHow").value = '';
        document.getElementById("promptHow").disabled = true;
    } else {
        document.getElementById("select1").disabled = false;
        document.getElementById("promptDoing").disabled = false;
        document.getElementById("promptWho").disabled = false;
        document.getElementById("promptWhere").disabled = false;
        document.getElementById("promptWhat").disabled = false;
        document.getElementById("promptHow").disabled = false;
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

canvas.addEventListener('mouseup', function (e) {
    mousePressed = false;
});

canvas.addEventListener('mouseleave', function (e) {
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
   
document.getElementById("convertBtn").addEventListener("click", async() => {

	var selectObj = document.getElementById("select1");	
	var selectedStyle = promptStyle(selectObj);
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
	
	// 파일 업로드 안하고 프롬프트만 써서 변환 누르면 mode 0
	// 파일 업로드만 해서 변환 누르면 mode 1
	// 파일 업로드 하고 마스크 이미지 만든 후 변환 누르면 mode 2
	var uploadedImg = document.getElementById("fileInput").files[0]
	var maskImg = canvas.toDataURL();
	
	var isFile = uploadedImg ? true : false;
	var mode = fileDrawn ? 2 : isFile ? 1 : 0;
	var promptKorean = promptDoing + " " + promptWho + " " + promptWhere + " " + promptWhat + " " + promptHow;
	
	var promptIsNull = !promptDoing && !promptWho && !promptWhere && !promptWhat && !promptHow;
    
    // 마스킹은 했는데 프롬프트 안쓰거나 / 업로드 안했는데 프롬프트 안쓰면 alert 함
    if((fileDrawn && promptIsNull) || (!isFile && promptIsNull) ) {
		alert("생성 프롬프트 텍스트를 입력해주세요");
		return;
	}
    
    // DeepL 번역 API
	try {
	    let response = await fetch("http://127.0.0.1:5000/translate", {
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


    console.log("##############################################");
	console.log("번역된 텍스트:", translatedPrompt);
    console.log("##############################################");
    
    var prompt;
	if (mode == 2){
	    prompt =  translatedPrompt;	
	} else {
	    prompt =  "A " + promptStyleString + ", " + promptStyleString + ", " + promptStyleString + " " + imgStyle + " of " + translatedPrompt;		
	}
    
    console.log(prompt);
    console.log("raw 프롬프트");
    
	// 하나의 json으로 보내기 위한 FormData 객체
	var formData = new FormData();
	formData.append('prompt', prompt);
	formData.append('mode', mode);
	formData.append('input_img', uploadedImg);
	if (fileDrawn) {
	    formData.append('mask_img', maskImg);
	}
    
//    debugger
    
 	try {
	    let response = await fetch("http://127.0.0.1:5000/generate_img", {
	            method: "POST",
	            body: formData
	        });
	    
	    let result = await response.json();
	    
	    if(response.status != 200) {
			 throw new Error(result.message || "이미지 생성 요청 실패");
		}
		console.log(result);
		console.log("@@@");

	    var b64ImageData1 = result?.b64_img1;
	    var b64ImageData2 = result?.b64_img2;
		
	    // 카드 이미지 표시
	    var card1 = document.getElementById("generatedImg1");
	    var card2 = document.getElementById("generatedImg2");
	    
	    
	    document.getElementById("arrowCard").style.display = "block";
	    document.getElementById("prevBtnDiv").style.display = "block";
	    document.getElementById("nextBtnDiv").style.display = "block";
	
	    // 모달 표시
	    var gifSrc = "/img/loading.gif"; // 로딩 GIF 이미지 경로
	    showGIFModal(gifSrc);
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
		    loadImagePromise(card1, b64ImageData1),
		    loadImagePromise(card2, b64ImageData2)
		]);    
		
		console.log("모든 이미지 로드 완료");
        // 이미지가 모두 로드된 후에 진행
        console.log("div 선택");
        
		document.getElementById("loadingDiv").style.zIndex = "-1";
        document.getElementById("card1Div").style.display = "block";
        document.getElementById("card2Div").style.display = "block";
		
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

document.querySelector("#selectGeneratedImg1").onclick = async function() {
	try {
			fetch('/justGetSeq')
	        .then(response => response.text())
	        .then(seq => {
	            // 받아온 SEQ 값을 saveCanvas 함수에 인자로 넘겨줌
				console.log("### aigenerator - 선택 누르면 seq 받아오기 화이팅!!");
				console.log(seq);
	            saveCanvas("card1", seq);
	            return "redirect:/receivecard";
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
        .then(seq => {
            // 받아온 SEQ 값을 saveCanvas 함수에 인자로 넘겨줌
			console.log("### aigenerator - 선택 누르면 seq 받아오기 화이팅!!");
			console.log(seq);
            saveCanvas("card2", seq);
            return "redirect:/receivecard";
        })
        .catch(error => console.error('Error fetching SEQ:', error));
    } catch(error) {
        console.error(error);
	}
};

//
//document.querySelector("#selectGeneratedImg1").onclick = function() {
//    window.location.href = "<%= request.getContextPath() %>/receivecard";
//};
//
//document.querySelector("#selectGeneratedImg2").onclick = function() {
//    window.location.href = "<%= request.getContextPath() %>/receivecard";
//};



// 이미지 서버로 전송
async function saveCanvas (generatedCard, name) {
    var selectedDiv = document.getElementById(generatedCard);
    selectedDiv.style.opacity = "1";
    let canvas = await html2canvas(selectedDiv, {useCORS: true});
    
    canvas.toBlob(function(blob) {
        var formData = new FormData();
        formData.append('file', blob, name + ".png");
        formData.append('customerName', name);
        
        try {
	        response = fetch('/upload/uploadtest', {
	            method: 'POST',
	            body: formData
	        });
			console.log("### aigenerator - 생성한 이미지 receivecard로 post 성공")
            console.log(response);
        } catch(error) {
            console.error('### aigenerator - 생성한 이미지 Fetch 실패:', error);
            throw new Error('### aigenerator - 생성한 이미지 receivecard로 post 실패 (response 못받음)');			
		}
    });
}

