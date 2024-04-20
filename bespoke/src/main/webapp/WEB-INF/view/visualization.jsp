<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<title>Visualization Details</title>
<style>
    table, th, td {
        border: 1px solid black;
        border-collapse: collapse;
    }
    th, td {
        padding: 10px;
    }
</style>
</head>
<body>
<h1>Visualization Details</h1>
<c:if test="${not empty visual}">
    <table>
        <tr><th>Attribute</th><th>Value</th></tr>
        <tr><td>ID</td><td>${visual[0].id}</td></tr>
        <tr><td>Sequence</td><td>${visual[0].seq}</td></tr>
        <tr><td>Age</td><td>${visual[0].age}</td></tr>
        <tr><td>Sex Code</td><td>${visual[0].sexCd}</td></tr>
        <tr><td>Member Rank</td><td>${visual[0].mbrRk}</td></tr>
    </table>
</c:if>
</body>
</html>
