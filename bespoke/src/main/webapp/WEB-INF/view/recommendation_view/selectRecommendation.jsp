<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
    <%@ include file="../header/header.jsp" %>

</head>
<style>
	body {
	    font-family: 'KCC-Hanbit';
	}

	@font-face {
	    font-family: 'KCC-Hanbit';
	    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/2403-2@1.0/KCC-Hanbit.woff2') format('woff2');
	    font-weight: normal;
	    font-style: normal;
	}
	
    .container-wrapper {
        min-height: 45.5rem;
        padding: 4rem;
        background-color: #f1f1f1;
        border-radius: 5px;
    }

    .container-white {
        overflow: hidden; /* 자식 요소가 float 속성을 가지면 부모 요소의 높이가 사라지는 것을 방지합니다. */
        background-color: #ffffff;
        border-radius: 10px;
        box-shadow: 5px 5px 10px rgba(0, 0, 0, 1);
    }


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
        box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1); /* 그림자 추가 */
    }
    .button.on {
        background-color: #0dcaf0;
    }
</style>
<body>
    <div class="container-wrapper">
        <div class="container-white">

            <section class="p-3">
                <div class="card mb-3">
                    <h2>카드 혜택</h2>
                    <h5>원하시는 혜택을 선택해주세요</h5>
                </div>
                <div id="userId" style="display: none;">${userId}</div>
            </section>
                <div id="benefits" class="p-2" >
                </div>

                <div class="container-fluid fixed-bottom" id="prevNextBtnDiv">
                    <div class="row justify-content-end mb-3">
                        <div class="col-6 text-end">
                            <button id="sendBenefit" class="btn btn-outline-secondary">선택</button>
                        </div>
                    </div>
                </div>

        </div>
    </div>

</body>
<script>var contextPath = "<%= request.getContextPath() %>";</script>
<script src="/js/selectRecommendation.js"></script>
</html>
