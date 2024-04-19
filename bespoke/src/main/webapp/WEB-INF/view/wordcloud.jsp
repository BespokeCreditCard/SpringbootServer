<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<%@ include file="header/header.jsp" %>
<link href="/css/wordcloud.css" rel="stylesheet">

<script src="https://cdn.anychart.com/releases/8.12.1/js/anychart-core.min.js"></script>
<script src="https://cdn.anychart.com/releases/8.12.1/js/anychart-tag-cloud.min.js"></script>

<body>
    <div class="word_container-fluid">
        <div class="row" style="width:100%">

            <div class="col-md-8">
                <div id="word_container"></div>
            </div>
            <div class="col-md-4">
            	            <div id="word_radio_button_group" class="d-flex flex-column align-items-start">
                <div class="word_form-check">
                    <div class="word_radio_button_box" >
                        <input class="word_form-check-input" type="radio" name="options" id="option1" value="option1" checked>
                        <label class="word_form-check-label" for="option1">
                            ${wordcloud[0]}
                        </label>
                    </div>
                </div>
                <!-- 추가 라디오 버튼들이 필요하면 여기에 추가 -->
            </div>
            </div>
            
        </div>  
    </div>

    <script>
        anychart.onDocumentReady(function () {
            // create data   
            var data = ${wordcloud[1]};

            // create a chart and set the data
            var chart = anychart.tagCloud(data);

            // set the container id
            chart.container("word_container");
            chart.angles([0, 30, 90]);
            chart.selected().fill("#1f66ad");
            // initiate drawing the chart
            chart.draw();
        });
    </script>
</body>
</html>