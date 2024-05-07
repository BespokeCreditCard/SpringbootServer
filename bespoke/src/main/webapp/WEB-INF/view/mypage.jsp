<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<!DOCTYPE html>
<html lang="ko">
<%@ include file="header/header.jsp" %>

<style>
	@font-face {
	    font-family: 'KCC-Hanbit';
	    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/2403-2@1.0/KCC-Hanbit.woff2') format('woff2');
	    font-weight: normal;
	    font-style: normal;
	}
	@font-face {
	    font-family: 'WooridaumR';
	    src: url('/fonts/WooridaumR.ttf') format('truetype');
	}
    .container-wrapper {
   	    font-family: 'KCC-Hanbit';
    	min-height: 45.5rem;
        padding: 2.6rem;
        background-color: #f1f1f1;
        border-radius: 5px;
    }

    .container-white {
    	height: 40.4rem;
        overflow: hidden; /* 자식 요소가 float 속성을 가지면 부모 요소의 높이가 사라지는 것을 방지합니다. */
        background-color: #ffffff;
        box-shadow: 5px 5px 10px rgba(0, 0, 0, 2);/* 그림자 */
    }

    .left {
        width: 40%;
        height: 100%;
        background-color: #f1f1f1;
        padding: 20px;
        float: left;
    }
    .right {
        width: 60%;
        height: 100%;
        padding: 10px;
        float: right;
    }

    .card {
        text-align: center;
        padding: 1rem;
        vertical-align:middle;
        margin-top: 20px;
    }
    .info {
	        height: 100%;
        display: flex;        /* Makes .info a flex container */
    	flex-direction: column;/* Stacks the children vertically */
    	justify-content: space-between; /* Aligns children to start and end of container */
    }

    tr,td {
        border:1px solid black;
    }
    
    li {
	    font-family: 'WooridaumR';
    }
    .info_button_div {
	    display: flex;
	    justify-content: center;
	    margin-top: 10px;
	    margin-bottom: 10px; /* 수정된 부분 */
    }
    input[type="text"] {
        width: 100%;
        border: none;
        font-family: 'WooridaumR';
        color: black;
    }
