<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
</head>
<body>
<%-- include로 가져올거야 --%>
	 <%@include file = "/WEB-INF/view/include/header.jsp" %>
	 Hello Web
	 
	 <%-- jpg 파일은 안되고 png 파일만 가능 --%>
	 <%-- resource/static/img/shin.png --%>
	 <img src="/img/profile.png" />
	 
	 
<%-- -------------------------------------------------------------- --%>

<%-- -------------------------------------------------------------- --%>
	 
</body>
</html>