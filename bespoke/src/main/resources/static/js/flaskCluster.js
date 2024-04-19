document.getElementById("sendSeqBtn").addEventListener("click", async(event) => {
	// console.log 나오기 전에 fetch로 새로고침 돼서 로그 안보이는거임
	// 실행한거 보려면 event.preventDefault() 하면 됨
	event.preventDefault();
	var seq = document.getElementById("seq").value;
	try {
	    let response = await fetch("/flask/getCluster", {
	        method: "POST",
	        headers: {
	            "Content-Type": "application/json"
	        },
	        body: JSON.stringify({ seq: seq })
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
		
		// 선택된 체크박스 개수
		let selectedCount = 0;
		
		benefits.forEach((benefit, index) => {
		    // 체크박스와 라벨 생성
		    let checkbox = document.createElement("input");
		    checkbox.type = "checkbox";
		     // benefits 리스트에 고유한 ID 부여
		    checkbox.id = "benefit" + index;
		    checkbox.value = benefit;
		    checkbox.name = "benefits";
		
		    let label = document.createElement("label");
		    label.htmlFor = "benefit" + index;
		    label.appendChild(document.createTextNode(benefit));
		    
		    // 체크박스 선택 제한 로직
		    checkbox.addEventListener("change", function() {
		        if (this.checked) {
		            selectedCount++;
		            if (selectedCount > 5) {
		                alert("최대 5개까지만 선택할 수 있습니다.");
		                this.checked = false;
		                selectedCount--;
		            }
		        } else {
		            selectedCount--;
		        }
		    });
		
		    // benefitsContainer에 체크박스와 라벨 추가
		    benefitsContainer.appendChild(checkbox);
		    benefitsContainer.appendChild(label);
		    // 줄바꿈
		    benefitsContainer.appendChild(document.createElement("br"));
		});
		
		////////////////////////////////////////////////////////////////////////////////
		// "/flask/getTop5Cards"로 체크한 5개 benefits POST
		// flask에서 DB에 SEQ, 5개 혜택, 5개 카드 idx 저장함
		////////////////////////////////////////////////////////////////////////////////
		
		// 선택된 혜택을 저장할 배열
		var selected_benefits = [];
		
		// 선택된 혜택을 수집하고 서버로 전송하는 함수
		// async, await 때문에 함수로 만듦
		async function sendSelectedBenefits() {
		    // 현재 선택된 체크박스들을 찾습니다.
		    document.querySelectorAll('#benefits input[type="checkbox"]:checked').forEach(item => {
		        selected_benefits.push(item.value);
		    });
			
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
		
		// "Submit" 버튼이 클릭되었을 때, sendSelectedBenefits 함수를 호출합니다.
		var submitButton = document.getElementById('submitBenefits');
		submitButton.style.opacity=1;
		submitButton.addEventListener("click", function(event) {
			// 폼 제출 기본 동작 방지
		    event.preventDefault();
		    sendSelectedBenefits();
		});


	}  catch(error) {
			var errorMessageContainer = document.getElementById("errorMessageContainer");
	     	
	        // error.message가 정의되어 있는지 먼저 확인
	        var errorMessage = error.message || "알 수 없는 오류가 발생했습니다.";
	     
	        errorMessageContainer.innerHTML = "오류 발생: " + errorMessage;
	        
	        errorMessageContainer.style.opacity = "1";
	        console.error("오류 발생:", error);
		}
});
