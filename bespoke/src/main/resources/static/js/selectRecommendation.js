

window.onload = async function () {
    var seq = document.getElementById("seq").innerText;
    // 사용자별 혜택을 가져오는 함수
    const benefitList = await Promise.any([getBenefitsByFlask(seq)]);
    makeBenefitButton(benefitList);

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
        var clusterNum = document.getElementById("cluster_num").value;
        sendSelectedBenefits(selectedValues, seq, clusterNum)
    });
};

