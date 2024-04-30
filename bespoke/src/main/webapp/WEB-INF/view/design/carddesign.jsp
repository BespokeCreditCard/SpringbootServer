<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">

<link rel="stylesheet" type="text/css" href="/css/aigenerator.css">
<style>
    .fade-in {
        opacity: 0;
        animation: fadeIn 1s ease-in forwards;
    }
    @keyframes fadeIn {
        from {
            opacity: 0;
            transform: translateY(-20px);
        }
        to {
            opacity: 1;
            transform: translateY(0);

        }
    }
</style>
<%@ include file="../header/header.jsp" %>
    <div class="container-xxl shadow-lg p-2 m-auto mt-5 bg-white rounded border-5" style="min-width: 1500px; font-family: 'KCC-Hanbit';">
        <div class="d-flex p-2 align-items-center justify-content-between">
            <h2>카드꾸미기</h2>
            <a class="btn btn-danger" id="resetBtn" style="font-size: 17px;width: 100px;">초기화</a>
        </div>
        <div id="generateDiv" class="row p-2 align-items-center position-relative center-div">

			<div class="card col-3 m-4" style="width: 18rem; height: 32rem;">
				<div id="previewDiv" style="position: relative; overflow: hidden; display: flex; justify-content: center; align-items: center; width: 100%; height: 100%; object-fit: contain;">
				    <img src="${selectImageUrl}" id="preview" style="max-width: 90%; max-height: 90%;">
				</div>
                <div class="card-body h-3 text-center">
                    <div class="btn-container my-1">
                        <label for="fileInput" class="custom-file-label w-75">파일 업로드</label>
                        <input type="file" id="fileInput" class="custom-file-input" accept="image/*">
                    </div>
                    <button type="button" id="file-edit-button" class="btn btn-dark w-75" onclick="showModal()">파일 편집기</button>
                    <div class="my-1">
                        <button type="button" id="nonFileImgButton" class="btn btn-primary w-75" onclick="moveToReceiveCardWithUploadedImg()">현재 카드 선택</button>
                    </div>
                </div>
            </div>

            <div class="card col-1 d-flex flex-column gap-2 align-items-center justify-content-center p-3" id="arrowCard" style="width: 55%; height: 32rem; display: none; position: relative;">
                <!-- 프롬프트 -->
                <fieldset class="container-lg m-auto rounded border-5" style="height: 100%;position: relative;">
                    <div class="d-flex align-items-center justify-content-between">
					    <h3 class="fw-bold" style="flex: 1; text-align:center;">프롬프트 작성</h3>
					    <a class="btn btn-primary" id="convertBtn" style="font-size: 17px;width: 100px;">변환</a>
					</div>
                    <div class=" justify-content-center">
                        <span class="fw-bold">화풍</span>
                        <div class="col d-flex mb-1">
							<select id="select1" class="form-select" onchange="promptStyle(this);">
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
                        <span class="fw-bold">프롬프트1</span>
                        <div class="col d-flex mb-1">
                        	<div style="width:86%;">
	                        	<select id="prompt1" class="form-select" onchange="selectedprompt1(this);">
									<option value="">(필수) 1번 프롬프트 선택</option>
									<option value="선글라스">선글라스</option>
									<option value="의자">의자</option>
									<option value="축구공">축구공</option>
									<option value="컴퓨터">컴퓨터</option>
									<option value="텐트">텐트</option>
								</select>
							</div>
							<div style="display: flex; align-items: center; justify-content: flex-end;">
								<h5>&nbsp;&nbsp;<b>을/를</b></h5>
							</div>
                        </div>
                        <span class="fw-bold">프롬프트2</span>
                        <div class="col d-flex mb-1">
                        	<div style="width:86%;">
	                        	<select id="prompt2" class="form-select" onchange="selectedprompt2(this);">
									<option value="">(선택) 2번 프롬프트 선택</option>
									<option value="구매">구매</option>
									<option value="설치">설치</option>
									<option value="수리">수리</option>
									<option value="착용">착용</option>
									<option value="활용">활용</option>
								</select>
							</div>
							<div style="display: flex; align-items: center; justify-content: flex-end;">
								<h5>&nbsp;&nbsp;<b>하고/하는</b></h5>
							</div>
                        </div>
                        <span class="fw-bold">프롬프트3</span>
                        <div class="col d-flex mb-1">
                        	<div style="width:86%;">
	                        	<select id="prompt3" class="form-select" onchange="selectedprompt3(this);">
									<option value="">(선택) 3번 프롬프트 선택</option>
									<option value="도시">도시</option>
									<option value="산">산</option>
									<option value="바다">바다</option>
									<option value="북유럽">북유럽</option>
									<option value="판매점">판매점</option>
								</select>
							</div>
							<div style="display: flex; align-items: center; justify-content: flex-end;">
								<h5>&nbsp;&nbsp;<b>으로/로</b></h5>
							</div>
                        </div>
                        <span class="fw-bold">프롬프트4</span>
                        <div class="col d-flex mb-1">
                        	<div style="width:86%;">
	                        	<select id="prompt4" class="form-select" onchange="selectedprompt4(this);">
									<option value="">(필수) 4번 프롬프트 선택</option>
									<option value="놀러">놀러</option>
									<option value="쇼핑을">쇼핑을</option>
									<option value="싸움을">싸움을</option>
									<option value="일하러">일하러</option>
									<option value="평평">평평</option>
								</select>
							</div>
							<div style="display: flex; align-items: center; justify-content: flex-end;">
								<h5>&nbsp;&nbsp;<b>간/한</b></h5>
							</div>
                        </div>
                        <span class="fw-bold">프롬프트5</span>
                        <div class="col d-flex mb-1">
	                        <div style="width:86%;">
	                        	<select id="prompt5" class="form-select" onchange="selectedprompt5(this);">
									<option value="">(필수) 5번 프롬프트 선택</option>
									<option value="강아지">강아지</option>
									<option value="고양이">고양이</option>
									<option value="사람">사람</option>
									<option value="평지">평지</option>
									<option value="햄스터">햄스터</option>
								</select>
							</div>
							<div style="display: flex; align-items: center; justify-content: flex-end;">
								<h5>&nbsp;&nbsp;<b>.</b></h5>
							</div>
                        </div>
                    </div>
                </fieldset>
            </div>
            <div class="card p-3 text-center"  style="width: 20%; height: 32rem; margin-left: 1.5rem; position: relative;">
                <h3 class="fw-bold">작성안내</h3>
                <br/>
                <h5 class="fw-bold">1. 프롬프트</h5>
				<p style="text-align: left; margin-left: 25%;">
					a. <b style="color: blue;">프롬프트</b> 작성<br/>b. <b style="color: blue;">변환</b> 버튼 클릭
				</p>
				<br/>
                <h5 class="fw-bold">2. 이미지</h5>
				<p style="text-align: left; margin-left: 25%;">
					a. <b style="color: blue;">파일 업로드</b><br/>b. <b style="color: blue;">변환</b> 버튼 클릭
				</p>
				<br/>
                <h5 class="fw-bold">3. 이미지 + 프롬프트</h5>
				<p style="text-align: left; margin-left: 25%;">
					a. <b style="color: blue;">파일 업로드</b><br/>b. <b style="color: blue;">파일 편집기</b>로 마스킹<br/>c. <b style="color: blue;">프롬프트</b> 작성<br/>d. <b style="color: blue;">변환</b> 버튼 클릭
				</p>
                <h6 class="fw-bold">※ 프롬프트 부분 생략 가능</h6>
            </div>
        </div>
		<div id="resultDiv" class="row p-2 align-items-center position-relative center-div justify-content-center" style="display: none; min-height: 580px">

            <div id="loadingDiv" class="position-absolute d-flex gap-4 align-items-center justify-content-center"  style="width: 50%; height: 50%;right: 25%;">
                <div>로딩 중입니다...</div>
                <div class="spinner-border text-primary" role="status" style="width: 5rem; height: 5em;">
                    <span id="loadingGif" class="sr-only">Loading...</span>
                </div>
            </div>

			<div id="errorMessageContainer" class="position-absolute bg-light h-100 d-flex justify-content-center align-items-center" style="z-index: -1;right:1%;width: 50%">
			</div>

			<div id="card1Div" class="card col-3 m-4" style="width: 18rem; height: 32rem; display: none;border:none">
	            <div id="card1" class="fade-in" style="height: 85%; position: relative; top: 3%;  border-radius: 5%; overflow: hidden;">
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
                    <a class="btn btn-primary w-75" id="selectGeneratedImg1">선택 1</a>
                </div>
			</div>

			<div id="card2Div" class="card col-3 m-4" style="width: 18rem; height: 32rem; display: none;border:none">
	            <div id="card2" class="fade-in" style="height: 85%; position: relative; top: 3%;  border-radius: 5%; overflow: hidden;">
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
                    <a class="btn btn-primary w-75" id="selectGeneratedImg2">선택 2</a>
                </div>
            </div>
            <div id="card3Div" class="card col-3 m-4" style="width: 18rem; height: 32rem; display: none;border:none">
                <div id="card3" class="fade-in" style="height: 85%; position: relative; top: 3%;  border-radius: 5%; overflow: hidden;">
                    <!-- 위쪽 20%를 차지하는 네모 박스 -->
                    <div class="img3-shadow" style="position: absolute; top: 0; left: 0; width: 100%; height: 30%; background-color: black; opacity: 0.45; z-index: 3;"></div>
                    <!-- 로컬 폰트를 적용할 div -->
                    <div id="woori_text" class="img3-text">Woori Card</div>
                    <!-- 이미지들 -->
                    <img src="${selectImageUrl}" id="generatedImg3" alt="..." style="height: 100%; width: 100%; position: relative; top: 0px; left: 0; z-index: 1;">
                    <img id="icImage" class="img3-ic"  src="${pageContext.request.contextPath}/imgs/12345.jpg" style="transform: rotate(90deg); height: 10%; position: absolute; top: 10%; left: 45%; z-index: 3;" />
                    <img id="masterCardLogo" class="img3-logo" src="${pageContext.request.contextPath}/imgs/master.png" style="height: 25%; position: absolute; top: 77%; left: 60%; z-index: 3;" />
                </div>
                <div class="btn-container d-flex justify-content-center align-items-center" style="position: absolute; bottom: 10px; left: 0; right: 0;">
                    <a class="btn btn-primary w-75" onclick="moveToReceiveCardWithUploadedImg()">기존 이미지 선택</a>
                </div>
            </div>
        </div>
    </div>

    <!-- 이전 & 다음 버튼 -->
    <div class="container-fluid fixed-bottom" id="prevBtnDiv" style="display: none">
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

    <!-- 로딩 모달 창 -->
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
                <!-- Flexbox를 사용하여 가운데 정렬 -->
                <div class="modal-body d-flex justify-content-center align-items-center">
                	<!-- 업로드를 안하면 preview 이미지 사용 -->
					<img id="modalDefaultImage" src="${selectImageUrl}" style="display: none;">
                    <canvas id="imageCanvas"></canvas>
                </div>
            </div>
         </div>
    </div>
    <script>
        var selectImageUrl ='${selectImageUrl}'
    </script>
    <script>var contextPath = "<%= request.getContextPath() %>";</script>
	<script src="/js/CardDesign.js"></script>
</body>
</html>