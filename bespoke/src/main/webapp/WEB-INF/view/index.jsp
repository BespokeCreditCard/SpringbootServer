<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <meta name="description" content="" />
    <meta name="author" content="" />
    <title>Agency - Start Bootstrap Theme</title>
    <!-- Favicon-->
    <link rel="icon" type="image/x-icon" href="woori.png" />
    <!-- Font Awesome icons (free version)-->
    <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
    <!-- Google fonts-->
    <link href="https://fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet" type="text/css" />
    <link href="https://fonts.googleapis.com/css?family=Roboto+Slab:400,100,300,700" rel="stylesheet" type="text/css" />
    <!-- Core theme CSS (includes Bootstrap)-->
    <link href="css/styles.css" rel="stylesheet" />
        <%@ include file="header/header.jsp" %>
</head>
<body id="page-top">
    <div class="masthead">
     <div class="container">
            <div class="masthead-subheading">Bespoke Credit Card</div>
            <div class="masthead-heading text-uppercase">카드 추천 서비스</div>
            <a class="btn btn-primary btn-xl text-uppercase" href="/recommendation_view/selectRecommendation">카드 추천 바로가기</a>
        </div>
    </div>
        
    <!-- Services-->
    <section class="page-section" id="services">
        <div class="container">
            <div class="text-center">
                <h2 class="section-heading text-uppercase">Services</h2>
                <h3 class="section-subheading text-muted">Bespoke Credit Card service</h3>
            </div>
            <div class="row text-center">
                <div class="col-md-4">
                    <h4 class="my-3">카드 꾸미기</h4>
                    <p class="text-muted">내가 원하는 카드 혜택을 선택할 수 있습니다. AI으로 이미지를 변경할 수도 있습니다.</p>
                </div>
                <div class="col-md-4">
                    <h4 class="my-3">카드 추천</h4>
                    <p class="text-muted">나와 비슷한 성향의 고객이 사용한 좋은 카드 상품을 소개드립니다.</p>
                </div>
                <div class="col-md-4">
                    <h4 class="my-3">마이 페이지</h4>
                    <p class="text-muted">본인의 정보와 시각화된 내역을 확인할 수 있습니다.</p>
                </div>
            </div>
        </div>
    </section>
    <!-- Team-->
    <section class="page-section bg-light" id="team">
        <div class="container">
            <div class="text-center">
                <h2 class="section-heading text-uppercase">AI엔지니어링 4팀 소개</h2>
            </div>
            <!-- 팀 멤버 시작 -->
            <div class="row">
                <!-- 첫 번째 팀 멤버 -->
                <div class="col-lg-4">
                    <div class="team-member">
                        <h4>류준규</h4>
                        <p class="text-muted">Leader, Back-end, Data Analysis, Front-end</p>
                        <!-- 소셜 링크 -->
                    </div>
                </div>
                <!-- 두 번째 팀 멤버 -->
                <div class="col-lg-4">
                    <div class="team-member">
                        <h4>신연재</h4>
                        <p class="text-muted">Data Analysis, Front-end</p>
                        <!-- 소셜 링크 -->
                    </div>
                </div>
                <!-- 세 번째 팀 멤버 -->
                <div class="col-lg-4">
                    <div class="team-member">
                        <h4>김준우</h4>
                        <p class="text-muted">Back-end, Planning, PM, Front-end</p>
                        <!-- 소셜 링크 -->
                    </div>
                </div>
                <!-- 네 번째 팀 멤버 -->
                <div class="col-lg-4">
                    <div class="team-member">
                        <h4>우선주</h4>
                        <p class="text-muted">Data Analysis, Planning, Front-end, Back-end</p>
                        <!-- 소셜 링크 -->
                    </div>
                </div>
                <!-- 다섯 번째 팀 멤버 -->
                <div class="col-lg-4">
                    <div class="team-member">
                        <h4>이민수</h4>
                        <p class="text-muted">Back-end, writes documents, planning, Front-end</p>
                        <!-- 소셜 링크 -->
                    </div>
                </div>
            </div>
            <!-- 팀 멤버 종료 -->
        </div>
    </section>
</body>
<script>
    // 스크롤 이벤트 감지
    window.addEventListener('scroll', function() {
        // 현재 스크롤 위치
        var scrollPosition = window.scrollY;

        // 스크롤 위치에 따라 헤더의 배경색 변경
        var navbar = document.querySelector('.navbar');
        if (scrollPosition > 100) {
            navbar.classList.add('scrolled');
        } else {
            navbar.classList.remove('scrolled');
        }
    });
</script>
</html>
