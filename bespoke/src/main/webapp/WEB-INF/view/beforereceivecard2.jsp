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
               			<p class="card-text">
               				<ul>
	                           <li>분류: 동물병원</li>
	                           <li>혜택: 동물병원 10% 청구할인</li>
	                           <li>상세혜택:  <p><strong>[오프라인 쇼핑 할인의 정석]</strong></p><p><strong>동물병원 10% 청구할인</strong></p><p>- 애완동물, 동물병원 업종 전체(반려동물 용품샵, 애견미용샵, 동물병원 등)</p><p><strong>쇼핑할인의 정석 월 할인한도</strong></p><table border="0" cellpadding="0" cellspacing="0" class="b-table" width="100%"><tbody><tr class="b-table-top"><td class="b-table-top" rowspan="2">구분</td><td class="b-table-top" colspan="3">전월 국내 가맹점 이용금액</td></tr><tr class="b-table-top"><td class="b-table-b"><p>30만원 이상~70만원 미만</p></td><td class="b-table-b"><p>70만원 이상~120만원 미만</p></td><td class="b-table-b"><p>120만원 이상~</p></td></tr><tr><td class="b-table-b">온라인</td><td align="center">4천원</td><td align="center">8천원</td><td align="center">16천원</td></tr><tr><td class="b-table-b">오프라인</td><td align="center">6천원</td><td align="center">12천원</td><td align="center">24천원</td></tr><tr><td class="b-table-b">합계</td><td align="center">1만원</td><td align="center">2만원</td><td align="center">4만원</td></tr></tbody></table></li>
	                           <br>
	                           <li>분류: 온라인쇼핑</li>
	                           <li>혜택: 온라인 쇼핑 10% 청구할인</li>
	                           <li>상세혜택:  <p><strong>[온라인 쇼핑 할인의 정석]</strong></p><p><strong>온라인 쇼핑 10% 청구할인</strong></p><p>- 인터넷 P/G, 인터넷 상거래 등 모든 온라인 업종</p><p>* 인터파크 펫 포함</p><strong>쇼핑할인의 정석 월 할인한도</strong></p><table border="0" cellpadding="0" cellspacing="0" class="b-table" width="100%"><tbody><tr class="b-table-top"><td class="b-table-top" rowspan="2">구분</td><td class="b-table-top" colspan="3">전월 국내 가맹점 이용금액</td></tr><tr class="b-table-top"><td class="b-table-b"><p>30만원 이상~70만원 미만</p></td><td class="b-table-b"><p>70만원 이상~120만원 미만</p></td><td class="b-table-b"><p>120만원 이상~</p></td></tr><tr><td class="b-table-b">온라인</td><td align="center">4천원</td><td align="center">8천원</td><td align="center">16천원</td></tr><tr><td class="b-table-b">오프라인</td><td align="center">6천원</td><td align="center">12천원</td><td align="center">24천원</td></tr><tr><td class="b-table-b">합계</td><td align="center">1만원</td><td align="center">2만원</td><td align="center">4만원</td></tr></tbody></table></li>
	                           <br>
	                           <li>분류: 간편결제</li>
	                           <li>혜택: 4대 PAY 결제 시 5% 추가 청구할인</li>
	                           <li>상세혜택:  <p><strong><strong>[온라인 쇼핑 할인의 정석]</strong></strong></p><p><strong>온라인 업종 4대 PAY 결제 시 5% 추가 청구할인</strong></p><p>- 4대 간편결제 : 삼성페이, 네이버페이, 카카오페이, PAYCO</p><p>- 전월 국내 가맹점 이용금액 30만원 이상 시 할인</p><p>- 추가 청구할인은 4대 간편결제에 본 카드를 등록하여 온라인에서 사용한 경우에 제공</p><p>- 온라인 업종 통합 할인한도 내에서 할인 적용</p><p><strong>쇼핑할인의 정석 월 할인한도</strong></p><table border="0" cellpadding="0" cellspacing="0" class="b-table" width="100%"><tbody><tr class="b-table-top"><td class="b-table-top" rowspan="2">구분</td><td class="b-table-top" colspan="3">전월 국내 가맹점 이용금액</td></tr><tr class="b-table-top"><td class="b-table-b"><p>30만원 이상~70만원 미만</p></td><td class="b-table-b"><p>70만원 이상~120만원 미만</p></td><td class="b-table-b"><p>120만원 이상~</p></td></tr><tr><td class="b-table-b">온라인</td><td align="center">4천원</td><td align="center">8천원</td><td align="center">16천원</td></tr><tr><td class="b-table-b">오프라인</td><td align="center">6천원</td><td align="center">12천원</td><td align="center">24천원</td></tr><tr><td class="b-table-b">합계</td><td align="center">1만원</td><td align="center">2만원</td><td align="center">4만원</td></tr></tbody></table></li>
	                           <br>
	                           <li>분류: 쇼핑</li>
	                           <li>혜택: 백화점, 아울렛, 잡화 10% 청구할인</li>
	                           <li>상세혜택:  <p><strong><strong>[오프라인 쇼핑 할인의 정석]</strong></strong></p><p><strong><strong>백화점, 아울렛, 잡화</strong>10% 청구할인</strong></p><p><strong>-</strong>백화점<strong>:</strong>롯데, 현대, 신세계</p><p><strong>-</strong>프리미엄 아울렛<strong>:</strong>롯데, 현대, 신세계사이먼</p><p><strong>-</strong>잡화:<strong></strong>올리브영, LOHB's, 시코르, 다이소</p><p><strong>쇼핑할인의 정석 월 할인한도</strong></p><table border="0" cellpadding="0" cellspacing="0" class="b-table" width="100%"><tbody><tr class="b-table-top"><td class="b-table-top" rowspan="2">구분</td><td class="b-table-top" colspan="3">전월 국내 가맹점 이용금액</td></tr><tr class="b-table-top"><td class="b-table-b"><p>30만원 이상~70만원 미만</p></td><td class="b-table-b"><p>70만원 이상~120만원 미만</p></td><td class="b-table-b"><p>120만원 이상~</p></td></tr><tr><td class="b-table-b">온라인</td><td align="center">4천원</td><td align="center">8천원</td><td align="center">16천원</td></tr><tr><td class="b-table-b">오프라인</td><td align="center">6천원</td><td align="center">12천원</td><td align="center">24천원</td></tr><tr><td class="b-table-b">합계</td><td align="center">1만원</td><td align="center">2만원</td><td align="center">4만원</td></tr></tbody></table></li>
	                           <br>
	                           <li>분류: 마트/편의점</li>
	                           <li>혜택: 대형할인점, 편의점 등 10% 청구할인</li>
	                           <li>상세혜택:  <p><strong><strong>[오프라인 쇼핑 할인의 정석]</strong></strong></p><p><strong><strong>대형할인점, 편의점 등</strong>10% 청구할인</strong></p><p>- 대형할인점: 이마트(몰리스펫샵 포함), 홈플러스, 롯데마트, 메가마트, Y-MART(영암마트)</p><p>- 창고형 할인매장: 이마트 트레이더스(몰리스펫샵 포함), 롯데 VIC마켓, 이케아</p><p>- 슈퍼마켓: 이마트 에브리데이, 롯데슈퍼, 홈플러스 익스프레스, GS 수퍼마켓</p><p>- 편의점: CU, GS25, 이마트24</p><p><strong>쇼핑할인의 정석 월 할인한도</strong></p><table border="0" cellpadding="0" cellspacing="0" class="b-table" width="100%"><tbody><tr class="b-table-top"><td class="b-table-top" rowspan="2">구분</td><td class="b-table-top" colspan="3">전월 국내 가맹점 이용금액</td></tr><tr class="b-table-top"><td class="b-table-b"><p>30만원 이상~70만원 미만</p></td><td class="b-table-b"><p>70만원 이상~120만원 미만</p></td><td class="b-table-b"><p>120만원 이상~</p></td></tr><tr><td class="b-table-b">온라인</td><td align="center">4천원</td><td align="center">8천원</td><td align="center">16천원</td></tr><tr><td class="b-table-b">오프라인</td><td align="center">6천원</td><td align="center">12천원</td><td align="center">24천원</td></tr><tr><td class="b-table-b">합계</td><td align="center">1만원</td><td align="center">2만원</td><td align="center">4만원</td></tr></tbody></table></li>
	                           <br>
	                           <li>분류: 해외이용</li>
	                           <li>혜택: 해외 이용금액 1% 청구할인</li>
	                           <li>상세혜택:  <p><strong>[해외 서비스의 정석]</strong></p><p><strong>해외 이용금액 1% 청구할인</strong></p><p>- 대상 : 해외가맹점, 직구, 스마트폰 유료 앱(App) 등</p><p>- 전월 국내 가맹점 이용금액 30만원 이상 시 할인</p><p>- 이용횟수, 할인 한도 제한 없음</p><p>- 쇼핑할인의 정석 월 할인한도와 별도 제공</p><p> * 우리카드 전산상 해외 매출로 분류된 경우에 한하여 당사 매출표 접수일 기준으로 반영</p><p> * 스마트폰 유료 앱(App) 결제 시 T스토어 등 국내 결제는 제외</p><p> * 해외 결제 시 별도의 수수료가 발생할 수 있으며, 해당 내용은 '해외 이용 안내' 참조</p></li>
	                           <br>
	                           <li>분류: 공항라운지</li>
	                           <li>혜택: 국내외 공항라운지 무료 이용 서비스</li>
	                           <li>상세혜택:  <p><strong>[해외 서비스의 정석]</strong></p><p><strong>국내외 공항라운지 무료 이용 서비스(더 라운지 멤버스)</strong></p><p>· 통합 월 1회, 연 2회 제공(본인 회원 한정)</p><p>· 이용방법</p><p> 1. 구글/애플 앱스토어에서 더라운지멤버스(The Lounge Members) 앱 다운로드</p><p> 2. 회원가입 ▶ 로그인 ▶ 카드등록 ▶ 라운지 이용권 받기</p><p> 3. 라운지 안내데스크에 라운지 이용권과 여권, 당일 출발 항공권 제시</p><p> 4. 라운지 무료 이용 가능여부 확인 후 입장</p><p>* 해당 서비스는 더라운지멤버스(The Lounge Members) 앱 설치 후 이용 가능</p><p>* 이용 가능 라운지 및 상세 이용방법은 더라운지멤버스 앱 또는 해당 홈페이지(www.theloungemembers.com) 참조</p><p>* 전월 국내 가맹점 이용금액 30만원 이상 시 무료 제공. 단, 카드수령 등록일로부터 다음달 말일까지는 국내 가맹점 30만원 이상 이용 시 그 다음날부터 무료 제공</p><p>* 본인 회원 1인 한정(가족카드 및 동반인 무료입장 불가)</p><p>* 라운지 이용권은 발급 후 24시간동안 유효하며, 기간 내 미사용 시 자동 취소(취소 후에는 다시 재발급 가능)</p><p>* 취소된 라운지 이용권은 사용 가능 횟수에서 차감되지 않음</p><p>* 문의처 : 더라운지멤버스 고객센터(82-2-2664-7436)</p></li>
	                           <br>
	                           <li>분류: 주유소</li>
	                           <li>혜택: 주말 4대 주유소 리터당 60원 청구할인</li>
	                           <li>상세혜택:  <p><strong>[생활밀착 할인의 정석]</strong></p><p><strong>4대 주유소 주말 주유 시 리터당 60원 청구할인</strong></p><p>- SK주유소, GS칼텍스, S-OIL, 현대오일뱅크 대상</p><p>- 전월 국내 가맹점 이용금액 30만원 이상 시 할인</p><p>- GS칼텍스 휘발유 공시가 기준</p><p>- 주유 매출건당 10만원, 통합 월 30만원 한도, LPG는 할인 제외</p><p>- 쇼핑 할인의 정석 월 할인한도와 별도 제공</p><p>- Two-in-One 결제서비스(체크매출) 이용 시 청구할인은 적용되지 않으며, 0.3% 캐시백이 대체 제공됨</p><p> * 할인금액 산정방법 = 주유 이용금액 X (리터당 할인금액 / GS칼텍스 휘발유 공시가)</p><p> (경유, 등유 등 기타 유종은 GS칼텍스 휘발유 공시가로 환산 적용)</p></li>
	                           <br>
	                           <li>분류: 카페</li>
	                           <li>혜택: 스타벅스, 폴바셋 10% 청구할인</li>
	                           <li>상세혜택:  <p><strong>[생활밀착 할인의 정석]</strong></p><p><strong>스타벅스, 폴바셋 10% 청구할인</strong></p><p>- 매출 건당 1천원까지, 통합 월 5천원까지 할인</p><p>- 쇼핑 할인의 정석 월 할인한도와 별도 제공</p><p>- 전월 국내 가맹점 이용금액 30만원 이상 시 할인</p><p>- Two-in-One 결제서비스(체크매출) 이용 시 청구할인은 적용되지 않으며, 0.3% 캐시백이 대체 제공됨</p><p> * 커피브랜드의 상품권, 선불카드 구입/충전 등의 이용금액은 할인 제외</p><p> * 백화점/대형할인점 내 매장, 미군부대 매장 제외</p></li>
                               
               				</ul>
               			</p>
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


    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>

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
