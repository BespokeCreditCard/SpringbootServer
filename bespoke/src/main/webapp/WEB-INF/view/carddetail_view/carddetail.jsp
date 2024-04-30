<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <%@ include file="../header/header.jsp" %>
    <style>
        th, td {
            border: 1px solid black;
            text-align: center;
        }
	</style>
</head>
<body>
    <div class="container mt-5">
    	<div class="row">
			<div class="col">
            	<div class="container-lg p-1 mb-4 border rounded border-5">
                   	<div class="row align-items-center">
                   		<div class="col-md-2 d-flex justify-content-center">
                   			<img src="https://bespokecreditcard-bucket.s3.ap-northeast-2.amazonaws.com/index_img/bcc_014.png" class="card-img" alt="Card Image" style="width: 150px;">
                   		</div>
                   		
                   		<div class="col-md-8" style="overflow-y: scroll; max-height: 300px;">
                   			<p class="card-text">
                   				<ul>
                   					<li>카드 이름: 카드의정석 댕댕냥이(강아지)</li>
                   					<li>카드 형식: 신용카드</li>
                                    <li>국내 연회비: 10,000</li>
                                    <li>해외 연회비: 12,000</li>
                                    <li>전월 실적(만원): 30</li>
                                    <br>
                                    <li>분류: 동물병원</li>
                                    <li>혜택: 동물병원 10% 청구할인</li>
                                    <li>상세혜택:  <p><strong>동물병원 10% 청구할인</strong></p>
                                    			<p>- 애완동물, 동물병원 업종 전체(반려동물 용품샵, 애견미용샵, 동물병원 등)</p>
                                    			<p><strong>쇼핑할인의 정석 월 할인한도</strong></p>
                                    			<table border="0" cellpadding="0" cellspacing="0" class="b-table" width="100%"><tbody><tr class="b-table-top"><td class="b-table-top" rowspan="2">구분</td><td class="b-table-top" colspan="3">전월 국내 가맹점 이용금액</td></tr><tr class="b-table-top"><td class="b-table-b"><p>30만원 이상~70만원 미만</p></td><td class="b-table-b"><p>70만원 이상~120만원 미만</p></td><td class="b-table-b"><p>120만원 이상~</p></td></tr><tr><td class="b-table-b">온라인</td><td align="center">4천원</td><td align="center">8천원</td><td align="center">16천원</td></tr><tr><td class="b-table-b">오프라인</td><td align="center">6천원</td><td align="center">12천원</td><td align="center">24천원</td></tr><tr><td class="b-table-b">합계</td><td align="center">1만원</td><td align="center">2만원</td><td align="center">4만원</td></tr></tbody></table>
                   								</p>
           							</li>
                   				</ul>
                   			</p>
                   		</div>
                        <div class="col-md-2 text-center">
                            <form id="selectCardId" action="/design/carddesign" method="GET">
                           		<input type="hidden" id="cardSelectId" name="selectCardId" value="14">
                                <button type="submit" class="btn btn-secondary">카드 선택</button>
                            </form>
                    	</div>
    				</div>
   				</div>
			</div>
   		</div>
	</div>

	<div class="container mt-5">
    	<div class="row">
			<div class="col">
            	<div class="container-lg p-1 mb-4 border rounded border-5">
                   	<div class="row align-items-center">
                   		<div class="col-md-2 d-flex justify-content-center">
                   			<img src="https://bespokecreditcard-bucket.s3.ap-northeast-2.amazonaws.com/index_img/bcc_098.png" class="card-img" alt="Card Image" style="width: 150px;">
                   		</div>
                   		
                   		<div class="col-md-8" style="overflow-y: scroll; max-height: 300px;">
                   			<p class="card-text">
                   				<ul>
                   					<li>카드 이름: 카드의정석 오하CHECK</li>
                   					<li>카드 형식: 체크카드</li>
                                    <li>국내 연회비: 없음</li>
                                    <li>해외 연회비: 없음</li>
                                    <li>전월 실적(만원): 20</li>
                                    <br>
                                    <li>분류: 온라인쇼핑</li>
                                    <li>혜택: [오늘 하루 SHOPPING] 온라인 쇼핑 5% 캐시백</li>
                                    <li>상세혜택:  <p><strong>[오늘 하루 SHOPPING] 온라인 쇼핑 5% 캐시백</strong></p><p>- 쿠팡, 무신사, 지그재그</p><p>- 매출 건당 최대 1천원까지 캐시백 제공</p><p>- 쿠팡 : 일반결제 및 쿠페이 결제 시 캐시백 제공(<u>쿠팡로켓와우 및 기타 간편결제 건 캐시백 제외</u>)</p><p>- 무신사, 지그재그 : 공식 앱 및 홈페이지를 통한 결제 건에 한하며, <u>네이버페이,우리페이로 승인된 매출은 캐시백 제외</u></p>
           							</li>
                   				</ul>
                   			</p>
                   		</div>
                        <div class="col-md-2 text-center">
                            <form id="selectCardId" action="/design/carddesign" method="GET">
                           		<input type="hidden" id="cardSelectId" name="selectCardId" value="98">
                                <button type="submit" class="btn btn-secondary">카드 선택</button>
                            </form>
                    	</div>
    				</div>
   				</div>
			</div>
   		</div>
	</div>

	<div class="container mt-5">
    	<div class="row">
			<div class="col">
            	<div class="container-lg p-1 mb-4 border rounded border-5">
                   	<div class="row align-items-center">
                   		<div class="col-md-2 d-flex justify-content-center">
                   			<img src="https://bespokecreditcard-bucket.s3.ap-northeast-2.amazonaws.com/index_img/bcc_118.png" class="card-img" alt="Card Image" style="width: 150px;">
                   		</div>
                   		
                   		<div class="col-md-8" style="overflow-y: scroll; max-height: 300px;">
                   			<p class="card-text">
                   				<ul>
                   					<li>카드 이름: CJ ONE 우리카드 체크</li>
                   					<li>카드 형식: 체크카드</li>
                                    <li>국내 연회비: 없음</li>
                                    <li>해외 연회비: 없음</li>
                                    <li>전월 실적(만원): 20</li>
                                    <br>
                                    <li>분류: 대중교통</li>
                                    <li>혜택: 버스, 지하철 3천원 캐시백</li>
                                    <li>상세혜택:  <p><strong>버스, 지하철 3천원 캐시백</strong></p><p>- 후불교통카드로 버스, 지하철 합산 이용금액 7만원 이상 시 3천원 캐시백</p><p>- 통합 월 1회</p><p>- 캐시백 금액은 월간 통합 캐시백 한도 내에서 제공</p><p> * 대중교통은 후불교통요금 (명세서에 ‘교통-버스’, ‘교통-지하철’로 표시되는 매출)에 한하며 <u>고속버스, 공항버스, 공항철도(직통열차)는 대상 제외</u></p>
           							</li>
                   				</ul>
                   			</p>
                   		</div>
                        <div class="col-md-2 text-center">
                            <form id="selectCardId" action="/design/carddesign" method="GET">
                           		<input type="hidden" id="cardSelectId" name="selectCardId" value="118">
                                <button type="submit" class="btn btn-secondary">카드 선택</button>
                            </form>
                    	</div>
    				</div>
   				</div>
			</div>
   		</div>
	</div>

	<div class="container mt-5">
    	<div class="row">
			<div class="col">
            	<div class="container-lg p-1 mb-4 border rounded border-5">
                   	<div class="row align-items-center">
                   		<div class="col-md-2 d-flex justify-content-center">
                   			<img src="https://bespokecreditcard-bucket.s3.ap-northeast-2.amazonaws.com/index_img/bcc_131.png" class="card-img" alt="Card Image" style="width: 150px;">
                   		</div>
                   		
                   		<div class="col-md-8" style="overflow-y: scroll; max-height: 300px;">
                   			<p class="card-text">
                   				<ul>
                   					<li>카드 이름: 카드의정석 COOKIE CHECK</li>
                   					<li>카드 형식: 체크카드</li>
                                    <li>국내 연회비: 없음</li>
                                    <li>해외 연회비: 없음</li>
                                    <li>전월 실적(만원): 20</li>
                                    <br>
                                    <li>분류: 해외이용</li>
                                    <li>혜택: 해외가맹점(해외직구 포함) 이용금액의 1~2% 캐시백</li>
                                    <li>상세혜택:  <p><strong>해외가맹점(해외직구 포함) 이용금액의 1~2% 캐시백</strong></p><p>- 건당 이용금액 1만원 이상 30만원 미만 시: 이용금액의 1%캐시백</p><p>- 건당 이용금액 30만원 이상 시: 이용금액의 2%캐시백</p><p>- 월 5만원 통합한도</p><p>- 캐시백 조건 : 전월 국내 가맹점 이용금액 20만원 이상 시 제공</p><p>- 캐시백 방법 : 해당 카드 결제일에 결제계좌로 일괄 입금</p><p>- 해외 이용금액은 우리카드 전산상 해외가맹점 매출로 분류된 경우에 한하며, 당사 매출표 접수일 기준으로 반영됩니다.</p><p>- Master Card 브랜드로 발급시 제공</p><p><br></p><p><strong>해외이용 수수료 면제</strong></p><p>- 해외 가맹점 물품 구매시 건당 $0.5(면제)</p><p>- 전월 카드 이용실적에 관계 없이 제공</p><p>- Master Card 브랜드로 발급시 제공</p>
           							</li>
                   				</ul>
                   			</p>
                   		</div>
                        <div class="col-md-2 text-center">
                            <form id="selectCardId" action="/design/carddesign" method="GET">
                           		<input type="hidden" id="cardSelectId" name="selectCardId" value="131">
                                <button type="submit" class="btn btn-secondary">카드 선택</button>
                            </form>
                    	</div>
    				</div>
   				</div>
			</div>
   		</div>
	</div>

	<div class="container mt-5">
    	<div class="row">
			<div class="col">
            	<div class="container-lg p-1 mb-4 border rounded border-5">
                   	<div class="row align-items-center">
                   		<div class="col-md-2 d-flex justify-content-center">
                   			<img src="https://bespokecreditcard-bucket.s3.ap-northeast-2.amazonaws.com/index_img/bcc_050.png" class="card-img" alt="Card Image" style="width: 150px;">
                   		</div>
                   		
                   		<div class="col-md-8" style="overflow-y: scroll; max-height: 300px;">
                   			<p class="card-text">
                   				<ul>
                   					<li>카드 이름: CGV 우리카드</li>
                   					<li>카드 형식: 신용카드</li>
                                    <li>국내 연회비: 20,000</li>
                                    <li>해외 연회비: 20,000</li>
                                    <li>전월 실적(만원): 30</li>
                                    <br>
                                    <li>분류: 영화</li>
                                    <li>혜택: CGV 영화관람권 1매 무료 예매, CGV 영화관람권 5천원 할인\nCGV 매점 콤보 할인</li>
                                    <li>상세혜택:  <p><strong>CGV 영화관람권 1매 무료 예매</strong></p><p>- 영화관람권 1매 무료 제공</p><p>- 통합 월 1회 / 연 12회 제공</p><p>* CGV 홈페이지, 모바일 APP 내 ‘신용/체크카드‘ - ‘우리카드’ - ‘CGV 우리카드 즉시할인’ 탭에서 결제 시 제공</p><p>* 영화등급 2D 일반영화에 한해 예매 가능</p><p>* 전월 국내가맹점 이용실적 30만원 이상 시 제공</p><p><br></p><p><strong>CGV 영화관람권 5천원 할인</strong></p><p>- 결제 건당 1만원 이상 결제 시 5천원 즉시할인</p><p>- 통합 월 1회 / 연 12회 제공</p><p>* CGV 홈페이지, 모바일 APP에서 '신용/체크카드' - '우리카드' - 'CGV 우리카드 즉시할인' 탭에서 결제 시 제공</p><p>* 영화등급 2D 일반영화에 한해 예매 가능</p><p>* "CGV 영화관람권 1매 무료 예매" 사용 후 익일부터 할인 서비스 적용 가능</p><p>* 전월 국내가맹점 이용실적 30만원 이상 시 제공</p><p><br></p><p><strong>CGV 매점 콤보 할인</strong></p><p><u>- 콤보 제품 2천원 즉시할인(단, 프로모션 콤보 제품 제외)</u></p><p>- 통합 월 2회 / 연 12회 제공</p><p>* CGV 매장 매점에서 CGV 우리카드 실물카드로 현장인증 후 할인 제공</p><p>* 전월실적 조건없음</p><p><u>* 서비스 제외 매장 : CGV 남주안, CGV당진, CGV불광, CGV성남모란, CGV안동, CGV용인, CGV이천 , CGV정읍, CGV주안역, CGV청담씨네시티, CGV청주성안길, CGV화정, CGV Drive in 곤지암, CGV Drive in 스퀘어원 (서비스 제외 매장은 CGV의 사정으로 인해 변경/추가될 수 있습니다.)</u></p><p><br></p><p><strong>유의사항</strong></p><p>- 영화 예매 이후 예매 취소하시면 할인 가능 횟수는 복구됩니다.</p><p>- 영화할인 서비스를 모두 이용한 경우 ‘신용/체크카드‘ - ‘우리카드’ - ‘ISP’ 탭에서 결제해주시기 바랍니다.</p><p>- 1매 무료 예매 서비스와 5천원 할인은 동일 일자에 중복 제공되지 않습니다.</p><p>- 서비스 적용 예시) 1월 9일 1매 무료 예매 서비스 적용 <span class="font-nt">→</span> 1월 10일 5천원 현장할인 적용 이후 1월 10일 1매 무료 예매 서비스(1월 9일 적용) 취소 시 할인 가능 횟수는 복구되나 1월 11일부터 1매 무료 예매 서비스 적용 가능</p><p><br></p><p><strong>서비스 대상 영화관람권 권종</strong></p><p>- 상영권종: 일반, 청소년, 경로, 우대, 어린이</p><p>- 상영관등급: 일반, 아트하우스, CINE KIDS, 아이맥스, 4DX, SCREENX 스타리움, SPHEREX, 브랜드관, CGV별관, 시그니처K관</p><p>- 좌석등급: 일반석, Light석, WIDEBOX, MYBOX, 키즈석, 커플석, 컴포트석, PRIME석</p>
           							</li>
                   				</ul>
                   			</p>
                   		</div>
                        <div class="col-md-2 text-center">
                            <form id="selectCardId" action="/design/carddesign" method="GET">
                           		<input type="hidden" id="cardSelectId" name="selectCardId" value="50">
                                <button type="submit" class="btn btn-secondary">카드 선택</button>
                            </form>
                    	</div>
    				</div>
   				</div>
			</div>
   		</div>
	</div>

        <div class="container-fluid fixed-bottom" id="prevBtnDiv">
            <div class="row justify-content-start mb-3">
                <div class="col-6">
                    <button type="button" class="btn btn-secondary" onclick="window.location.href='/wordcloud'">이전</button>
                </div>
            </div>
        </div>
</body>
</html>
