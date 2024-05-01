<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
    <%@ include file="header/header.jsp" %>
</head>


<style>
	body {
		font-family: 'KCC-Hanbit';
	}

	h3 {
		font-size: 35px;
	}

    .container-wrapper {
        padding: 3rem;
        min-height: 45.5rem;
        background-color: #f1f1f1;
        border-radius: 5px;
    }
    
    @font-face {
	    font-family: 'KCC-Hanbit';
	    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/2403-2@1.0/KCC-Hanbit.woff2') format('woff2');
	    font-weight: normal;
	    font-style: normal;
	}
</style>

<body>

<div class="container-wrapper">
    <div class="container text-center" >
        <div class="row">
            <div class="col">
                <h3>당신의 소비 패턴에 관련된 그래프를 참고하여, 다음 페이지에서 혜택을 선택해보세요.</h3>
                <br>
                <br>
            </div>
        </div>
    </div>
<%--    <c:out value="${seq}" />--%>

    <div class="container-fluid">
        <div class="row mt-5">
            <div class="col-md-6">
                <iframe id="kibanaDashboard" height="280%" width="765px"></iframe>
            </div>
            <div class="col-md-6">
                <iframe id="kibanaDashboard2" height="280%" width="765px"></iframe>
            </div>
        </div>
    </div>

    <div class="container-fluid fixed-bottom" id="prevBtnDiv">
        <div class="row justify-content-end mb-3">
            <div class="col-6 text-end">
                <button type="button" class="btn btn-secondary" onclick="window.location.href='/recommendation_view/selectRecommendation'">다음</button>
            </div>
        </div>
    </div>
</div>


    <script>
        // 페이지가 로드될 때 실행되는 함수입니다.
        window.onload = function() {
            var seq = "<c:out value='${seq}'/>"; // JSTL c:out 태그를 사용하여 서버로부터 전달받은 SEQ 값을 HTML로 인코딩
            var dashboardUrl = generateDashboardUrl(seq);
            var dashboardUrl2 = generateDashboardUrl2(seq);
            document.getElementById('kibanaDashboard').src = dashboardUrl;
            document.getElementById('kibanaDashboard2').src = dashboardUrl2;
        };
        // 대시보드 URL을 생성하는 함수입니다.
        function generateDashboardUrl(seq) {
            return "https://e81c-118-131-63-236.ngrok-free.app/app/dashboards#/view/68518b80-012f-11ef-8a39-c130702c98df?embed=true&_g=(filters:!((query:(query_string:(query:'SEQ:"+seq+"')))),refreshInterval%3A(pause%3A!t%2Cvalue%3A60000)%2Ctime%3A(from%3Anow-8y%2Cto%3Anow))&hide-filter-bar=true"
        }
        function generateDashboardUrl2(seq) {
            return "https://e81c-118-131-63-236.ngrok-free.app/app/dashboards#/view/1c4712e0-01d0-11ef-8a39-c130702c98df?embed=true&_g=(filters:!((query:(query_string:(query:'SEQ:"+seq+"')))),refreshInterval%3A(pause%3A!t%2Cvalue%3A60000)%2Ctime%3A(from%3Anow-15m%2Cto%3Anow))&hide-filter-bar=true"
        }
    </script>
</body>
</html>