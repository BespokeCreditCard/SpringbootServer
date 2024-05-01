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
    <script src="https://cdnjs.cloudflare.com/ajax/libs/html2canvas/1.3.2/html2canvas.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
    <script>
        document.addEventListener("DOMContentLoaded", function() {
            var loginButton = document.querySelector("#loginButton");
            var logoutButton = document.querySelector("#logoutButton");
            var cardAddButton = document.querySelector("#cardAddButton");

             fetch("http://3.34.232.104/loginCheck", {
                method: "GET",
                headers: {
                    "Content-Type": "application/json",
                },
            }).then((response) => {
                if(response.status === 200) {
                    response.text().then((result) => {
                        if(result === 'false') {
                            loginButton.style.display = 'block';
                            logoutButton.style.display = 'none';
                            cardAddButton.style.display = 'none';
                        } else if(result === 'admin'){
                            cardAddButton.style.display = 'block';
                            logoutButton.style.display = 'block';
                            loginButton.style.display = 'none';
                        } else {
                            cardAddButton.style.display = 'none';
                            logoutButton.style.display = 'block';
                            loginButton.style.display = 'none';
                        }
                    })
                }
             });
        });
    </script>
</head>
<body>  
    <nav class="navbar">
        <a href="${pageContext.request.contextPath}/" class="navbar__brand">Bespoke</a>        
        <ul class="navbar__menu">
            <li id="cardAddButton"><a href="${pageContext.request.contextPath}/card/cardAdd">카드 추가</a></li>
            <li><a href="${pageContext.request.contextPath}/visualization">대시 보드</a></li>
            <li><a href="${pageContext.request.contextPath}/recommendation_view/selectRecommendation">혜택 선택</a></li>
            <li><a href="${pageContext.request.contextPath}/recommendation_view/recommendation">카드 추천</a></li>
            <li><a href="${pageContext.request.contextPath}/design/carddesign?selectCardId=14">카드 꾸미기</a></li>
            <li><a href="${pageContext.request.contextPath}/receivecard">카드 발급</a></li>
            <li><a href="${pageContext.request.contextPath}/terms_view/terms">약관</a></li>
            <li><a href="${pageContext.request.contextPath}/mypage">마이 페이지</a></li>
            <li id="loginButton"><a href="${pageContext.request.contextPath}/login">로그인</a></li>
            <li id="logoutButton"><a href="${pageContext.request.contextPath}/logouts">로그아웃</a></li>
        </ul>
    </nav>
   
</body>
</html>
