<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <%@ include file="../header/header.jsp" %>
</head>
<body>
    <div class="container mt-5">

        <c:forEach var="imageUrl" items="${imageUrls}" varStatus="cardStatus">
            <div class="row">
                <div class="col">
                    <div class="container-lg p-1 mb-4 border rounded border-5">
                        <div class="row align-items-center">
                            <div class="col-md-2 d-flex justify-content-center">
                                <img src="${imageUrl}" class="card-img" alt="Card Image" style="width: 150px;">
                            </div>
                            <div class="col-md-8" style="overflow-y: scroll; max-height: 300px;">
                                <p class="card-text">
                                    <ul>
                                        <li>Product Name: ${elasticresultDetail[cardStatus.index][0]}</li>
                                        <li>Card Type: ${elasticresultDetail[cardStatus.index][1]}</li>
                                        <li>Domestic Year Cost: ${elasticresultDetail[cardStatus.index][2]}</li>
                                        <li>Abroad Year Cost: ${elasticresultDetail[cardStatus.index][3]}</li>
                                        <li>Previous Month Performance: ${elasticresultDetail[cardStatus.index][4]}</li>
                                        <c:forEach var="category" items="${categoriesResultDetail[cardStatus.index]}" varStatus="catStatus">
                                            <c:if test="${not empty categoriesResultDetail[cardStatus.index][catStatus.index * 3]}">
                                                <li>Category ${catStatus.index + 1}:</li>
                                                <ul>
                                                    <li>Class: ${categoriesResultDetail[cardStatus.index][catStatus.index * 3]}</li>
                                                    <li>Benefit: ${categoriesResultDetail[cardStatus.index][catStatus.index * 3 + 1]}</li>
                                                    <li>Condition: ${categoriesResultDetail[cardStatus.index][catStatus.index * 3 + 2]}</li>
                                                </ul>
                                            </c:if>
                                        </c:forEach>
                                    </ul>
                                </p>
                            </div>
                            <div class="col-md-2 text-center">
	                            <form id="selectCardId" action="/design/carddesign" method="GET">
	                           		<input type="hidden" id="cardSelectId" name="selectCardId" value="${elasticresultDetail[cardStatus.index][5]}">
	                                <button type="submit" class="btn btn-secondary">카드 선택</button>
	                            </form>

                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </c:forEach>
        <div class="container-fluid fixed-bottom" id="prevBtnDiv">
            <div class="row justify-content-start mb-3">
                <div class="col-6">
                    <button type="button" class="btn btn-secondary" onclick="window.location.href='/wordcloud'">이전</button>
                </div>
            </div>
        </div>
    </div>

</body>
</html>
