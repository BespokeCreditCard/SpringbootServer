<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html>
<%@ include file="header/header.jsp" %>
<link href="/css/wordcloud.css" rel="stylesheet">

<script src="https://cdn.anychart.com/releases/8.12.1/js/anychart-core.min.js"></script>
<script src="https://cdn.anychart.com/releases/8.12.1/js/anychart-tag-cloud.min.js"></script>
<style>
	@font-face {
	    font-family: 'KCC-Hanbit';
	    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/2403-2@1.0/KCC-Hanbit.woff2') format('woff2');
	    font-weight: normal;
	    font-style: normal;
	}
	
	body {
	    font-family: 'KCC-Hanbit';
	}
</style>
<body>
	<div class="word_container-fluid">
		<div class="row" style="width:100%">

			<div class="col-md-9 mt-3">
				<div id="word_container" style="height: 700px;"></div>
			</div>

			<div class="col-md-3"  style="background-color: #f4f4f4;">
				<div id="word_radio_button_group" class="d-flex flex-column align-items-start mt-4">
					<c:forEach var="word" items="${worddetailscardname}" varStatus="status">
						<div class="word_form-check">
							<div class="word_radio_button_box">
								<input class="word_form-check-input" type="radio" name="options" id="option${status.index}" value="${status.index}" ${status.first ? 'checked' : ''}>
								<label class="word_form-check-label" for="option${status.index}">
										${word}
								</label>
							</div>
						</div>
					</c:forEach>
				</div>

				<div class="container-fluid fixed-bottom">
					<div class="row justify-content-start mb-3">
						<div class="col-6">
							<button type="button" class="btn btn-secondary" onclick="window.location.href='/recommendation_view/recommendation'">이전</button>
						</div>
						<div class="col-6 text-end">
							<button id="sendBenefit" class="btn btn-secondary btn-lg" onclick="window.location.href='/carddetail_view/carddetail'">한눈에 보기</button>
						</div>
					</div>
				</div>

			</div>
		</div>

	</div>
	</div>






<script>
	document.addEventListener("DOMContentLoaded", function() {
		// JSON 데이터를 JavaScript 객체로 파싱
		console.log(${wordcloudJson});
		var wordcloudData = JSON.parse('${word}');
		console.log(wordcloudData);

		function drawChart(in_data) {
			anychart.onDocumentReady(function () {
				any_data = anychart.data.set(in_data);
				var chart = anychart.tagCloud(any_data);
				chart.angles([0, 30, 90]);
				chart.selected().fill("#1f66ad");
				chart.container('word_container');

				chart.draw();
			});
		}

		drawChart(wordcloudData[0]);

		// 라디오 버튼 이벤트 리스너 설정
		document.querySelectorAll('input[type="radio"]').forEach(function(radio) {
			radio.addEventListener('change', function() {
				a = any_data.mapAs();
				num = a.getRowsCount();
				console.log("A="+any_data.mapAs());
				for (var i = 0; i < num; i++) {
					any_data.remove(0);
				}
				console.log("any_data="+any_data);
				var index = parseInt(this.value, 10);
				var newData = wordcloudData[index];
				console.log("new_data="+newData);
				for (var i = 0; i < newData.length; i++) {
					// newData 배열의 각 요소에 접근하여 작업 수행
					var dataPoint = newData[i];
					// 예시: 각 데이터 포인트의 x와 value 값 출력
					console.log("x:", dataPoint.x, "value:", dataPoint.value);
					any_data.insert(
							{
								x: dataPoint.x,
								value: dataPoint.value
							}
					);
				}
			});
		});
	});
</script>
</body>
</html>