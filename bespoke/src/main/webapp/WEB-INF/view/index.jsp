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
	 <%-- <%@include file = "/WEB-INF/view/include/header.jsp" %> --%>
	 Hello Web
	 
	 <%@include file = "/WEB-INF/view/recommendation_view/recommendation.jsp" %>
	 <%-- jpg 파일은 안되고 png 파일만 가능 --%>
	 <%-- resource/static/img/shin.png --%>
	 <%-- <img src="/img/profile.png" /> --%>
	 
	  <div style="width: 100%; height: 600px; position: relative;">
    <img src="${pageContext.request.contextPath}/12.jpg" style="height: 100%; position: absolute; top: 0; left: 0; z-index: 1;" />
    </div>
	
    <div style="width: 100%; height: 600px; position: relative;">
    <img src="${pageContext.request.contextPath}/14.jpg" style="height: 100%; position: absolute; top: 0; left: 0; z-index: 1;" />
    </div>
	
    <div style="width: 100%; height: 600px; position: relative;">
    <img src="${pageContext.request.contextPath}/ic.png" style="height: 100%; position: absolute; top: 0; left: 0; z-index: 1;" />
    </div>
<%-- -------------------------------------------------------------- --%>

<%-- -------------------------------------------------------------- --%>
	 
</body>
</html>