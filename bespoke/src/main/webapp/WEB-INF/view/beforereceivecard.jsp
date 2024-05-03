<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<%@ include file="header/header.jsp" %>

<style>
        th, td {
            border: 1px solid black;
            text-align: center;
        }
</style>
<body>
    <div class="container mt-5">
        <div class="row">
            <div class="col-md-6 mb-3">
                <div class="container-lg h-100 p-1 border border-primary bg-light rounded border-5">
                    <h2 class="card-header">카드 수령장소</h2>
                    <div class="card-body">
                        <input type="text" class="form-control mb-3" id="user-address" placeholder="${userData.address}" disabled>
                        <button class="btn btn-primary" id="edit-address">수정</button>
                    </div>
                </div>
            </div>
    
            <div class="col-md-6 mb-3">
                <div class="container-lg h-100 p-1 border border-primary bg-light rounded border-5">
                    <h2 class="card-header">개인 정보 확인</h2>
                    <div class="card-body">
                   		<p class="card-text">Id: <span id="user-id">${userData.userID}</span></p>
                        <p class="card-text">이름: <span id="user-name">${userData.name}</span></p>
                        <p class="card-text">생년월일: <span id="user-birth">${userData.birthDate}</span></p>
                        <p class="card-text">주소: <span id="user-address-db">${userData.address}</span></p>
                        <p class="card-text">전화번호: <span id="user-phone">${userData.contact}</span></p>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class="container">
        <div class="row">
            <div class="col-md-6 mb-3">
                <div class="container-lg h-100 border border-primary bg-light rounded border-5">
                    <h2 class="card-header">선택된 카드 이미지</h2>
                    <div class="card-body">
                        <img src="${userImageUrl}" class="img-fluid" alt="선택된 카드" width="33%">
                    </div>
                </div>
            </div>
    
            <div class="col-md-6 mb-3">
                <div class="container-lg h-100 border border-primary bg-light rounded border-5">
                    <h2 class="card-header">카드 혜택 내역</h2>
                    <div class="card-body" style="overflow-y: scroll; max-height: 500px;">
	                    <ul>
	                        <c:forEach var="category" items="${categoriesResultDetail}" varStatus="catStatus">
	                            <c:if test="${not empty categoriesResultDetail[catStatus.index * 3]}">
	                                <li>Category ${catStatus.index + 1}:</li>
	                                <ul>
										<li>Class: <c:out value="${categoriesResultDetail[catStatus.index * 3]}" /></li>
							            <li>Benefit: <c:out value="${categoriesResultDetail[catStatus.index * 3 + 1]}" /></li>
										<li><c:out value="${categoriesResultDetail[catStatus.index * 3 + 2]}" escapeXml="false" /></li>
	                                </ul>
	                            </c:if>
	                         </c:forEach>
	                     </ul>
                    </div>
                </div>
            </div>
        </div>
    </div>
    
    <!-- 모달 -->
    <div class="modal fade" id="issueCardModal" tabindex="-1" aria-labelledby="issueCardModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="issueCardModalLabel">발급받으시겠습니까?</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <div class="container bg-light p-3 rounded" style="overflow-y: scroll; max-height: 100px;">
                        <p>
                            제1조 약관의 적용<br>
                            제1조(목적)<br>
                            이 약관은 회원의 권익보호 및 거래관계의 명확화를 위하여 주식회사 우리카드(이하 “카드사”라 함)와 신용카드(이하 “카드”라 함)를 이용하고자 하는 회원 간의 필요한 사항을 정함을 목적으로 합니다.<br>
                            제2조(회원)<br>
                            ① 회원은 본인회원과 가족회원으로 구분합니다.<br>
                            ② 본인회원이란 이 약관을 승인하고 카드사에 카드 발급을 신청하여 카드사로부터 카드를 발급받은 분을 말합니다.<br>
                            ③ 가족회원이란 본인회원이 지정하고 대금의 지급 및 기타 카드이용에 관한 책임을 본인회원이 부담할 것을 승낙한 분으로서, 이 약관을 승인하고 카드사로부터 카드를 발급받은 분을 말합니다. 제2장 카드의 발급 및 관리 등<br>
                            제3조(카드의 발급)<br>
                            ① 카드를 발급받고자 하는 신청인이 카드사에 카드발급을 신청하면 카드사는 내부 기준에 따른 심사 및 발급관련 절차 등을 거쳐 발급합니다.<br>
                            ② 카드모집자가 카드회원을 모집할 때 자금의 융통을 권유하는 경우에는 대출금리, 연체료율 및 취급수수료 등의 거래조건을 감추거나 왜곡하지 아니하고, 이해할 수 있도록 설명합니다.<br>
                            ③ 카드사는 신용카드 이용계약을 체결할 경우 신청인에게 카드에 대한약관과 연회비 등 카드의 거래조건 및 연회비 반환사유, 반환금액 산정방식, 반환금액의 반환기한 등을 알리고 이용계약에 따른 계약서류를 제공하여야 합니다.<br>
                            제3조의2(가족카드 발급 등)<br>
                            ① 본인회원은 카드사에 가족카드 발급(갱신ㆍ대체발급을 포함한다. 이하 이 조에서 같다)을 신청할 수 있으며, 카드사는 관련 법규 등에 따라 본인회원의 신용상태, 가족관계, 가족의 동의 등을 확인하여 가족카드를 발급할 수 있습니다.<br>
                            ② 가족카드는 본인회원의 배우자, 직계존속ㆍ비속(배우자 포함), 형제자매 및 배우자의 직계존속ㆍ비속, 형제자매에게 발급됩니다.<br>
                            ③ 카드사는 가족카드 발급과 관련하여 다음 각호의 사항을 상품설명서에 명시하고 카드를 발급할 경우 본인회원과 가족회원에게 안내합니다.<br>
                            1. 가족카드 연회비 및 가족카드 발급 가능매수
                            2. 가족카드 부가서비스 이용조건 및 제공 범위
                            3. 가족카드 연말정산 관련 사항
                            4. 휴대폰 메시지 및 카드대금 청구서 제공사실 및 방법
                            5. 가족카드 포인트 양도방법
                            6. 이혼, 사망, 파양 등 가족관계 변동시 본인회원 및 가족회원의 카드사 신고방법 및 처리절차
                            7. 제6호의 가족관계 변동이 되었음에도 가족카드를 정지시키지 않는 경우 의도하지 않는 카드사용 및 책임이 발생할 수 있다는 사실 8. 본인회원이 요청할 경우 가족회원의 동의없이 가족카드가 한도감액
                            ㆍ정지ㆍ해지될 수 있다는 사실
                            9. 기타 가족카드 이용정지 및 해지 등에 관한 사항
                            ④ 본인회원은 본인회원이 발급을 신청하지 않은 가족카드 사용금액에 대해서는 책임을 부담하지 않습니다. 본인회원이 발급을 신청했다는 사실에 대한 입증책임은 카드사가 집니다.<br>
                            ⑤ 본인회원은 가족회원의 동의 없이 가족카드의 한도감액ㆍ정지ㆍ해지를 카드사에 요청할 수 있으며 카드사는 본인회원의 요청에 따라 가족카드 한도감액ㆍ정지ㆍ해지 조치를 한 경우에는 즉시 그 사실을 본인회원과 가족회원에게 알립니다.<br>
                            ⑥ 카드사는 제30조에 따라 가족회원에게 본인회원의 미상환 채무를 추심할 수 없습니다.<br>
                            ⑦ 본인회원은 카드사가 정하여 카드사의 홈페이지 등에 게시하는 절차에 따라 가족회원 명의의 계좌를 가족카드 이용대금 자동이체결제계좌로 지정해 줄 것을 카드사에 요청할 수 있으며, 이 경우 카드사는 가족회원의 동의를 받아 처리합니다.<br>
                        </p>
                    </div>
                    <div class="form-check mb-3">
                        <input class="form-check-input" type="checkbox" id="agreementCardTerms">
                        <label class="form-check-label" for="agreementCardTerms">
                            카드 이용약관 동의
                        </label>
                    </div>
                    <div class="container bg-light p-3 rounded" style="overflow-y: scroll; max-height: 100px;">
                        <p>
                            ㈜우리은행<br>
                            [귀 행]과의 (금융)거래와 관련하여 [귀 행]이 본인의 개인(신용)정보를 제3자에게 제공하고자 하는 경우에는 「개인정보 보호법」 제15조 제1항 제1호, 제17조 제1항 제1호, 제24조 제1항 제1호, 「신용정보의 이용 및 보호에 관한 법률」 제32조 제1항, 제33조 및 제34조에 따라 본인의 동의가 필요합니다.<br>
                            * 본 동의는 계약체결에 필수적이지 않으며, 동의하셨더라도 언제든 철회 가능합니다.<br>
                            제공받는 자 ￭ ㈜우리카드<br>
                            제공받는 자의 이용<br>
                            목적 ￭ 고객서비스 제공 및 계약의 유지·이행·관리, 금융상품 및 서비스의 운용,리스크관리 등제공할 개인정보의 항목<br>
                            ￭ 개인식별정보,금융거래정보 및 기타 금융거래의 설정·유지·이행·관리를 위한 상담 등을 통해 생성되는 정보<br>
                            제공 및 변경에 관한 세부사항<br>
                            ￭ 위 제공받는 자의 변경 사항은 [당 행] 홈페이지*에서 확인하실 수 있습니다. *https://www.wooribank.com>고객광장>보안센터>개인정보보호정책>개인정보처리(취급)방침>제휴업체제공받은 자의 개인정보 보유‧이용<br>
                            기간
                            ￭ 본 동의서의 효력은 1년의 범위 내에서 명의인으로부터 서면 또는 이메일 등을 통해 동의를 철회할 때까지 지속됩니다.<br>
                            ￭ 당행은 매년 1회 서면 또는 이메일 등의 방법으로 본 동의서에 따라 개인(신용)정보가 제공되었음을 통보하는 통지서를 귀하에게 송부합니다. <br>
                            당행은 당해 통지서에 개인(신용)정보 제공에 동의하지 않는 경우 서면 또는 이메일 등을 통해 동의를 철회할 수 있음을 재차 고지하는 방법으로 개인(신용)정보의 제공 동의를 1년씩 추가 연장할 수 있습니다. <br>
                            ￭ 위 개인(신용)정보의 제공에 대한 동의를 거부할 수 있으며 다만, 동의하지 않은 경우 우리카드 서비스 등 부가되는 혜택을 제공받을 수 없으며, 카드발급 및 한도심사등에 영향을 줄 수 있습니다.<br>
                        </p>

                    </div>
                    <div class="form-check mb-3">
                        <input class="form-check-input" type="checkbox" id="agreementPersonalInfo">
                        <label class="form-check-label" for="agreementPersonalInfo">
                            개인정보 수집 및 이용 동의
                        </label>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
                    <button type="button" class="btn btn-primary" id="issueBtn" disabled>발급</button>
                </div>
            </div>
        </div>
    </div>

    <!-- 버튼 -->
    <div class="container-fluid fixed-bottom" id="prevBtnDiv">
    <div class="row justify-content-start mb-3">
        <div class="col-6">
            <button type="button" class="btn btn-secondary btn-block" onclick="window.location.href='<%= request.getContextPath() %>/design/carddesign'">이전</button>
        </div>
        <div class="col-6 text-end justify-content-end" id="nextBtnDiv">
                <button type="button" class="btn btn-secondary btn-block" data-bs-toggle="modal" data-bs-target="#issueCardModal">확인</button>
            </div>
        </div>
    </div>


    <script src="https://fastly.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>

    <script>
        document.getElementById("edit-address").addEventListener("click", function() {
            var addressInput = document.getElementById("user-address");
            var editButton = document.getElementById("edit-address");
			var userIdTemp = document.getElementById("user-id").textContent;
            console.log("a : " + addressInput + "a : " + editButton + "a : " + userIdTemp);
            if (addressInput.disabled) {
                // 텍스트 상자를 활성화하여 편집 가능하게 만듭니다.
                addressInput.disabled = false;
                addressInput.focus(); // 커서를 텍스트 상자로 이동시킵니다.
                editButton.innerText = "저장"; // 버튼 텍스트를 "저장"으로 변경합니다.
            } else {
                // 수정이 완료되면 텍스트 상자를 비활성화하고 버튼 텍스트를 다시 "수정"으로 변경합니다.
                addressInput.disabled = true;
                editButton.innerText = "수정";
                
             // 수정된 주소를 서버로 전송
                var updatedAddress = addressInput.value;
             	
                saveAddress(updatedAddress, userIdTemp); // 주소 저장 함수 호출
            }
            
         // 수정된 주소를 서버로 전송하는 함수 (Ajax)
            function saveAddress(address, userId) {
                var xhr = new XMLHttpRequest();
                xhr.open("POST", "/receivecard", true); // POST 요청으로 /receivecard 엔드포인트 호출
                xhr.setRequestHeader("Content-Type", "application/json");
                xhr.onreadystatechange = function() {
                    if (xhr.readyState === 4 && xhr.status === 200) {
                        // 주소 업데이트가 성공적으로 처리된 경우
                        console.log("Update Successful");
                        // 주소 업데이트 후 페이지 내 해당 부분만 업데이트
                        alert("주소 업데이트에 성공하였습니다!");
                    }
                };
                var encodedAddress = encodeURIComponent(address);
                xhr.send(JSON.stringify({ address: address, userId: userId }));
            }
        });
    </script>

    <script>
        // 발급 버튼 클릭 시 이벤트 처리
        document.getElementById("issueBtn").addEventListener("click", function() {
            // 발급 완료 후 MyPage.html로 이동합니다.
        	window.location.href = "<%= request.getContextPath() %>/mypage";
        });
    </script>

    <!-- 발급 버튼 관련 스크립트 -->
    <script>
        // 체크박스 체크 여부 확인
        function checkAgreements() {
            var agreementCardTerms = document.getElementById("agreementCardTerms").checked;
            var agreementPersonalInfo = document.getElementById("agreementPersonalInfo").checked;

            // 두 체크박스가 모두 체크되었을 때 발급 버튼을 활성화
            if (agreementCardTerms && agreementPersonalInfo) {
                document.getElementById("issueBtn").disabled = false;
            } else {
                document.getElementById("issueBtn").disabled = true;
            }
        }

        // 체크박스 상태 변화 시 발급 버튼 상태 갱신
        document.getElementById("agreementCardTerms").addEventListener("change", checkAgreements);
        document.getElementById("agreementPersonalInfo").addEventListener("change", checkAgreements);
    </script>
    
</body>
</html>
