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
                                            <button id="joinBtn" type="submit" class="btn btn-secondary">가입완료</button>
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
                            <p>여기에 이용약관 내용을 입력하세요. .</p>
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
                            <p>여기에 개인정보 수집 및 이용약관 내용을 입력하세요.</p>
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