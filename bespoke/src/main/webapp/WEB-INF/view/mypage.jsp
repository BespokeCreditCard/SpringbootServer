<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<!DOCTYPE html>
<html lang="ko">
<%@ include file="header/header.jsp" %>
<style>
        .container {
            display: flex;
            height: 100vh;
        }
        .left {
            width: 33.33%;
            background-color: #f1f1f1;
            padding: 20px;
        }
        .right {
            width: 66.67%;
            padding: 20px;
        }
        .card {
            text-align: center;
            margin-top: 20px;
        }
        .info {
            margin-top: 20px;
        }
</style>

<body>
    <div class="container">
        <div class="left">
            <img src="profile.jpg" alt="Profile Picture" width="100%">
            <div class="card">
                <h3>Card Name</h3>
            </div>
        </div>
        <div class="right">
            <div class="info">
                <h2>Personal Information</h2>
                <p>Name: John Doe</p>
                <p>Age: 30</p>
                <p>Address: 123 Main St, Anytown USA</p>
            </div>
            <div class="data">
                <h2>Data</h2>
                <%
                    // Fetch data from a database or other source and display it here
                    String[] data = {"Data 1", "Data 2", "Data 3", "Data 4", "Data 5"};
                    for (String item : data) {
                        out.println("<p>" + item + "</p>");
                    }
                %>
            </div>
        </div>
    </div>
</body>
</html>

						</table>
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
                    <div class="additional-info bg-white p-3 mb-2 rounded" style="overflow-y: scroll; max-height: 500px;">
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
                                           <li><c:out value="${categoriesResultDetail[catStatus.index * 3 + 2]}" escapeXml="false" /></li>
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
                    <button class="btn btn-primary" onclick="location.href='<%= request.getContextPath() %>/editprofile'">대시보드</button>
                </div>
            </div>
            <div class="col-6">
                <div class="d-flex justify-content-center">
                    <button class="btn btn-primary me-3" onclick="location.href='<%= request.getContextPath() %>/design/carddesign'">디자인 수정</button>
					<button class="btn btn-primary" onclick="location.href='<%= request.getContextPath() %>/receivecard'">카드 재발급</button>
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
    <div style="margin:10px;"></div>
</body>
</html>
