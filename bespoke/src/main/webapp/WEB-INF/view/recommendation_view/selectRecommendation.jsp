<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
    <%@ include file="../header/header.jsp" %>

</head>
<style>
    #benefits {
        display: grid;
        grid-template-columns: repeat(3, 1fr);
        grid-gap: 10px;
        overflow-y: scroll;
        height: 60%;
    }
    .button {
        background-color: #ccc;
        border: none;
        color: white;
        padding: 15px 32px;
        text-align: center;
        text-decoration: none;
        display: inline-block;
        font-size: 16px;
        margin: 4px 2px;
        cursor: pointer;
        border-radius: 8px;
    }
    .button.on {
        background-color: #0dcaf0;
    }
</style>
<body>
    <section class="p-3">
        <div class="">
            <%--    seq 의 div에 값으로 유저 seq 삽입해야함 없으면 오류--%>
            <div id="seq" class="d-none">PQWJLYMVC3XDJHYLZ4XM</div>
            <div id="cluster_num" class="d-none"></div>
            <h2>카드 추천</h2>
            <h5>원하시는 혜택을 선택해주세요.</h5>
        </div>
    </section>
    <section class="container-lg p-3 m-auto mt-5 border border-primary bg-light rounded border-5 ">
        <div id="benefits" class="">
<%--                <button id="benefit0" class="button" type="button" onclick="클릭이벤트" value="유형1">유형1</button>--%>
        </div>
        <div class="container-fluid fixed-bottom" id="prevNextBtnDiv">
            <div class="row justify-content-end mb-3">
                <div class="col-6 text-end">
                    <button id="sendBenefit" class="btn btn-outline-secondary">선택</button>
                </div>
            </div>
        </div>
    </section>

</body>
<script src="/js/getBenefitsByFlask.js"></script>
<script src="/js/selectRecommendation.js"></script>
</html>
