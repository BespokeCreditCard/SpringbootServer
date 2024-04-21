<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<style>
    .custom-file-input {
        opacity: 0;
        width: 0.1px;
        height: 0.1px;
        position: absolute;
        overflow: hidden;
        z-index: -1;
    }

    .custom-file-label {
        background-color: #3498db;
        color: #fff;
        padding: 10px 15px;
        border-radius: 5px;
        border: none;
        cursor: pointer;
        display: inline-block;
    }

    .custom-file-label:hover {
        background-color: #2980b9;
    }

    .edited {
        background-color: #198754 !important;
        border-color: #198754 !important;
        color: white !important;
    }

    .edited:hover{
        background-color: #0c4128 !important;
        border-color: #0c4128 !important;
    }
</style>
<%@ include file="../header/header.jsp" %>
    <div class="container-xxl p-2 m-auto mt-5 border border-primary bg-light rounded border-5" style="min-width: 1500px;">
        <div class="row p-2 align-items-center position-relative">

            <div class="card col-3 m-4" style="width: 18rem;">
                <img src="/imgs/1235.png" id="preview" class="card-img-top p-3" alt="..." onerror="this.onerror=null; this.src='/imgs/1235.png';">
                <div class="card-body h-3 mt-2 text-center">
                    <div class="btn-container my-1">
                        <label for="fileInput" class="custom-file-label">파일 업로드</label>
                        <input type="file" id="fileInput" class="custom-file-input" accept="image/*">
                    </div>
                    <button type="button" id="file-edit-button" class="btn btn-dark " onclick="showModal()">파일 편집기</button>
                </div>
            </div>

            <div class="card col-1 d-flex flex-column gap-2 align-items-center justify-content-center p-3" id="arrowCard" style="width: 400px; display: none; position: relative;">
                <!-- 프롬포트 -->
                <fieldset class="container-lg m-auto border border-primary bg-light rounded border-5" style="min-height: 265px; position: relative;">
                    <legend align="center">프롬프트</legend>
                    <div class=" justify-content-center text-center">
                        <div class="col d-flex">
                            <div class="w-75">
                                <input type="text" id="input1" class="form-control" placeholder="내용 입력">
                            </div>
                            <span class="col p-2">풍의</span>
                        </div>
                        <div class="col d-flex">
                            <div class="w-75">
                                <input type="text" id="input2" class="form-control" placeholder="내용 입력">
                            </div>
                            <span class="col p-2">가</span>
                        </div>
                        <div class="col d-flex">
                            <div class="w-75">
                                <input type="text" id="input3" class="form-control" placeholder="내용 입력">
                            </div>
                            <span class="col p-2">에서</span>
                        </div>
                        <div class="col d-flex">
                            <div class="w-75">
                                <input type="text" id="input4" class="form-control" placeholder="내용 입력">
                            </div>
                            <span class="col p-2">를</span>
                        </div>
                        <div class="col d-flex">
                            <div class="w-75">
                                <input type="text" id="input5" class="form-control" placeholder="내용 입력">
                            </div>
                            <span class="col p-2">한다</span>
                        </div>
                    </div>
                </fieldset>
                <div>
                    <i class="fas fa-arrow-right fa-5x text-primary"></i> <!-- 파란색 화살표 아이콘 -->
                </div>
                <div>
                    <a class="btn btn-primary" id="convertBtn" style="font-size: 17px;width: 100px;">변환</a>
                </div>
                <div>
                    <a class="btn btn-danger" id="resetBtn" style="font-size: 17px;width: 100px;">초기화</a>
                </div>
            </div>

            <div id="loadingDiv" class="position-absolute bg-light h-100 d-flex justify-content-center align-items-center" style="z-index: -1;right:1%;width: 50%">
                <div class="text-center">
                    <h5>프롬포트 변환 중입니다. 잠시만 기다려주세요.</h5>
                    <img id="gifImage2" src="#" alt="GIF Image" style="max-width: 100%; max-height: 100%;">
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

    <!-- 이전 & 다음 버튼 -->
    <div class="container-fluid fixed-bottom" id="prevBtnDiv">
        <div class="row justify-content-start mb-3">
            <div class="col-6">
                <button type="button" class="btn btn-secondary btn-block" onclick="window.location.href='<%= request.getContextPath() %>/recommendation_view/recommendation'">이전</button>
            </div>
            <div class="col-6 text-end">
                <button type="button" class="btn btn-secondary btn-block" onclick="moveToReceiveCardWithUploadedImg()">다음</button>
            </div>
        </div>
    </div>

    <div class="container-fluid fixed-bottom" id="nextBtnDiv">
        <div class="row justify-content-end mb-3">

        </div>
    </div>

    <!-- 모달 창 -->
    <div class="modal fade" id="gifModal" tabindex="-1" aria-labelledby="gifModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-fullscreen modal-dialog-centered">
            <div class="modal-content">
                <div class="modal-header ">
                    <h5 class="modal-title text-center" >파일편집</h5>
                    <div style="padding-left: 20%">
                        <label for="brushSize">펜 굵기:</label>
                        <input type="number" id="brushSize" value="5">
                        <button onclick="saveImage()">Save Image</button>
                    </div>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body d-flex justify-content-center align-items-center"> <!-- Flexbox를 사용하여 가운데 정렬 -->

                    <canvas id="imageCanvas" ></canvas>
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

        document.getElementById("resetBtn").onclick = function () {
            document.getElementById("card1").style.display = "none";
            document.getElementById("card2").style.display = "none";
            document.getElementById('input1').value = '';
            document.getElementById('input2').value = '';
            document.getElementById('input3').value = '';
            document.getElementById('input4').value = '';
            document.getElementById('input5').value = '';

            document.getElementById('fileInput').value = '';
            document.getElementById('preview').src = '/imgs/1235.png';
            document.getElementById("file-edit-button").classList.remove("edited");
            fileDrawn = false;
        }

        // 모달 표시 함수
        function showGIFModal (gifSrc) {
            // var gifModal = new bootstrap.Modal(document.getElementById('gifModal'));
            var gifImage = document.getElementById('gifImage2');
            gifImage.src = gifSrc;
            // gifModal.show();
            document.getElementById("loadingDiv").style.zIndex = "1";

            // 백엔드로 전달
            uploadFile();
            // 백엔드에서 답을 받으면 닫히는 함수를 넣어야함
            setTimeout(function() {
                // gifModal.hide();
                document.getElementById("loadingDiv").style.zIndex = "-1";
                document.getElementById("card1").style.display = "block";
                document.getElementById("card2").style.display = "block";
            }, 1000);

            // 모달이 닫힐 때의 이벤트 리스너 추가
            // gifModal._element.addEventListener('hidden.bs.modal', function () {
            //     // 선택1과 선택2에 해당하는 컨테이너 표시
            //     document.getElementById("card1").style.display = "block";
            //     document.getElementById("card2").style.display = "block";
            // });
        }

        document.querySelector("#card1 .btn").onclick = function() {
            window.location.href = "<%= request.getContextPath() %>/receivecard"; // 선택1을 클릭하면 IssueCard로 이동합니다.
        };

        document.querySelector("#card2 .btn").onclick = function() {
            window.location.href = "<%= request.getContextPath() %>/receivecard"; // 선택2를 클릭하면 IssueCard로 이동합니다.
        };

        const moveToReceiveCardWithUploadedImg = () => {
            let files = document.getElementById("fileInput").files[0];
            if(files) {
                let formData = new FormData();
                formData.append("files", files);
                fetch("/receivecard", {
                    method: "POST",
                    headers: {
                    },
                    body: formData
                }).then((response) => {
                    if(response.status === 200) {
                        window.location.href="/receivecard";
                    }
                })
            } else {
                alert("파일을 업로드해주세오");
                return;
            }
        }
    </script>
    <script>
        // 파일 업로드 하는 함수들 모음 스크립트
        function previewFile() {
            fileDrawn = false;
            document.getElementById("file-edit-button").classList.remove("edited");
            const preview = document.getElementById('preview');
            const fileInput = document.getElementById('fileInput');
            const file = fileInput.files[0];
            const reader = new FileReader();


            reader.addEventListener('load', function () {
                preview.src = reader.result;
            }, false);

            if (file) {
                reader.readAsDataURL(file);
            }
        }

        function uploadFile() {
            const fileInput = document.getElementById('fileInput');
            const file = fileInput.files[0];

            if (file) {
                //파일이 있다면 실행될 함수
                console.log('Selected file:', file);
            } else {
                // 파일이 없다면 실행될 함수
                console.log('No file selected');
            }
        }

        document.getElementById('fileInput').addEventListener('change', previewFile);
    </script>
    <script>

        function showModal() {
            if(document.getElementById('fileInput').files[0]) {
                new bootstrap.Modal(document.getElementById('gifModal')).show();
            } else {
                alert("파일을 업로드해주세요.");
            }
        }

        function setDisable(isTrue) {
            if(isTrue) {
                document.getElementById("input1").value = '';
                document.getElementById("input1").disabled = true;
                document.getElementById("input2").value = '';
                document.getElementById("input2").disabled = true;
                document.getElementById("input3").value = '';
                document.getElementById("input3").disabled = true;
                document.getElementById("input4").value = '';
                document.getElementById("input4").disabled = true;
                document.getElementById("input5").value = '';
                document.getElementById("input5").disabled = true;
            } else {
                document.getElementById("input1").disabled = false;
                document.getElementById("input2").disabled = false;
                document.getElementById("input3").disabled = false;
                document.getElementById("input4").disabled = false;
                document.getElementById("input5").disabled = false;
            }
        }

        // 모달 이미지편집 함수들
        let canvas = document.getElementById('imageCanvas');
        let ctx = canvas.getContext('2d');
        let reader = new FileReader();
        let img = new Image();
        let mousePressed = false;
        let fileDrawn = false;
        let lastX, lastY;

        document.getElementById('fileInput').addEventListener('change', handleImage, false);

        canvas.addEventListener('mousedown', function (e) {
            mousePressed = true;
            let adjustedCoords = getAdjustedCoords(e.pageX, e.pageY);
            draw(adjustedCoords.x, adjustedCoords.y, false);
        });

        canvas.addEventListener('mousemove', function (e) {
            if (mousePressed) {
                let adjustedCoords = getAdjustedCoords(e.pageX, e.pageY);
                draw(adjustedCoords.x, adjustedCoords.y, true);
            }
        });

        canvas.addEventListener('mouseup', function (e) {
            mousePressed = false;
        });

        canvas.addEventListener('mouseleave', function (e) {
            mousePressed = false;
        });

        function getAdjustedCoords(pageX, pageY) {
            // 모달 창의 위치와 크기를 확인하고, 그에 맞게 좌표값을 조정
            let modal = document.getElementById('gifModal'); // 모달의 ID로 변경
            let modalRect = modal.getBoundingClientRect();
            let canvasRect = canvas.getBoundingClientRect();
            let adjustedX = pageX - canvasRect.left + modalRect.left;
            let adjustedY = pageY - canvasRect.top + modalRect.top;
            return { x: adjustedX, y: adjustedY };
        }

        function draw(x, y, isDown) {
            if(!fileDrawn) {
                let fileEditButton = document.getElementById("file-edit-button");
                fileEditButton.classList.add("edited");
            }
            fileDrawn = true;
            setDisable(false);
            if (isDown) {
                ctx.beginPath();
                ctx.globalCompositeOperation = "destination-out"
                ctx.lineWidth = document.getElementById('brushSize').value;
                ctx.lineJoin = "round";
                ctx.moveTo(lastX, lastY);
                ctx.lineTo(x, y);
                ctx.closePath();
                ctx.stroke();
            }
            lastX = x; lastY = y;
        }

        function handleImage(e) {
            setDisable(true);
            let reader = new FileReader();
            reader.onload = function (event) {
                img.onload = function () {
                    canvas.width = img.width;
                    canvas.height = img.height;
                    ctx.drawImage(img, 0, 0);
                }
                img.src = event.target.result;
            }
            reader.readAsDataURL(e.target.files[0]);
        }

        function saveImage() {
            let image = canvas.toDataURL("image/png").replace("image/png", "image/octet-stream");
            let link = document.createElement('a');
            link.download = "my-image.png";
            link.href = image;
            link.click();
        }
    </script>
</body>
</html>
