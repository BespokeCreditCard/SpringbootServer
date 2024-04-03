<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>AI 이미지 생성</title>
</head>
<body>
    <div style="width: 50%;">
        <div> top 5 card </div>
        <%-- RecommendationController에서 전달된 데이터를 출력하는 부분 --%>
        <ul>
            <li>${recommendations.recommendation1}</li>
            <li>${recommendations.recommendation2}</li>
            <li>${recommendations.recommendation3}</li>
            <li>${recommendations.recommendation4}</li>
            <li>${recommendations.recommendation5}</li>
        </ul>
    </div>
    <div style="clear: both;"></div>
</body>
</html>