<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="/css/navbar.css">
    <title>우리은행 마이페이지</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
</head>
<body>  
    <nav class="navbar">
        <a href="index.html" class="navbar__brand">우리은행</a>        
        <ul class="navbar__menu">
            <li><a href="${pageContext.request.contextPath}/recommendation">카드 추천</a></li>
            <li><a href="${pageContext.request.contextPath}/carddesign">카드 꾸미기</a></li>
            <li><a href="${pageContext.request.contextPath}/issuecard">카드 발급</a></li>
            <li><a href="${pageContext.request.contextPath}/terms">약관</a></li>
            <li><a href="${pageContext.request.contextPath}/mypage">마이 페이지</a></li>
            <li><a href="${pageContext.request.contextPath}/login">로그인</a></li>
        </ul>
    </nav>
    <div style="height: 50px;"></div> <!-- 본문과의 간격을 조절하기 위한 공백 -->
</body>
</html>