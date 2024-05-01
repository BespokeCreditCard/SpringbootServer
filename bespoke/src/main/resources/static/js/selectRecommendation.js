window.onload = async function () {	
    var seq = document.getElementById("userId").innerText;
    // 사용자별 혜택을 가져오는 함수
    var response = await getBenefitsByFlask(seq);
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
        sendSelectedBenefits(selectedValues, seq, clusterNum)
    });
};

var getBenefitsByFlask = async (seq) => {
	try {		
	    ////////////////////////////////////
	    //test 할 때 주석 처리 할 곳
	    ////////////////////////////////////
	    let response = await fetch("http://15.165.82.28:5000/get_cluster", {
	        method: "POST",
	        headers: {
	            "Content-Type": "application/json"
	        },
	        body: JSON.stringify({seq: seq})
	    });
	    if (response.status != 200) {
	        // 서버로부터 응답 메시지가 JSON 형식인 경우가 많으므로, 에러 메시지를 추출하기 위해 먼저 JSON을 파싱
	        let errorResult = await response.json();
	        throw new Error(errorResult.message || "혜택 불러오기 실패");
	    }
		
	    let result = await response.json();
		
	    // 가져온 값들 - seq, benefits, cluster_num, card_idxs
	    var seq = result?.seq;
//	    var benefits = result?.benefits;
	    var clusterNum = result?.clusterNum;
	    ////////////////////////////////////
	    
	    var seq = "A12ZOS8HQ3DSVT4TTDXS";
	    var benefits = ["공항라운지", "게임", "해외이용", "카페", "영화", "대형마트", "대중교통", "소셜커머스", "간편결제", "주유소", "온라인쇼핑", "편의점", "통신", "백화점", "테마파크", "도서", "패밀리레스토랑", "동물병원"];
	    var clusterNum = 5;
	    ////////////////////////////////////
	    
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
		////////////////////////////////////
	    //test 할 때 주석 처리 할 곳
	    ////////////////////////////////////
//        let response = await fetch("http://15.165.82.28/get_top5_cards", {
//            method: "POST",
//            headers: {
//                "Content-Type": "application/json",
//            },
//            body: JSON.stringify({
//                selectedBenefits: selectedBenefits,
//                seq: seq,
//                clusterNum:clusterNum })
//        });
//
//        let result = await response.json();
	    ////////////////////////////////////
		var top5_card_idxs = [14, 98, 118, 131, 50];
		var selected_benefits = ["동물병원", "온라인쇼핑", "대중교통", "해외이용", "영화"];
		let result = {seq: 'A12ZOS8HQ3DSVT4TTDXS', cluster_num: 5, top5_card_idxs: top5_card_idxs, selected_benefits: selected_benefits}

        var redirectURL = "http://localhost:8080/recommendation_view/recommendation"
        result.redirectURL = redirectURL;
        
        if (result.redirectURL) {
            window.location.href = result.redirectURL; // 페이지 이동
        }
        
    } catch (error) {
        console.error("오류 발생:", error);
    }
}