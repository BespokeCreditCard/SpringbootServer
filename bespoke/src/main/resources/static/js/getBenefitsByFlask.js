// selectRecommendation.js에서 사용하는 함수들
const getBenefitsByFlask = async (seq) => {
    // var seq = document.getElementById("seq").innerText;

    let response = await fetch("/flask/getCluster", {
        method: "POST",
        headers: {
            "Content-Type": "application/json"
        },
        body: JSON.stringify({seq: seq})
    });

    // 응답 상태 코드가 성공적인 상태 코드 범위에 있는지 먼저 확인합니다.
    if (response.status != 200) {
        // 서버로부터 응답 메시지가 JSON 형식인 경우가 많으므로, 에러 메시지를 추출하기 위해 먼저 JSON을 파싱할 수 있습니다.
        let errorResult = await response.json();
        throw new Error(errorResult.message || "혜택 불러오기 실패");
    }

    let result = await response.json();
    let real_result = await JSON.parse(result.jsonResponse);

    // 가져온 값들
    var seq = real_result?.seq;
    var cluster_num = real_result?.clusterNum;
    var card_idxs = real_result?.cardIdxs;
    var benefits = real_result?.benefits;
    // benefits div 가져오기
    var benefitsContainer = document.getElementById("benefits");
    benefitsContainer.innerHTML = "";
    var cluster_numContainer = document.getElementById("cluster_num");
    cluster_numContainer.value = cluster_num;
    cluster_numContainer.innerText = cluster_num;
    return benefits;
}

const makeBenefitButton = (benefitList) => {
    var clickedButtons = 0;


    benefitList.forEach((benefit, index) => {
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

}

async function sendSelectedBenefits(selected_benefits, seq, cluster_num) {
    // 선택된 혜택들을 서버로 전송
    try {
        //let response = await fetch("/flask/getTop5Cards", {
        let response = await fetch("http://localhost:8080/flask/getTop5Cards", {
            method: "POST",
            headers: {
                "Content-Type": "application/json",
            },
            body: JSON.stringify({
                selected_benefits: selected_benefits,
                seq: seq,
                cluster_num:cluster_num })
        });

        let data = await response.json();
        console.log("###########################");
        console.log("Success:", data);
        console.log("###########################");
        localStorage.setItem('top5Cards', JSON.stringify(data));
        console.log("local storage에 data 저장 완료.");
        if (data.redirectURL) {
            window.location.href = data.redirectURL; // 페이지 이동
        }

    } catch (error) {
        console.error("Error:", error);
    }
}