<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<!DOCTYPE html>
<html lang="ko">
<%@ include file="header/header.jsp" %>
<style>
        .container {
            display: flex;
            height: 100vh;
        }
        .left {
            width: 33.33%;
            background-color: #f1f1f1;
            padding: 20px;
        }
        .right {
            width: 66.67%;
            padding: 20px;
        }
        .card {
            text-align: center;
            margin-top: 20px;
        }
        .info {
            margin-top: 20px;
        }
</style>

<body>
    <div class="container">
        <div class="left">
            <img src="profile.jpg" alt="Profile Picture" width="100%">
            <div class="card">
                <h3>Card Name</h3>
            </div>
        </div>
        <div class="right">
            <div class="info">
                <h2>Personal Information</h2>
                <p>Name: John Doe</p>
                <p>Age: 30</p>
                <p>Address: 123 Main St, Anytown USA</p>
            </div>
            <div class="data">
                <h2>Data</h2>
                <%
                    // Fetch data from a database or other source and display it here
                    String[] data = {"Data 1", "Data 2", "Data 3", "Data 4", "Data 5"};
                    for (String item : data) {
                        out.println("<p>" + item + "</p>");
                    }
                %>
            </div>
        </div>
    </div>
</body>
</html>
