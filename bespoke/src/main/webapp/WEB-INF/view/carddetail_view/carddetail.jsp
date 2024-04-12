<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<%@ include file="../header/header.jsp" %>
    <div class="container">
    
        <div class="row">
            <div class="col">
                <div class="container-lg p-1 mb-4 border rounded border-5">
                    <div class="row align-items-center">
                        <div class="col-md-2 d-flex justify-content-center">
                            <img src="${imageUrls.get(0)}" class="card-img" alt="Card Image" style="width: 150px;">
                        </div>
                        <div class="col-md-8" style="overflow-y: scroll; max-height: 100px;">
                            <p class="card-text" >
							    <ul>
							        <li>Product Name: ${elasticresults[0]}</li>
							        <li>ID: ${elasticresults[1]}</li>
							        <li>card_link: ${elasticresults[2]}</li>
							        <li>card_type: ${elasticresults[3]}</li>
							        <li>domestic_year_cost: ${elasticresults[4]}</li>
							        <li>abroad_year_cost: ${elasticresults[5]}</li>
							        <li>previous_month_performance: ${elasticresults[6]}</li>
									<c:forEach var="category" items="${categories}" varStatus="catStatus">
										<c:if test="${not empty categories[catStatus.index * 3]}">
								            <li>Category ${catStatus.index + 1}:</li>
								            <ul>
								                <li>Class: ${categories[catStatus.index * 3]}</li>
								                <li>Benefit: ${categories[catStatus.index * 3 + 1]}</li>
								                <li>Condition: ${categories[catStatus.index * 3 + 2]}</li>
								            </ul>
						            	</c:if>
							        </c:forEach>
							    </ul>
                            </p>
                        </div>
                        <div class="col-md-2 text-center">
                            <button type="button" class="btn btn-secondary" onclick="window.location.href='<%= request.getContextPath() %>/carddesign'">카드 선택</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        
        
        <div class="row">
            <div class="col">
                <div class="container-lg p-1 mb-4 border rounded border-5">
                    <div class="row align-items-center">
                        <div class="col-md-2 d-flex justify-content-center">
                            <img src="${imageUrls.get(1)}" class="card-img" alt="Card Image" style="width: 150px;">
                        </div>
                        <div class="col-md-8">
                            <p class="card-text">
                                카드의 정석<br>
                                KT 통신비 최대 13000원 할인<br>
                                모든 영화관 3000원 할인<br>
                                연회비 국내 전용 20000원 해외 겸용 20000원<br>
                                전월 국내,외 가맹점 이용금액 30만원 이상 7000원 할인 한도 적용<br>
                                할인 서비스는 KT 통신요금 자동이체 또는 장기할부 서비스 이용시 할인
                            </p>
                        </div>
                        <div class="col-md-2 text-center">
                            <button type="button" class="btn btn-secondary" onclick="window.location.href='carddesign.html'">카드 선택</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div class="row">
            <div class="col">
                <div class="container-lg p-1 mb-4 border rounded border-5">
                    <div class="row align-items-center">
                        <div class="col-md-2 d-flex justify-content-center">
                            <img src="${imageUrls.get(2)}" class="card-img" alt="Card Image" style="width: 150px;">
                        </div>
                        <div class="col-md-8">
                            <p class="card-text">
                                카드의 정석<br>
                                KT 통신비 최대 13000원 할인<br>
                                모든 영화관 3000원 할인<br>
                                연회비 국내 전용 20000원 해외 겸용 20000원<br>
                                전월 국내,외 가맹점 이용금액 30만원 이상 7000원 할인 한도 적용<br>
                                할인 서비스는 KT 통신요금 자동이체 또는 장기할부 서비스 이용시 할인
                            </p>
                        </div>
                        <div class="col-md-2 text-center">
                            <button type="button" class="btn btn-secondary" onclick="window.location.href='carddesign.html'">카드 선택</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div class="row">
            <div class="col">
                <div class="container-lg p-1 mb-4 border rounded border-5">
                    <div class="row align-items-center">
                        <div class="col-md-2 d-flex justify-content-center">
                            <img src="${imageUrls.get(3)}" class="card-img" alt="Card Image" style="width: 150px;">
                        </div>
                        <div class="col-md-8">
                            <p class="card-text">
                                카드의 정석<br>
                                KT 통신비 최대 13000원 할인<br>
                                모든 영화관 3000원 할인<br>
                                연회비 국내 전용 20000원 해외 겸용 20000원<br>
                                전월 국내,외 가맹점 이용금액 30만원 이상 7000원 할인 한도 적용<br>
                                할인 서비스는 KT 통신요금 자동이체 또는 장기할부 서비스 이용시 할인
                            </p>
                        </div>
                        <div class="col-md-2 text-center">
                            <button type="button" class="btn btn-secondary" onclick="window.location.href='carddesign.html'">카드 선택</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div class="row">
            <div class="col">
                <div class="container-lg p-1 mb-5 border rounded border-5">
                    <div class="row align-items-center">
                        <div class="col-md-2 d-flex justify-content-center">
                            <img src="${imageUrls.get(4)}" class="card-img" alt="Card Image" style="width: 150px;">
                        </div>
                        <div class="col-md-8">
                            <p class="card-text">
                                카드의 정석<br>
                                KT 통신비 최대 13000원 할인<br>
                                모든 영화관 3000원 할인<br>
                                연회비 국내 전용 20000원 해외 겸용 20000원<br>
                                전월 국내,외 가맹점 이용금액 30만원 이상 7000원 할인 한도 적용<br>
                                할인 서비스는 KT 통신요금 자동이체 또는 장기할부 서비스 이용시 할인
                            </p>
                        </div>
                        <div class="col-md-2 text-center">
                            <button type="button" class="btn btn-secondary" onclick="window.location.href='carddesign.html'">카드 선택</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        
    </div>
</body>
</html>
