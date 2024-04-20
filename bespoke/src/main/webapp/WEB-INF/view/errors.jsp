<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page isErrorPage="true" %>
<!DOCTYPE html>
<html>
<head>
    <%@include file="header/header.jsp"%>
</head>
<body>
    <h2>Error</h2>
    <p>다시해 이새끼야아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아</p>
    <p>${errorMessage}</p>
</body>

<script>
    // 1.5초 후에 뒤로가기 기능을 수행하는 함수
    setTimeout(function() {
        window.history.back();
    }, 1500); // 1500 밀리초 (1.5초)
</script>
</html>
