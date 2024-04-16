<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<%@ include file="header/header.jsp" %>
    <div class="container">
        <!-- 나의 정보 섹션 -->
        <div class="row">
            <div class="col-sm-6">
                <div class="info-section custom-bg-Sky p-3 mb-2">
                    <h2>나의 정보</h2>
                    <div class="user-info">
                        <p><b>이름</b> : ${userData.name}</p>
                        <p><b>생년월일</b> : ${userData.birthDate}</p>
                        <p><b>성별</b> : ${userData.gender}</p>
                        <p><b>주소</b> : ${userData.address}</p>
                        <p><b>연락처</b> : ${userData.contact}</p>
                        <div class="card-image mt-5 mb-2" >
                            <img src="${imageUrl}" alt="소유한 카드" style="width:40%">
                        </div>
                        
                        <!-- 기타 정보 추가 -->
                    </div>
                </div>
            </div>

            <!-- 나의 카드 섹션 -->
            <div class="col-6">
                <div class="card-section custom-bg-Sky rounded p-3">
                    <h2>카드 헤택</h2>
                    <div class="additional-info bg-white p-3 mb-2 rounded">
                        <p class="card-text">
                           <ul>
                               <li>Product Name: ${elasticresultDetail[0]}</li>
                               <li>Card Type: ${elasticresultDetail[1]}</li>
                               <li>Domestic Year Cost: ${elasticresultDetail[2]}</li>
                               <li>Abroad Year Cost: ${elasticresultDetail[3]}</li>
                               <li>Previous Month Performance: ${elasticresultDetail[4]}</li>
                               <c:forEach var="category" items="${categoriesResultDetail}" varStatus="catStatus">
                                   <c:if test="${not empty categoriesResultDetail[catStatus.index * 3]}">
                                       <li>Category ${catStatus.index + 1}:</li>
                                       <ul>
                                           <li>Class: ${categoriesResultDetail[catStatus.index * 3]}</li>
                                           <li>Benefit: ${categoriesResultDetail[catStatus.index * 3 + 1]}</li>
                                           <li>Condition: ${categoriesResultDetail[catStatus.index * 3 + 2]}</li>
                                       </ul>
                                   </c:if>
                               </c:forEach>
                           </ul>
						</p>			
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- 수정 버튼 및 나머지 버튼들 -->
    <div class="container mt-3">
        <div class="row">
            <div class="col-6 ">
                <div class="d-flex justify-content-center">
                    <button class="btn btn-primary" onclick="location.href='<%= request.getContextPath() %>/editprofile'">수정</button>
                </div>
            </div>
            <div class="col-6">
                <div class="d-flex justify-content-center">
                    <button class="btn btn-primary me-3" onclick="location.href='<%= request.getContextPath() %>/carddesign'">디자인 수정</button>
					<button class="btn btn-primary" onclick="location.href='<%= request.getContextPath() %>/issuecard'">카드 재발급</button>
                </div>
            </div>
        </div>
    </div>

    <script>
        window.onload = function() {
            // 나의 정보 섹션과 나의 카드 섹션을 선택합니다.
            var infoSection = document.querySelector('.info-section');
            var cardSection = document.querySelector('.card-section');
    
            // 나의 정보 섹션과 나의 카드 섹션의 높이를 비교하여 더 큰 높이를 가진 섹션의 높이를 다른 섹션에 적용합니다.
            var maxHeight = Math.max(infoSection.clientHeight, cardSection.clientHeight);
            infoSection.style.height = maxHeight + 'px';
            cardSection.style.height = maxHeight + 'px';
        };
    </script>
    
</body>
</html>
