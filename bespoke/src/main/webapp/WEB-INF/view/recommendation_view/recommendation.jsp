<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>추천</title>
</head>
<body>
    <h1>추천 상품</h1>
    <p>1위: ${recommendationDto.top1}</p>
    <p>2위: ${recommendationDto.top2}</p>
    <p>3위: ${recommendationDto.top3}</p>
    <p>4위: ${recommendationDto.top4}</p>
    <p>5위: ${recommendationDto.top5}</p>
</body>
</html>