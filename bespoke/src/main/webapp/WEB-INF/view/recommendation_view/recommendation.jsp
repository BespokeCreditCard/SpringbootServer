<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>추천</title>
</head>
<body>
    <h1>추천 상품</h1>
    <%-- 이미지 URL 리스트 순회 --%>
    <c:forEach var="imageUrl" items="${imageUrls}">
        <img src="https://woori-fisa-bucket.s3.ap-northeast-2.amazonaws.com/${imageUrl}" alt="상품 이미지">
    </c:forEach>

</body>
</html>