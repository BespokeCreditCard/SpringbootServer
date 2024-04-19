<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri ="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" type="text/css" href="/css/aigenerator.css">
    <title>혜택 선택</title>
</head>
<body>
    <form action="/flask/getCluster" method="post">
        SEQ: <input id="seq" type="text" name="seq">
        <br>
        <input id="sendSeqBtn" type="submit" value="회원가입">
    </form>
    
    <div id="resultdDiv">
    </div>
    
    <div id="errorMessageContainer"></div>
    
    <div id="benefits">혜택목록</div>
    <button id="submitBenefits" style="opacity: 0">선택완료</button>
    
	<script src="/js/flaskCluster.js"></script>
</body>
</html>

