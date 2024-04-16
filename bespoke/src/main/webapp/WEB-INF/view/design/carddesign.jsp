<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<%@ include file="../header/header.jsp" %>
    <div class="container-lg h-1000 p-2 m-auto border border-primary bg-light rounded border-5">
        <div class="row p-2 align-items-center ">

            <div class="card col-3 m-4" style="width: 18rem;">
                <img src="/imgs/1235.png" class="card-img-top p-3" alt="...">
                <div class="card-body h-3 mt-2 text-center">
                    <div class="btn-container mt-1">
                        <a class="btn btn-primary">파일 업로드</a>
                    </div>
                </div>
            </div>

            <div class="card col-1 d-flex align-items-center justify-content-center" id="arrowCard" style="width: 18rem; display: none; position: relative;">
                <div>
                    <i class="fas fa-arrow-right fa-5x text-primary"></i> <!-- 파란색 화살표 아이콘 -->
                    <a class="btn btn-primary" id="convertBtn" style="position: absolute; bottom: -50px; left: 40%; font-size: 17px;">변환</a>
                </div>
                <div>
                    <label for="imageCheckbox" style="font-size: 20px;">No Image</label>
                    <input type="checkbox" id="imageCheckbox">
                </div>
            </div>

            <div class="card col-3 p-2 m-4" id="card1" style="width: 18rem; display: none;">
                <img src="/imgs/1235.png" class="card-img-top p-4" alt="...">
                <div class="btn-container d-flex justify-content-center align-items-center">
                    <a class="btn btn-primary">선택 1</a>
                </div>
            </div>

            <div class="card col-3 p-2 m-4" id="card2" style="width: 18rem; display: none;">
                <img src="/imgs/1235.png" class="card-img-top p-4" alt="...">
                <div class="btn-container d-flex justify-content-center align-items-center">
                    <a class="btn btn-primary">선택 2</a>
                </div>
            </div>
        </div>
    </div>

    <!-- 프롬포트 -->
    <div class="container-lg mt-4 m-auto border border-primary bg-light rounded border-5">
        <div class="row">
            <div class="card row-3" style="width: 100%;">
                <div class="row justify-content-center text-center">
                    <div class="col">
                        <input type="text" class="form-control" placeholder="내용 입력">
                    </div>
                    <span class="col p-2">풍의</span>
                    <div class="col">
                        <input type="text" class="form-control" placeholder="내용 입력">
                    </div>
                    <span class="col p-2">가</span>
                    <div class="col">
                        <input type="text" class="form-control" placeholder="내용 입력">
                    </div>
                    <span class="col p-2">에서</span>
                    <div class="col">
                        <input type="text" class="form-control" placeholder="내용 입력">
                    </div>
                    <span class="col p-2">를</span>
                    <div class="col">
                        <input type="text" class="form-control" placeholder="내용 입력">
                    </div>
                    <span class="col p-2">한다</span>
                </div>
            </div>
        </div>
    </div>

    <!-- 이전 & 다음 버튼 -->
    <div class="container-fluid fixed-bottom" id="prevBtnDiv">
        <div class="row justify-content-start mb-3">
            <div class="col-6">
                <button type="button" class="btn btn-secondary btn-block" onclick="window.location.href='<%= request.getContextPath() %>/carddesign'">이전</button>
            </div>
            <div class="col-6 text-end">
                <button type="button" class="btn btn-secondary btn-block" onclick="window.location.href='<%= request.getContextPath() %>/issuecard'">다음</button>
            </div>
        </div>
    </div>
    
    <div class="container-fluid fixed-bottom" id="nextBtnDiv">
        <div class="row justify-content-end mb-3">

        </div>
    </div>

    <!-- 모달 창 -->
    <div class="modal fade" id="gifModal" tabindex="-1" aria-labelledby="gifModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-lg modal-dialog-centered">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title text-center" id="gifModalLabel">프롬포트 변환 중입니다. 잠시만 기다려주세요</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body d-flex justify-content-center align-items-center"> <!-- Flexbox를 사용하여 가운데 정렬 -->
                    <img id="gifImage" src="" alt="GIF Image" class="img-fluid" style="width: 500px;">
                </div>
            </div>
         </div>
    </div>

    <script>
        // 변환 버튼 클릭 시
        document.getElementById("convertBtn").onclick = function() {
            document.getElementById("arrowCard").style.display = "block";
            document.getElementById("prevBtnDiv").style.display = "block";
            document.getElementById("nextBtnDiv").style.display = "block";

            // 모달 표시
            var gifSrc = "/img/loading.gif"; // 로딩 GIF 이미지 경로
            showGIFModal(gifSrc);
        };

        // 모달 표시 함수
        function showGIFModal(gifSrc) {
            var gifModal = new bootstrap.Modal(document.getElementById('gifModal'));
            var gifImage = document.getElementById('gifImage');
            gifImage.src = gifSrc;
            gifModal.show();

            // 모달이 닫힐 때의 이벤트 리스너 추가
            gifModal._element.addEventListener('hidden.bs.modal', function () {
                // 선택1과 선택2에 해당하는 컨테이너 표시
                document.getElementById("card1").style.display = "block";
                document.getElementById("card2").style.display = "block";
            });
        }

        document.querySelector("#card1 .btn").onclick = function() {
            window.location.href = "<%= request.getContextPath() %>/issuecard"; // 선택1을 클릭하면 IssueCard로 이동합니다.
        };

        document.querySelector("#card2 .btn").onclick = function() {
            window.location.href = "<%= request.getContextPath() %>/issuecard"; // 선택2를 클릭하면 IssueCard로 이동합니다.
        };
    </script>

</body>
</html>
