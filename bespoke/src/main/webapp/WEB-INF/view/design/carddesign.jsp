<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">

<link rel="stylesheet" type="text/css" href="/css/aigenerator.css">
<%@ include file="../header/header.jsp" %>
    <div class="container-xxl p-2 m-auto mt-5 border border-primary bg-light rounded border-5" style="min-width: 1500px;">
        <div class="row p-2 align-items-center position-relative center-div">

			<div class="card col-3 m-4" style="width: 18rem; height: 32rem;">
				<div id="previewDiv" style="position: relative; overflow: hidden; display: flex; justify-content: center; align-items: center; width: 100%; height: 100%; object-fit: contain;">
				    <img src="${selectImageUrl}" id="preview" style="max-width: 90%; max-height: 90%;">
				</div>
                <div class="card-body h-3 text-center">
                    <div class="btn-container my-1">
                        <label for="fileInput" class="custom-file-label">파일 업로드</label>
                        <input type="file" id="fileInput" class="custom-file-input" accept="image/*">
                    </div>
                    <button type="button" id="file-edit-button" class="btn btn-dark " onclick="showModal()">파일 편집기</button>
                </div>
            </div>

            <div class="card col-1 d-flex flex-column gap-2 align-items-center justify-content-center p-3" id="arrowCard" style="width: 400px; height: 32rem; display: none; position: relative;">
                <!-- 프롬프트 -->
                <fieldset class="container-lg m-auto border border-primary bg-light rounded border-5" style="min-height: 265px; position: relative;">
                    <legend align="center">프롬프트</legend>
                    <div class=" justify-content-center text-center">
                        <div class="col d-flex">
                                <select id="select1" class="form-control" onchange="promptStyle(this);">
							            <option value="">화풍(스타일) 선택</option>
							            <option value="Hyperrealism">극사실주의</option>
							            <option value="Surrealism">초현실주의</option>
							            <option value="Animation">애니메이션</option>
							            <option value="Futurism">미래주의</option>
							            <option value="Pop Art">팝 아트</option>
							            <option value="Minimalism">미니멀리즘</option>
							            <option value="Impressionism">인상주의</option>
							            <option value="Expressionism">표현주의</option>
							            <option value="Cubism">입체주의</option>
							            <option value="Abstract Art">추상주의</option>
							            <option value="Renaissance">르네상스</option>
							            <option value="Baroque">바로크</option>
							            <option value="Traditional Korean Painting">전통 한국화</option>
							            <option value="Sketch">스케치</option>
							            <option value="Graffiti">그라피티</option>
							            <option value="Three Kingdoms Period Murals">삼국시대 벽화</option>
							    </select>
                        </div>
                        <div class="col d-flex">
                                <input type="text" id="promptDoing" class="form-control" placeholder="~에서">
                        </div>
                        <div class="col d-flex">
                                <input type="text" id="promptWho" class="form-control" placeholder="~가">
                        </div>
                        <div class="col d-flex">
                                <input type="text" id="promptWhere" class="form-control" placeholder="~에서/~와">
                        </div>
                        <div class="col d-flex">
                                <input type="text" id="promptWhat" class="form-control" placeholder="~를">
                        </div>
                        <div class="col d-flex">
                                <input type="text" id="promptHow" class="form-control" placeholder="~한다">
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
                    <img id="gifImage2" src="/img/loading.gif" alt="GIF Image" style="max-width: 100%; max-height: 100%;">
                </div>
            </div>
			
			<div id="errorMessageContainer" class="position-absolute bg-light h-100 d-flex justify-content-center align-items-center" style="z-index: -1;right:1%;width: 50%">
			</div>
			
			<div id="card1Div" class="card col-3 m-4" style="width: 18rem; height: 32rem; display: none;">
	            <div id="card1" style="height: 85%; position: relative; top: 3%;  border-radius: 5%; overflow: hidden;">
    			    <!-- 위쪽 20%를 차지하는 네모 박스 -->
				    <div style="position: absolute; top: 0; left: 0; width: 100%; height: 30%; background-color: black; opacity: 0.45; z-index: 3;"></div>
					<!-- 로컬 폰트를 적용할 div -->
				    <div id="woori_text">Woori Card</div>
				    <!-- 이미지들 -->
	                <img src="/imgs/1235.png" id="generatedImg1" alt="..." style="height: 100%; width: 100%; position: relative; top: 0px; left: 0; z-index: 1;">
				    <img id="icImage" src="${pageContext.request.contextPath}/imgs/12345.jpg" style="transform: rotate(90deg); height: 10%; position: absolute; top: 10%; left: 45%; z-index: 3;" />
				   	<img id="masterCardLogo" src="${pageContext.request.contextPath}/imgs/master.png" style="height: 25%; position: absolute; top: 77%; left: 60%; z-index: 3;" />
	            </div>
                <div class="btn-container d-flex justify-content-center align-items-center" style="position: absolute; bottom: 10px; left: 0; right: 0;">
                    <a class="btn btn-primary" id="selectGeneratedImg1">선택 1</a>
                </div>
			</div>
			
			<div id="card2Div" class="card col-3 m-4" style="width: 18rem; height: 32rem; display: none;">
	            <div id="card2" style="height: 85%; position: relative; top: 3%;  border-radius: 5%; overflow: hidden;">
					<!-- 위쪽 20%를 차지하는 네모 박스 -->
				    <div style="position: absolute; top: 0; left: 0; width: 100%; height: 30%; background-color: black; opacity: 0.45; z-index: 3;"></div>
					<!-- 로컬 폰트를 적용할 div -->
				    <div id="woori_text">Woori Card</div>
				    <!-- 이미지들 -->
	                <img src="/imgs/1235.png" id="generatedImg2" alt="..." style="height: 100%; width: 100%; position: relative; top: 0px; left: 0; z-index: 1;">
				    <img id="icImage" src="${pageContext.request.contextPath}/imgs/12345.jpg" style="transform: rotate(90deg); height: 10%; position: absolute; top: 10%; left: 45%; z-index: 3;" />
				   	<img id="masterCardLogo" src="${pageContext.request.contextPath}/imgs/master.png" style="height: 25%; position: absolute; top: 77%; left: 60%; z-index: 3;" />                 
                </div>
                <div class="btn-container d-flex justify-content-center align-items-center" style="position: absolute; bottom: 10px; left: 0; right: 0;">
                    <a class="btn btn-primary" id="selectGeneratedImg2">선택 2</a>
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
    <script>var contextPath = "<%= request.getContextPath() %>";</script>
	<script src="https://sdk.amazonaws.com/js/aws-sdk-2.1043.0.min.js"></script>
	<script src="/js/aigenerator.js"></script>
</body>
</html>