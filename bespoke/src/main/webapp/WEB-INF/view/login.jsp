<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

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
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
</head>
<body>  
    <nav class="navbar">
        <a href="index" class="navbar__brand">우리은행</a>        
        <ul class="navbar__menu">
            <li><a href="Recommendation.jsp">카드 추천</a></li>
            <li><a href="carddesign.jsp">카드 꾸미기</a></li>
            <li><a href="IssueCard.jsp">카드 발급</a></li>
            <li><a href="${pageContext.request.contextPath}/terms">약관</a></li>
            <li><a href="MyPage.jsp">마이 페이지</a></li>
            <li><a href="${pageContext.request.contextPath}/login">로그인</a></li>
        </ul>
    </nav>

    <div class="container-lg p-5 m-auto mt-5 border border-primary bg-light rounded border-5">
        <div class="row p-2 mt-3 mb-3 align-items-center ">
            <div class="row justify-content-center">
                <div class="col-md-8">
                    <div class="card mt-3">
                        <div class="card-body">
                            <div class="d-flex justify-content-start mb-4">
                                <img src="/img/bank.png" alt="우리은행 로고" style="width: 150px;">
                            </div>
                            <div style="color: red;">
							    <% if (request.getParameter("error") != null) { %>
								    <div class="alert alert-danger" role="alert">
								        잘못된 사용자 이름 또는 비밀번호입니다.
								    </div>
								<% } %>
							</div>

                            <h2 class="card-title text-center mb-4">로그인</h2>
                            <form method="post" action="/login">
                                <div class="form-group mb-3">
                                    <label for="username">아이디</label>
                                    <input type="text" id="username" name="username" required class="form-control">
                                </div>
                                <div class="form-group mb-3">
                                    <label for="password">비밀번호</label>
                                    <input type="password" id="password" name="password" required class="form-control">
                                </div>
                                
                                <div class="d-grid gap-4 mt-5">
                                    <button type="submit" class="btn btn-primary">로그인</button>
                                    <a href="${pageContext.request.contextPath}/join" class="btn btn-secondary">회원가입</a>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

</body>
</html>