<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>AI 이미지 생성</title>
</head>
<body>
    <div style="float: left; width: 50%;">
        <h2>AI 이미지 생성</h2>
       <%--  <img src="${aiImage}" alt="AI Image"> --%>
        <img src="https://woori-fisa-bucket.s3.ap-northeast-2.amazonaws.com/index_img/bcc_005.jpg" class="img-fluid" alt="">
    </div>

    <div style="float: right; width: 50%;">
        <h2>텍스트 편집</h2>
        <!-- 텍스트 편집 관련 내용 추가 -->
        <button>텍스트 편집 버튼</button>
    </div>
    <div style="clear: both;"></div>
    <div style="float: left; width: 50%;">
        <h2>카드 미리보기</h2>
        <!-- 카드 미리보기 관련 내용 추가 -->
        <button>카드 미리보기 버튼</button>
    </div>
    <div style="float: right; width: 50%;">
        <h2>카드 임시저장</h2>
        <!-- 카드 임시저장 관련 내용 추가 -->
        <button>카드 임시저장 버튼</button>
    </div>
    <div style="clear: both;"></div>
</body>
</html>
