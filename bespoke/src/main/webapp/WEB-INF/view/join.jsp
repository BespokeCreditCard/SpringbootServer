<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="/css/navbar.css">
    <title>우리은행 마이페이지</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
</head>
<body>  
    <nav class="navbar">
        <a href="index.html" class="navbar__brand">우리은행</a>        
        <ul class="navbar__menu">
            <li><a href="Recommendation.jsp">카드 추천</a></li>
            <li><a href="carddesign.jsp">카드 꾸미기</a></li>
            <li><a href="IssueCard.jsp">카드 발급</a></li>
            <li><a href="${pageContext.request.contextPath}/terms">약관</a></li>
            <li><a href="MyPage.jsp">마이 페이지</a></li>
           <li><a href="${pageContext.request.contextPath}/login">로그인</a></li>
        </ul>
    </nav>


    <div class="container-lg p-3 mt-5 border border-primary bg-light rounded border-5">
        <div class="row p-2 mt-1 mb-1 align-items-center ">
            <div class="row justify-content-center">
                <div class="col-md-8">
                    <div class="card mt-3">
                        <div class="card-body">
                            <div class="d-flex justify-content-start mb-4">
                                <img src="/img/bank.png" alt="우리은행 로고" style="width: 150px;">
                            </div>
                            <h2 class="card-title text-center mb-4">회원가입</h2>

                            <form method="post" action="/join">
                                <div class="row row-cols-1 row-cols-md-2 g-3">
                                    <div class="col">
                                        <div class="form-group mb-3">
                                            <label for="userID">아이디</label>
                                            <input type="text" id="userID" name="userID" required class="form-control">
                                        </div>
                                        <div class="form-group mb-3">
                                            <label for="password">비밀번호</label>
                                            <input type="password" id="password" name="password" required class="form-control">
                                        </div>
                                        <div class="form-group mb-3">
                                            <label for="confirm-password">비밀번호 확인</label>
                                            <input type="password" id="confirm-password" name="confirm-password" required class="form-control">
                                        </div>
                                        <div class="form-group mb-3">
                                            <label for="address">주소</label>
                                            <input type="text" id="address" name="address" required class="form-control">
                                        </div>
                                    </div>
                                    <div class="col">
                                        <div class="form-group mb-3">
                                            <label for="name">이름</label>
                                            <input type="text" id="name" name="name" required class="form-control">
                                        </div>
                                        <div class="form-group mb-3">
                                            <label for="birthDate">생년월일</label>
                                            <input type="date" id="birthDate" name="birthDate" required class="form-control">
                                        </div>
                                        <div class="form-group mb-3">
                                            <label for="contact">연락처</label>
                                            <input type="tel" id="contact" name="contact" required class="form-control">
                                        </div>
                                        <div class="form-group mb-3">
                                            <label>성별</label>
                                            <div class="row">
                                                <div class="col">
                                                    <div class="form-check">
                                                        <input class="form-check-input" type="radio" name="gender" id="gender-male" value="1">
                                                        <label class="form-check-label" for="gender-male">남자</label>
                                                    </div>
                                                </div>
                                                <div class="col">
                                                    <div class="form-check">
                                                        <input class="form-check-input" type="radio" name="gender" id="gender-female" value="2">
                                                        <label class="form-check-label" for="gender-female">여자</label>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                   </div>

                                    <div class="col-12">
                                        <div class="d-grid gap-1 mt-1">
                                            <button id="agreementBtn" type="button" class="btn btn-light" data-bs-toggle="modal" data-bs-target="#termsModal">이용약관 동의</button>
                                            <input type="hidden" name="agreement" id="agreement" value="false">
                                        </div>
                                    </div>

                                    <div class="col-12">
                                        <div class="d-grid">
                                            <button type="submit" class="btn btn-secondary">가입완료</button>
                                        </div>
                                    </div>
                                </div>
                            </form>
                                       
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- 이용약관 모달 -->
    <div class="modal fade" id="termsModal" tabindex="-1" aria-labelledby="termsModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="termsModalLabel">이용약관 동의</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <!-- 이용약관 내용 -->
                    <div class="card bg-light">
                        <div class="card-body" style="overflow-y: scroll; max-height: 100px;">
                            <h6>이용약관</h6>
                            <p>
                            제1조(목적)<br>
                            이 약관은 재단법인 농협재단이 운영하는 인터넷 홈페이지가 제공하는 인터넷 관련 서비스(이하 '서비스')의 이용조건 및 절차, 기타 필요한 사항을 규정함을 목적으로 합니다.<br>
                            제2조(약관의 효력과 변경)<br>
                            ·이 약관의 내용은 서비스 화면에 게시하거나 기타의 방법으로 회원에게 공지함으로써 효력이 발생합니다.<br>
                            ·"우리 재단"은 이 약관을 임의로 변경할 수 있으며, 변경된 약관은 제1항과 같은 방법으로 공지함으로써 효력을 발생합니다.<br>
                            ·이 약관에 동의하는 것은 정기적으로 서비스페이지를 방문하여 약관의 변경 사항을 확인하는 것에 동의함을 의미합니다. 변경된 약관에 대한 정보를 알지 못해 발생하는 이용자의 피해는 "우리 재단"에서 책임지지 않습니다.<br>
                            ·"회원"은 변경된 약관에 동의하지 않을 경우 회원 탈퇴(해지)를 요청할 수 있으며, 변경된 약관의 효력 발생일 이후에도 서비스를 계속 사용할 경우 약관의 변경 사항에 동의한 것으로 간주 됩니다.<br>
                            제3조(약관의 외 준칙)<br>
                            ·이 약관에 명시되지 아니한 사항에 대해서는 서비스별 약관의 취지, 전기통신 기본법, 전기통신사업법, 정보통신망 이용촉진 및 정보보호 등에 관한 법률, 공익법인의 설립·운영에 관한 법률 및 기타 대한민국의 관련 법령 규정에 따릅니다.<br>
                            제 2장 서비스 이용계약의 체결<br>
                            제 4조("서비스"이용계약의 성립)<br>
                            ·이용계약은 "회원"이 되고자 하는 자의 본 이용약관 내용에 대한 동의와 이용신청에 대하여 "우리재단"이 이를 승낙을 함으로써 성립합니다.<br>
                            ·이용신청 당시, 이용고객이 회원가입 페이지의 본 약관을 읽고 '동의' 버튼을 누름으로써 본 약관에 동의한 것으로 간주합니다.
                            </p>

                        </div>
                    </div>

                    <div class="form-check">
                        <input type="checkbox" class="form-check-input" id="termsCheckbox">
                        <label class="form-check-label" for="termsCheckbox">이용약관에 동의합니다.</label>
                    </div>

                    <!-- 개인정보 수집 및 이용약관 내용 -->
                    <div class="card mt-5 bg-light" >
                        <div class="card-body" style="overflow-y: scroll; max-height: 100px;">
                            <h6>개인정보 수집 및 이용약관</h6>
                            <p>
                                제1조 (개인정보의 처리 목적)<br>
                                우리은행은 개인정보를 다음의 목적을 위해 처리합니다. 처리한 개인정보는 목적 외의 용도로는 사용되지 않으며 이용 목적이 변경될 시에는 사전동의를 구할 예정입니다<br>
                                1. (금융)거래 관계 관련<br>
                                (금융)거래와 관련하여 신용조회회사 또는 신용정보집중기관에 대한 개인신용정보의 조회, (금융)거래 관계의 설정 여부의 판단, (금융)거래 관계의 설정·유지·이행·관리, 금융사고 조사, 분쟁 해결, 민원 처리 및 법령상 의무이행 등의 목적으로 개인정보를 처리합니다.<br>
                                2. 상품 및 서비스 홍보 및 판매 권유<br>
                                고객 만족도 조사를 통한 신규 서비스 개발 및 맞춤 서비스 제공, 인구통계학적 특성에 따른 서비스 제공 및 광고의 게재, 서비스의 유효성 확인, 경품지급, 사은 행사 등 고객의 편의 및 참여기회 제공, 접속빈도 파악, 회원의 서비스 이용에 대한 통계 등의 목적으로 개인정보를 처리합니다.<br>
                                3. 회원 가입 및 관리<br>
                                회원가입, 회원제 서비스 이용, 제한적 본인 확인제에 따른 본인확인, 개인식별, 부정이용방지, 비인가 사용방지, 가입의사 확인, 만14세 미만 아동 개인정보 수집 시 법정대리인 동의여부 확인, 추후 법정 대리인 본인확인, 사고조사, 분쟁해결, 민원처리 및 고지사항 전달 등의 목적으로 개인정보를 처리합니다.<br>
                                4. 온라인 거래 관련 목적<br>
                                전자금융거래법 제21조, 제22조에 의해 전자금융거래의 내용 추적 및 검색, 보안 정책 수립용 통계 자료로 활용 등을 목적으로 개인정보를 처리합니다.<br>
                                5. 통계작성, 과학적 연구, 공익적 기록보전 목적<br>
                                개인정보보호법 제28조의2에 의해 통계작성, 과학적 연구, 공익적 기록보전 등을 위하여 개인정보를 가명처리 할 수 있습니다.<br>
                                제2조 (개인정보의 처리 및 보유 기간)<br>
                                1. (금융)거래와 관련한 개인(신용)정보는 수집·이용에 관한 동의일로부터 (금융)거래 종료일로부터 5년까지는 제1조의 이용목적을 위하여 보유·이용됩니다. 단, (금융)거래 종료일 이후에는 금융사고 조사, 분쟁 해결, 민원처리, 법령상 의무이행 및 우리은행의 리스크 관리업무만을 위하여 보유·이용됩니다.<br>
                                2. 개인(신용)정보의 조회를 목적으로 수집된 개인(신용)정보는 수집·이용에 대한 동의일로부터 고객에 대한 신용정보 제공·조회 동의의 효력 기간까지 보유·이용됩니다. 단, 신용정보 제공·조회 동의의 효력 기간 종료일 후에는 상법 제33조 등 관련 법률에서 정한 기간 동안에 금융사고 조사, 분쟁 해결, 민원처리 및 법령상 의무이행만을 위하여 보유·이용됩니다.<br>
                                3. 상품, 서비스 홍보 및 판매 권유 등과 관련한 개인(신용)정보는 수집·이용에 관한 동의일로부터 동의 철회일까지 보유·이용됩니다. 단, 동의 철회일 후에는 상법 제33조 등 관련 법률에서 정한 기간 동안에 제1조의 목적과 관련된 사고 조사, 분쟁 해결, 민원처리, 법령상 의무이행만을 위하여 보유·이용됩니다.<br>
                                4. 회원 가입 및 관리 목적으로 수집된 개인(신용)정보는 고객의 회원 가입일로부터 회원 탈퇴일까지 보유·이용됩니다. 단 회원 탈퇴일 후에는 관련 법률에서 정한 기간 동안에 제1조의 목적과 관련된 사고 조사, 분쟁 해결, 민원처리, 법령상 의무이행 만을 위하여 보유·이용됩니다.<br>
                                5. 온라인 거래 관련한 개인(신용)정보는 전자금융거래법 시행령 제12조에서 정하는 기간까지 보유·이용됩니다.<br>
                                6. 통계작성, 과학적 연구, 공익적 기록보전에 활용하기 위해 ‘가명처리한 개인정보’(이하 가명정보)는 가명처리 계획 수립 시 정한 목적을 달성하는 기간(시점)까지만 보유·이용됩니다.<br>
                                제3조 (개인정보의 제3자 제공)<br>
                                1. 우리은행은 원칙적으로 정보주체의 개인정보를 제1조에서 명시한 목적 범위 내에서 처리하며, 정보주체의 사전 동의 없이는 본래의 범위를 초과하여 처리하거나 제3자에게 제공하지 않습니다. 단, 다음의 각 호의 경우에는 정보주체 또는 제3자의 이익을 부당하게 침해할 우려가 있을 때를 제외하고는 개인정보를 목적 외의 용도로 이용하거나 이를 제3자에게 제공할 수 있습니다.<br>
                                가. 정보주체가 사전에 제3자 제공 및 공개에 동의한 경우<br>
                                나. 다른 법률에 특별한 규정이 있는 경우<br><br>
                                다. 정보주체 또는 그 법정대리인이 의사표시를 할 수 없는 상태에 있거나 주소불명 등으로 사전 동의를 받을 수 없는 경우로서 명백히 정보주체 또는 제3자의 급박한 생명, 신체, 재산의 이익을 위하여 필요하다고 인정되는 경우<br>
                                2. 우리은행은 다음 각 호와 같이 개인정보를 제공하고 있습니다.<br>
                                가. 제공받는 자<br>
                                1) 신용정보집중기관 및 신용정보회사에 대한 제공<br>
                                신용정보집중기관 [한국신용정보원] 신용정보회사 [SCI평가정보, 코리아크레딧뷰로㈜, NICE신용평가정보㈜]<br>
                                2) 제휴업체<br>
                                고객광장 > 보안센터 > 개인정보보호정책 > 개인신용정보관리보호 > 제휴업체 참조<br>
                                나. 제공받는 자의 이용 목적<br>
                                1) 신용정보집중기관 및 신용정보회사에 대한 제공 본인의 신용을 판단하기 위한 자료로 활용하거나 공공기관에서 정책자료로 활용<br>
                                2) 제휴업체에 대한 제공 제휴 상품·서비스의 홍보 및 판매 권유<br>
                                다. 개인정보 제공항목<br>
                                1) 신용정보집중기관 및 신용정보회사에 대한 제공<br>
                                2) 개인식별정보, 신용거래정보, 신용능력정보, 신용평가를 위한 정보<br>
                                3) 제휴업체에 대한 제공<br>
                                4) 개인식별정보, (금융)거래 정보, 거래신청서에 기재된 개인식별 정보 외의 정보 또는 정보주체가 제공한 정보 (주거 및 가족사항, 거주기간, 세대구성, 결혼여부 등)<br>
                                ※ 본 동의 이전에 수집된 개인(신용)정보도 포함됩니다.<br>
                                라. 개인정보 보유 기간<br>
                                개인(신용)정보는 제공된 날로부터 동의 철회시 또는 제공된 목적을 달성할 때까지 보유·이용됩니다. 동의 철회 또는 제공된 목적 달성 후에는 위에 기재된 이용목적과 관련된 금융사고 조사, 분쟁해결, 민원처리, 법령상 의무이행을 위하여 필요한 범위 내에서만 보유·이용됩니다.<br>
                                3. 우리은행은 가명정보를 제3자에게 제공하고 있습니다.<br>
                                - 제공하는 가명정보의 종류, 제공대상, 제공받는 자의 이용목적은 아래 경로에서 확인할 수 있습니다.<br>
                                고객광장 > 보안센터 > 개인정보보호정책 > 개인신용정보관리보호 > 가명정보 처리 현황 참조
                            </p>
                        </div>
                    </div>


                    <div class="form-check">
                        <input type="checkbox" class="form-check-input" id="personalInfoCheckbox">
                        <label class="form-check-label" for="personalInfoCheckbox">개인정보 수집 및 이용에 동의합니다.</label>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
                    <button type="button" class="btn btn-primary" id="agreeButton" disabled data-bs-dismiss="modal">동의합니다</button>
                </div>
            </div>
        </div>
    </div>


    <script>
        
        const termsCheckbox = document.getElementById('termsCheckbox');
        const personalInfoCheckbox = document.getElementById('personalInfoCheckbox');
        const agreeButton = document.getElementById('agreeButton');
        const agreementBtn = document.getElementById('agreementBtn');
        const completeButton = document.getElementById('completeButton');
        const agreementInput = document.getElementById('agreement');

        termsCheckbox.addEventListener('change', updateButtonState);
        personalInfoCheckbox.addEventListener('change', updateButtonState);
        agreeButton.addEventListener('click',updateButtonAgreeButton);

        function updateButtonAgreeButton() {
            if (termsCheckbox.checked && personalInfoCheckbox.checked) {
                agreementBtn.classList.remove('btn', 'btn-light');
                agreementBtn.classList.add('btn-secondary');
                agreementInput.setAttribute('value', 'True'); 
            } else {
                agreementBtn.classList.remove('btn-secondary');
                agreementBtn.classList.add('btn', 'btn-light');
                agreementInput.setAttribute('value', 'False'); 
            }
        }

        function updateButtonState() {
            if (termsCheckbox.checked && personalInfoCheckbox.checked) {
                agreeButton.disabled = false;
                completeButton.disabled = false;

            } else {
                agreeButton.disabled = true;
                completeButton.disabled = true;
            }
        }
    
        agreeButton.addEventListener('click', () => {
            $('#termsModal').modal('hide'); // 모달 숨기기
        });
    </script>

</body>
</html>