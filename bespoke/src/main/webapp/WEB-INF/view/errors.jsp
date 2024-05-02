<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page isErrorPage="true" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <%@include file="header/header.jsp"%>
    <title>에러 발생</title>
    <style> 
    @font-face {
        font-family: 'Sansation_Bold';
        src: url('/fonts/Sansation_Bold.ttf') format('truetype');
    }
    body {
        display: flex;
        justify-content: center;
        align-items: center;
        height: 100vh;
        margin: 0;
        background-color: #f7f7f7;
        color: #333;
        font-family: 'Sansation_Bold', Arial, sans-serif;
    }
    .error-container {
        text-align: center;
        box-shadow: 0 4px 8px rgba(0,0,0,0.1);
        padding: 20px;
        background: white;
        border-radius: 8px;
    }
    h2 {
        color: #d04545;
    }
    p {
        margin-top: 10px;
        color: #666;
    }
    </style>
</head>
<body>
    <div class="error-container">
        <h2>오류 발생</h2>
        <p>잘못된 접근입니다.</p>
        <p>${errorMessage}</p>
    </div>

    <script>
        // 1.5초 후에 뒤로 가기 기능을 수행하는 함수
        setTimeout(function() {
            window.history.back();
        }, 1500); // 1500 밀리초 (1.5초)
    </script>
</body>
</html>
