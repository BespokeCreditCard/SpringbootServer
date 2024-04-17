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
    <div class="container">
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
                        <img src="${userImageUrl}" class="img-fluid" alt="선택된 카드" style="width:33%;">
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
                        <p>카드 이용약관 내용:</p>
                        <p>여기에 카드 이용약관 내용을 작성하세요.</p>
                    </div>
                    <div class="form-check mb-3">
                        <input class="form-check-input" type="checkbox" id="agreementCardTerms">
                        <label class="form-check-label" for="agreementCardTerms">
                            카드 이용약관 동의
                        </label>
                    </div>
                    <div class="container bg-light p-3 rounded" style="overflow-y: scroll; max-height: 100px;">
                        <p>개인정보 내용:</p>
                        <p>여기에 개인정보 수집 및 이용 내용을 작성하세요.</p>
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


    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>

    <script>
        document.getElementById("edit-address").addEventListener("click", function() {
            var addressInput = document.getElementById("user-address");
            var editButton = document.getElementById("edit-address");

            if (addressInput.disabled) {
                // 텍스트 상자를 활성화하여 편집 가능하게 만듭니다.
                addressInput.disabled = false;
                addressInput.focus(); // 커서를 텍스트 상자로 이동시킵니다.
                editButton.innerText = "저장"; // 버튼 텍스트를 "저장"으로 변경합니다.
            } else {
                // 수정이 완료되면 텍스트 상자를 비활성화하고 버튼 텍스트를 다시 "수정"으로 변경합니다.
                addressInput.disabled = true;
                editButton.innerText = "수정";
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
