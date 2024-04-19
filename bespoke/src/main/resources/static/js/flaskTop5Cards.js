// 로컬 스토리지에서 데이터 로드
let storedData = localStorage.getItem('top5Cards');
if (storedData) {
    let data = JSON.parse(storedData);
    console.log(data); // 이제 여기서 데이터 사용 가능
    let result = JSON.parse(data.jsonResponse);
    // 필요한 경우 로컬 스토리지에서 해당 데이터 삭제
    // localStorage.removeItem('top5Cards');
    console.log(result);
    let selectedBenefits = result.selectedBenefits;
    let cards = result.top5CardIdxs;
    var resultdDiv = document.getElementById("resultdDiv");
    
	resultdDiv.innerHTML = cards;
	
}