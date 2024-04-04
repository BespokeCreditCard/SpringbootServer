<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
    <title>AI 이미지 생성</title>
</head>
<body>    
    <ul>
        <li>Product Name: ${elasticresults[0]}</li>
        <li>ID: ${elasticresults[1]}</li>
        <li>card_link: ${elasticresults[2]}</li>
        <li>card_type: ${elasticresults[3]}</li>
        <li>domestic_year_cost: ${elasticresults[4]}</li>
        <li>abroad_year_cost: ${elasticresults[5]}</li>
        <li>previous_month_performance: ${elasticresults[6]}</li>
        <li>categories: ${categories}</li>

    </ul>
    
</body>
</html>
