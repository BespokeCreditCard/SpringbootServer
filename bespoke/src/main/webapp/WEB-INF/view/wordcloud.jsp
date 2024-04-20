<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html>
<%@ include file="header/header.jsp" %>
<link href="/css/wordcloud.css" rel="stylesheet">

<script src="https://cdn.anychart.com/releases/8.12.1/js/anychart-core.min.js"></script>
<script src="https://cdn.anychart.com/releases/8.12.1/js/anychart-tag-cloud.min.js"></script>

<body>
    <div class="word_container-fluid">
        <div class="row" style="width:100%">

            <div class="col-md-8">
                <div id="word_container"></div>
            </div>

            <div class="col-md-4">
                <div id="word_radio_button_group" class="d-flex flex-column align-items-start">
                    <c:forEach var="word" items="${wordcloud}" varStatus="status">
                    <div class="word_form-check">
					        <div class="word_radio_button_box">
					            <input class="word_form-check-input" type="radio" name="options" id="option${status.index}" value="option${status.index}" <c:if test="${status.first}">checked</c:if>>
					            <label class="word_form-check-label" for="option${status.index}">
					                ${word[0]}
					            </label>
					        </div>
					</div>
					</c:forEach>
            </div>
            </div>
            
        </div>  
    </div>

	<script>
	var wordcloudData = JSON.parse('<c:out value="${wordcloudJson}" escapeXml="true" />');
    console.log(wordcloudData);
	</script>
</body>
</html>