</style>
<body>
    <div class="container-wrapper">
        <div class="container-white">
            <div class="left text-center" style="width: 40%;">
                <img src="./imgs/nobackground.png" alt="Profile Picture" class="mx-auto" style="width: 45%; height: 75%;">
                <div class="card mb-3 pt-4">
                    <h3>카드의정석 댕댕냥이(강아지)</h3>
                </div>
                <button class="btn btn-secondary me-3" onclick="location.href='<%= request.getContextPath() %>/design/carddesign?selectCardId=14'">디자인 수정</button>
                <button class="btn btn-secondary" onclick="location.href='<%= request.getContextPath() %>/receivecard'">카드 재발급</button>
            </div>

            <div class="right" style="width: 60%;">
                <div class="info">
                    <div class="user-info">
                            <form action="/revise-mypage" method="POST" id="userForm">
						        <table class="table">
						            <colgroup>
						                <col style="width: 20%;">
						                <col style="width: 80%;">
						            </colgroup>
						            <tr>
						                <th>이름</th>
						                <td><input id="can_revise" type="text" name="name" value="${userData.name}" /></td>
						            </tr>
						            <tr>
						                <th>성별</th>
						                <td>
			                                    <label><input type="radio" name="gender" value="0" ${fn:trim(userData.gender) eq "1" ? 'checked' : ''}/> 남성</label>
                								<label><input type="radio" name="gender" value="1" ${fn:trim(userData.gender) eq "2" ? 'checked' : ''}/> 여성</label>
						                </td>
						            </tr>
						            <tr>
						                <th>생년월일</th>
						                <td><input id="can_revise" type="text" name="birthDate" value="${userData.birthDate}" /></td>
						            </tr>
						            <tr>
						                <th>연락처</th>
						                <td><input id="can_revise" disabled='disabled' type="text" name="contact" value="${userData.contact}" /></td>
						            </tr>
						            <tr>
						                <th>주소</th>
						                <td><input id="can_revise" disabled='disabled' type="text" name="address" value="${userData.address}" /></td>
						            </tr>
						            <tr>
						                <th>가입일자</th>
						                <td><input disabled='disabled' type="text" name="registerDate" value="${userData.registerDate}" /></td>
						            </tr>
						            <tr>
						                <th>수령장소</th>
						                <td><input disabled='disabled' type="text" name="registerDate" value="${userData.deliveryAddress}" /></td>
						            </tr>
						        </table>
						        <div class="info_button_div">
			                        <button id="info_revise_button" type="button" onclick="enableEditing()" class="btn btn-secondary">회원정보수정</button>
                                    <button type="button" class="btn btn-warning" data-bs-toggle="modal" data-bs-target="#passwordModal">비밀번호 수정</button>
                                </div>
						    </form>
                    </div>
				<!-- 나의 카드 섹션 -->
                <div class="additional-info bg-white p-3 mb-2 rounded" style="border:1px solid black; overflow-y: scroll; max-height: 500px;">
                    <p class="card-text">
	                    <ul>
	                        <li>분류: 동물병원</li>
	                        <li>혜택: 동물병원 10% 청구할인</li>
	                        <li>상세혜택:  <p>[오프라인 쇼핑 할인의 정석]</p><p>동물병원 10% 청구할인</p><p>- 애완동물, 동물병원 업종 전체(반려동물 용품샵, 애견미용샵, 동물병원 등)</p><p>쇼핑할인의 정석 월 할인한도</p><table border="0" cellpadding="0" cellspacing="0" class="b-table" width="100%"><tbody><tr class="b-table-top"><td class="b-table-top" rowspan="2">구분</td><td class="b-table-top" colspan="3">전월 국내 가맹점 이용금액</td></tr><tr class="b-table-top"><td class="b-table-b"><p>30만원 이상~70만원 미만</p></td><td class="b-table-b"><p>70만원 이상~120만원 미만</p></td><td class="b-table-b"><p>120만원 이상~</p></td></tr><tr><td class="b-table-b">온라인</td><td align="center">4천원</td><td align="center">8천원</td><td align="center">16천원</td></tr><tr><td class="b-table-b">오프라인</td><td align="center">6천원</td><td align="center">12천원</td><td align="center">24천원</td></tr><tr><td class="b-table-b">합계</td><td align="center">1만원</td><td align="center">2만원</td><td align="center">4만원</td></tr></tbody></table></li>
	                        <br><br>
	                        <li>분류: 온라인쇼핑</li>
	                        <li>혜택: 온라인 쇼핑 10% 청구할인</li>
	                        <li>상세혜택:  <p>[온라인 쇼핑 할인의 정석]</p><p>온라인 쇼핑 10% 청구할인</p><p>- 인터넷 P/G, 인터넷 상거래 등 모든 온라인 업종</p><p>* 인터파크 펫 포함</p>쇼핑할인의 정석 월 할인한도</p><table border="0" cellpadding="0" cellspacing="0" class="b-table" width="100%"><tbody><tr class="b-table-top"><td class="b-table-top" rowspan="2">구분</td><td class="b-table-top" colspan="3">전월 국내 가맹점 이용금액</td></tr><tr class="b-table-top"><td class="b-table-b"><p>30만원 이상~70만원 미만</p></td><td class="b-table-b"><p>70만원 이상~120만원 미만</p></td><td class="b-table-b"><p>120만원 이상~</p></td></tr><tr><td class="b-table-b">온라인</td><td align="center">4천원</td><td align="center">8천원</td><td align="center">16천원</td></tr><tr><td class="b-table-b">오프라인</td><td align="center">6천원</td><td align="center">12천원</td><td align="center">24천원</td></tr><tr><td class="b-table-b">합계</td><td align="center">1만원</td><td align="center">2만원</td><td align="center">4만원</td></tr></tbody></table></li>
	                        <br><br>
	                        <li>분류: 간편결제</li>
	                        <li>혜택: 4대 PAY 결제 시 5% 추가 청구할인</li>
	                        <li>상세혜택:  <p>[온라인 쇼핑 할인의 정석]</p><p>온라인 업종 4대 PAY 결제 시 5% 추가 청구할인</p><p>- 4대 간편결제 : 삼성페이, 네이버페이, 카카오페이, PAYCO</p><p>- 전월 국내 가맹점 이용금액 30만원 이상 시 할인</p><p>- 추가 청구할인은 4대 간편결제에 본 카드를 등록하여 온라인에서 사용한 경우에 제공</p><p>- 온라인 업종 통합 할인한도 내에서 할인 적용</p><p>쇼핑할인의 정석 월 할인한도</p><table border="0" cellpadding="0" cellspacing="0" class="b-table" width="100%"><tbody><tr class="b-table-top"><td class="b-table-top" rowspan="2">구분</td><td class="b-table-top" colspan="3">전월 국내 가맹점 이용금액</td></tr><tr class="b-table-top"><td class="b-table-b"><p>30만원 이상~70만원 미만</p></td><td class="b-table-b"><p>70만원 이상~120만원 미만</p></td><td class="b-table-b"><p>120만원 이상~</p></td></tr><tr><td class="b-table-b">온라인</td><td align="center">4천원</td><td align="center">8천원</td><td align="center">16천원</td></tr><tr><td class="b-table-b">오프라인</td><td align="center">6천원</td><td align="center">12천원</td><td align="center">24천원</td></tr><tr><td class="b-table-b">합계</td><td align="center">1만원</td><td align="center">2만원</td><td align="center">4만원</td></tr></tbody></table></li>
	                        <br><br>
	                        <li>분류: 쇼핑</li>
	                        <li>혜택: 백화점, 아울렛, 잡화 10% 청구할인</li>
	                        <li>상세혜택:  <p>[오프라인 쇼핑 할인의 정석]</p><p>백화점, 아울렛, 잡화10% 청구할인</p><p>-백화점:롯데, 현대, 신세계</p><p>-프리미엄 아울렛:롯데, 현대, 신세계사이먼</p><p>-잡화:올리브영, LOHB's, 시코르, 다이소</p><p>쇼핑할인의 정석 월 할인한도</p><table border="0" cellpadding="0" cellspacing="0" class="b-table" width="100%"><tbody><tr class="b-table-top"><td class="b-table-top" rowspan="2">구분</td><td class="b-table-top" colspan="3">전월 국내 가맹점 이용금액</td></tr><tr class="b-table-top"><td class="b-table-b"><p>30만원 이상~70만원 미만</p></td><td class="b-table-b"><p>70만원 이상~120만원 미만</p></td><td class="b-table-b"><p>120만원 이상~</p></td></tr><tr><td class="b-table-b">온라인</td><td align="center">4천원</td><td align="center">8천원</td><td align="center">16천원</td></tr><tr><td class="b-table-b">오프라인</td><td align="center">6천원</td><td align="center">12천원</td><td align="center">24천원</td></tr><tr><td class="b-table-b">합계</td><td align="center">1만원</td><td align="center">2만원</td><td align="center">4만원</td></tr></tbody></table></li>
	                        <br><br>
	                        <li>분류: 마트/편의점</li>
	                        <li>혜택: 대형할인점, 편의점 등 10% 청구할인</li>
	                        <li>상세혜택:  <p>[오프라인 쇼핑 할인의 정석]</p><p>대형할인점, 편의점 등10% 청구할인</p><p>- 대형할인점: 이마트(몰리스펫샵 포함), 홈플러스, 롯데마트, 메가마트, Y-MART(영암마트)</p><p>- 창고형 할인매장: 이마트 트레이더스(몰리스펫샵 포함), 롯데 VIC마켓, 이케아</p><p>- 슈퍼마켓: 이마트 에브리데이, 롯데슈퍼, 홈플러스 익스프레스, GS 수퍼마켓</p><p>- 편의점: CU, GS25, 이마트24</p><p>쇼핑할인의 정석 월 할인한도</p><table border="0" cellpadding="0" cellspacing="0" class="b-table" width="100%"><tbody><tr class="b-table-top"><td class="b-table-top" rowspan="2">구분</td><td class="b-table-top" colspan="3">전월 국내 가맹점 이용금액</td></tr><tr class="b-table-top"><td class="b-table-b"><p>30만원 이상~70만원 미만</p></td><td class="b-table-b"><p>70만원 이상~120만원 미만</p></td><td class="b-table-b"><p>120만원 이상~</p></td></tr><tr><td class="b-table-b">온라인</td><td align="center">4천원</td><td align="center">8천원</td><td align="center">16천원</td></tr><tr><td class="b-table-b">오프라인</td><td align="center">6천원</td><td align="center">12천원</td><td align="center">24천원</td></tr><tr><td class="b-table-b">합계</td><td align="center">1만원</td><td align="center">2만원</td><td align="center">4만원</td></tr></tbody></table></li>
	                        <br><br>
	                        <li>분류: 해외이용</li>
	                        <li>혜택: 해외 이용금액 1% 청구할인</li>
	                        <li>상세혜택:  <p>[해외 서비스의 정석]</p><p>해외 이용금액 1% 청구할인</p><p>- 대상 : 해외가맹점, 직구, 스마트폰 유료 앱(App) 등</p><p>- 전월 국내 가맹점 이용금액 30만원 이상 시 할인</p><p>- 이용횟수, 할인 한도 제한 없음</p><p>- 쇼핑할인의 정석 월 할인한도와 별도 제공</p><p> * 우리카드 전산상 해외 매출로 분류된 경우에 한하여 당사 매출표 접수일 기준으로 반영</p><p> * 스마트폰 유료 앱(App) 결제 시 T스토어 등 국내 결제는 제외</p><p> * 해외 결제 시 별도의 수수료가 발생할 수 있으며, 해당 내용은 '해외 이용 안내' 참조</p></li>
	                        <br><br>
	                        <li>분류: 공항라운지</li>
	                        <li>혜택: 국내외 공항라운지 무료 이용 서비스</li>
	                        <li>상세혜택:  <p>[해외 서비스의 정석]</p><p>국내외 공항라운지 무료 이용 서비스(더 라운지 멤버스)</p><p>· 통합 월 1회, 연 2회 제공(본인 회원 한정)</p><p>· 이용방법</p><p> 1. 구글/애플 앱스토어에서 더라운지멤버스(The Lounge Members) 앱 다운로드</p><p> 2. 회원가입 ▶ 로그인 ▶ 카드등록 ▶ 라운지 이용권 받기</p><p> 3. 라운지 안내데스크에 라운지 이용권과 여권, 당일 출발 항공권 제시</p><p> 4. 라운지 무료 이용 가능여부 확인 후 입장</p><p>* 해당 서비스는 더라운지멤버스(The Lounge Members) 앱 설치 후 이용 가능</p><p>* 이용 가능 라운지 및 상세 이용방법은 더라운지멤버스 앱 또는 해당 홈페이지(www.theloungemembers.com) 참조</p><p>* 전월 국내 가맹점 이용금액 30만원 이상 시 무료 제공. 단, 카드수령 등록일로부터 다음달 말일까지는 국내 가맹점 30만원 이상 이용 시 그 다음날부터 무료 제공</p><p>* 본인 회원 1인 한정(가족카드 및 동반인 무료입장 불가)</p><p>* 라운지 이용권은 발급 후 24시간동안 유효하며, 기간 내 미사용 시 자동 취소(취소 후에는 다시 재발급 가능)</p><p>* 취소된 라운지 이용권은 사용 가능 횟수에서 차감되지 않음</p><p>* 문의처 : 더라운지멤버스 고객센터(82-2-2664-7436)</p></li>
	                        <br><br>
	                        <li>분류: 주유소</li>
	                        <li>혜택: 주말 4대 주유소 리터당 60원 청구할인</li>
	                        <li>상세혜택:  <p>[생활밀착 할인의 정석]</p><p>4대 주유소 주말 주유 시 리터당 60원 청구할인</p><p>- SK주유소, GS칼텍스, S-OIL, 현대오일뱅크 대상</p><p>- 전월 국내 가맹점 이용금액 30만원 이상 시 할인</p><p>- GS칼텍스 휘발유 공시가 기준</p><p>- 주유 매출건당 10만원, 통합 월 30만원 한도, LPG는 할인 제외</p><p>- 쇼핑 할인의 정석 월 할인한도와 별도 제공</p><p>- Two-in-One 결제서비스(체크매출) 이용 시 청구할인은 적용되지 않으며, 0.3% 캐시백이 대체 제공됨</p><p> * 할인금액 산정방법 = 주유 이용금액 X (리터당 할인금액 / GS칼텍스 휘발유 공시가)</p><p> (경유, 등유 등 기타 유종은 GS칼텍스 휘발유 공시가로 환산 적용)</p></li>
	                        <br><br>
	                        <li>분류: 카페</li>
	                        <li>혜택: 스타벅스, 폴바셋 10% 청구할인</li>
	                        <li>상세혜택:  <p>[생활밀착 할인의 정석]</p><p>스타벅스, 폴바셋 10% 청구할인</p><p>- 매출 건당 1천원까지, 통합 월 5천원까지 할인</p><p>- 쇼핑 할인의 정석 월 할인한도와 별도 제공</p><p>- 전월 국내 가맹점 이용금액 30만원 이상 시 할인</p><p>- Two-in-One 결제서비스(체크매출) 이용 시 청구할인은 적용되지 않으며, 0.3% 캐시백이 대체 제공됨</p><p> * 커피브랜드의 상품권, 선불카드 구입/충전 등의 이용금액은 할인 제외</p><p> * 백화점/대형할인점 내 매장, 미군부대 매장 제외</p></li>
                    	</ul>
                   	</p>
               	</div>
           	</div>
        	</div>
    	</div>
	</div>

	<div class="modal fade" id="passwordModal" tabindex="-1" role="dialog" aria-labelledby="passwordModalLabel" aria-hidden="true">
	    <div class="modal-dialog" role="document">
	        <div class="modal-content">
	            <div class="modal-header">
	                <h5 class="modal-title" id="passwordModalLabel">비밀번호 수정</h5>
	            </div>
	            <div class="modal-body">
	                <form id="passwordForm">
	                    <div class="form-group">
	                        <label for="currentPassword">현재 비밀번호</label>
	                        <input type="password" class="form-control" id="currentPassword" required>
	                    </div>
	                    <div class="form-group">
	                        <label for="newPassword">새 비밀번호</label>
	                        <input type="password" class="form-control" id="newPassword" required>
	                    </div>
	                    <div class="form-group">
	                        <label for="confirmPassword">새 비밀번호 확인</label>
	                        <input type="password" class="form-control" id="confirmPassword" required>
	                    </div>
	                </form>
	            </div>
	            <div class="modal-footer">
	                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
	                <button type="button" class="btn btn-primary" onclick="submitPasswordChange()">저장</button>
	            </div>
	        </div>
	    </div>
	</div> 


    <script>
    	let isEditMode = false;

        window.onload = function() {
            // 나의 정보 섹션과 나의 카드 섹션을 선택합니다.
            var infoSection = document.querySelector('.info-section');
            var cardSection = document.querySelector('.card-section');

            // 나의 정보 섹션과 나의 카드 섹션의 높이를 비교하여 더 큰 높이를 가진 섹션의 높이를 다른 섹션에 적용합니다.
            var maxHeight = Math.max(infoSection.clientHeight, cardSection.clientHeight);
            infoSection.style.height = maxHeight + 'px';
            cardSection.style.height = maxHeight + 'px';
        };

    	function enableEditing() {
    	    const editButton = document.getElementById('info_revise_button');
    	    const inputs = document.querySelectorAll('#can_revise');

    	    if (!isEditMode) {
    	        // 첫 번째 클릭, 모드 활성화
    	        inputs.forEach(function(input) {
    	            input.disabled = false;
    	            input.style.border = '2px solid #007BFF';
    	        });
    	        editButton.textContent = "저장";
    	        editButton.style.backgroundColor = '#007BFF';
    	        isEditMode = true;
    	    } else {
    	        // 두 번째 클릭, 폼 제출
    	        document.getElementById('userForm').submit();
    	    }
    	}
	    
        function submitPasswordChange() {
            var currentPassword = document.getElementById('currentPassword').value;
            var newPassword = document.getElementById('newPassword').value;
            var confirmPassword = document.getElementById('confirmPassword').value;

            if (newPassword !== confirmPassword) {
                alert('새 비밀번호와 비밀번호 확인이 일치하지 않습니다.');
                return;
            }

            // AJAX 요청을 통해 서버에 비밀번호 변경 요청
            fetch('/update-password', {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/json',
                },
                body: JSON.stringify({
                    currentPassword: currentPassword,
                    newPassword: newPassword
                })
            })
            .then(response => response.json())
            .then(data => {
                if (data.fail_current) {
					alert("현재 비밀번호가 틀립니다.");
				} else if(data.success) {
					$('#passwordModal').modal('hide');
                    alert('비밀번호가 성공적으로 변경되었습니다.');
                } else {
					alert('비밀번호 변경에 실패하였습니다.');
				}
            })
            .catch(error => {
                console.error('Error:', error);
                alert('비밀번호 변경 중 문제가 발생하였습니다.');
            });
        }
    </script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

</body>
</html>