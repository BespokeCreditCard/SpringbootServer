window.onload = async function () {
	
	// seq 가져와야함
    var seq = document.getElementById("userId").innerText;
    console.log("### 혜택 선택 페이지 - seq 잘 받아왔나 확인");
    console.log("### 혜택 선택 페이지 - " + seq);
    // 사용자별 혜택을 가져오는 함수
    var response = await getBenefitsByFlask(seq);
    // 여러개를 Promise 하고 싶을 때 사용
    // var response = await Promise.any([getBenefitsByFlask(seq)]);
    var { benefits: benefits, clusterNum: clusterNum } = response;
    makeBenefitButton(benefits);

    var sendBenefit = document.getElementById("sendBenefit");
    sendBenefit.addEventListener("click", function () {
        var selectList = document.getElementsByClassName("on");
        if(selectList.length < 1) {
            alert("혜택을 선택해주세요.");
            return;
        }
        var selectedValues = [];

        for (var i = 0; i < selectList.length; i++) {
            selectedValues.push(selectList[i].value);
        }
	    
	    console.log("################################################");
		console.log(seq);
		console.log(benefits);
        console.log(clusterNum);
        sendSelectedBenefits(selectedValues, seq, clusterNum)
    });
};

var getBenefitsByFlask = async (seq) => {
	try {
	    let response = await fetch("http://127.0.0.1:5000/get_cluster", {
	        method: "POST",
	        headers: {
	            "Content-Type": "application/json"
	        },
	        body: JSON.stringify({seq: seq})
	    });
	
	    // 응답 상태 코드가 성공적인 상태 코드 범위에 있는지 확인
	    if (response.status != 200) {
	        // 서버로부터 응답 메시지가 JSON 형식인 경우가 많으므로, 에러 메시지를 추출하기 위해 먼저 JSON을 파싱
	        let errorResult = await response.json();
	        throw new Error(errorResult.message || "혜택 불러오기 실패");
	    }
		
	    let result = await response.json();
	    
	//    // result 값을 controller에서 지정한 redirectURL 주소로 전달하며 페이지 이동
	//    if (result.redirectURL) {
	//            window.location.href = result.redirectURL; // 페이지 이동
	//        }
	    
	
//		localStorage.setItem('benefits', JSON.stringify(json_result?.benefits));
//		console.log("### joinBtn 눌렀을 때 local storage에 data 저장 완료.");

		
	    // 가져온 값들 - seq, benefits, cluster_num, card_idxs
	    var seq = result?.seq;
	    var benefits = result?.benefits;
	    var clusterNum = result?.clusterNum;
//	    var card_idxs = real_result?.card_idxs;

		return {benefits, clusterNum};
	} catch (error) {
        console.error("오류 발생:", error);
    }
}

const makeBenefitButton = (benefits) => {
	try {
	    var clickedButtons = 0;
	    	
	    benefits.forEach((benefit, index) => {
	        // 체크박스와 라벨 생성
	        let button = document.createElement("button");
	        button.type = "button";
	        button.className="button";
	        // benefits 리스트에 고유한 ID 부여
	        button.id = "benefit" + index;
	        button.value = benefit;
	        button.innerText = benefit;
	        button.name = "benefits";
	
	        // 체크박스 선택 제한 로직
	        button.addEventListener("click", function () {
	            if (button.classList.contains("on")) {
	                button.classList.remove("on");
	                clickedButtons--;
	            } else {
	                if (clickedButtons >= 5) {
	                    alert("더 이상 선택할 수 없습니다.");
	                    return;
	                }
	                button.classList.add("on");
	                clickedButtons++;
	            }
	        });
	
	        // benefitsContainer에 버튼
	        document.getElementById("benefits").appendChild(button);
	    });
	} catch (error) {
        console.error("오류 발생:", error);
    }
}

async function sendSelectedBenefits(selectedBenefits, seq, clusterNum) {
    // 선택된 혜택들을 서버로 전송
    try {
        //let response = await fetch("/flask/getTop5Cards", 
        let response = await fetch("http://127.0.0.1:5000/get_top5_cards", {
            method: "POST",
            headers: {
                "Content-Type": "application/json",
            },
            body: JSON.stringify({
                selectedBenefits: selectedBenefits,
                seq: seq,
                clusterNum:clusterNum })
        });

        let result = await response.json();
        console.log("######################################################");
        console.log("Top5 Success:", result);
        console.log("######################################################");
        console.log("json_result:", result);
        console.log("SEQ:", result?.seq);
        console.log("cluster_num:", result?.clusterNum);
        console.log("top5_card_idxs:", result?.top5_cardIdxs);
        console.log("selected_benefits:", result?.selectedBenefits);
        console.log("######################################################");
        
        var redirectURL = "http://localhost:8080/recommendation_view/recommendation"
        result.redirectURL = redirectURL;
        
        if (result.redirectURL) {
            window.location.href = result.redirectURL; // 페이지 이동
        }
        
    } catch (error) {
        console.error("오류 발생:", error);
    }
}