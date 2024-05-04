<%@ page import="FINAL.bespoke.model.dto.CardItemDto" %>
<%@ page import="java.util.List" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="../header/header.jsp" %>
<link rel="stylesheet" type="text/css" href="/css/aigenerator.css">
<div class="container-xxl shadow-lg p-2 m-auto mt-5 bg-white rounded border-5" style="min-width: 1500px; font-family: 'KCC-Hanbit';">
    <form method="post" action="${pageContext.request.contextPath}/card/cardAdd" enctype="multipart/form-data">
        <div class="d-flex justify-content-between p-2">
            <h2>카드 추가</h2>
            <div>
                <button type="button" onclick="showModal()" class="btn btn-success">속성추가</button>
                <button type="submit" class="btn btn-primary">저장</button>
            </div>
        </div>
        <div class="align-items-center mt-2">

            <div class="d-flex align-items-center justify-content-between" style="padding-left: 1.5rem">
                <label style="color: #ff2035">카드명* : </label>
                <div style="width: 75%">
                    <input type="text" name="card" placeholder="카드명" class="form-control">
                </div>
            </div>
            <div class="d-flex w-100 justify-content-between pt-2" style="max-height: 550px">
                <div class="card col-3 m-4" style="width: 18rem; height: 32rem;">
                    <div id="previewDiv" style="position: relative; overflow: hidden; display: flex; justify-content: center; align-items: center; width: 100%; height: 100%; object-fit: contain;">
                        <img src="" id="preview" style="max-width: 90%; max-height: 90%;">
                    </div>
                    <div class="card-body h-3 text-center">
                        <div class="btn-container my-1">
                            <label for="file" class="custom-file-label w-75">파일 업로드</label>
                            <input type="file" id="file" name="files" class="custom-file-input" accept="image/*" style="display: none">
                        </div>
                    </div>
                </div>
                <div id="card-column-list" class="w-75" style="display:grid;grid-template-columns:0.5fr 1fr 0.5fr 1fr 0.5fr 1fr;text-align:center; align-items:center; justify-content:center; padding-right: 2rem;overflow-y: scroll;grid-template-rows: repeat(9, minmax(50px, auto));">
                    <%
                        // 3개가 하나로 들어가야하기때문에 3배수로 돌리기
                        List<CardItemDto> fields = (List<CardItemDto>) request.getAttribute("items");
                        int fieldCount = fields.size();
                        int itemsPerIteration = 3;
                        int iterationCount = 1;
//                                (fieldCount + itemsPerIteration - 1) / itemsPerIteration; // 올림 연산

                        for (int i = 0; i < iterationCount; i++) {
                            int startIndex = i == 0 ? 1 : i * itemsPerIteration;
                            int endIndex = 3;
//                                    Math.min(startIndex + itemsPerIteration, fieldCount);
                    %>

                        <% for (int j = startIndex; j < endIndex; j++) { %>
                            <div>
                                <label style="color: #ff2035"><%= fields.get(j).getLabel() %>* :</label>
                            </div>
                            <div>
                                <input type="number" step="1" name="<%= fields.get(j).getName() %>"
                                       placeholder="<%= fields.get(j).getName() %>" value="0" class="form-control">
                            </div>
                        <% }
                    } %>
                </div>
            </div>
        </div>
    </form>
    <div class="modal fade" id="card-column-modal" tabindex="-1" aria-labelledby="gifModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-xl modal-dialog-centered" >
            <div class="modal-content  w-full">
                <div class="modal-header w-full d-flex justify-content-between">
                    <h5 class="modal-title text-center" >속성 추가</h5>
                    <div>
                        <button type="button" class="btn btn-primary" onclick="addColumn()">추가</button>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                </div>
                <div class="modal-body" style="display: grid; gap: 1rem; grid-template-columns: 1fr 1fr 1fr 1fr 1fr">
                    <% for (int i = 3; i < fields.size() - 3; i++) { %>
                        <button id="<%= fields.get(i).getName() %>" type="button" class="btn btn-dark" onclick="handleColumnCheck('<%= fields.get(i).getName() %>','<%= fields.get(i).getLabel() %>')"><%= fields.get(i).getLabel() %></button>
                    <% } %>
                </div>
            </div>
        </div>
    </div>
</div>
<script>
    function previewFile() {
        fileDrawn = false;
        const preview = document.getElementById('preview');
        const fileInput = document.getElementById('file');
        const file = fileInput.files[0];
        const reader = new FileReader();

        reader.addEventListener('load', function () {
            preview.src = reader.result;
        }, false);

        if (file) {
            reader.readAsDataURL(file);
        }
    }

    document.getElementById('file').addEventListener('change', previewFile);
    function showModal() {
        const modal = document.getElementById('card-column-modal');
        new bootstrap.Modal(modal).show();

    }
</script>
<script>
    // field를 활용하는 함수

    var items = [];

    function handleColumnCheck(name, label) {
        if(items.some((item) => item.name === name)) {
            items = items.filter((item) => item.name !== name);
            document.getElementById(name).classList.remove("btn-primary");
            document.getElementById(name).classList.add("btn-dark");
        } else {
            items.push({
                name,label
            });
            document.getElementById(name).classList.remove("btn-dark");
            document.getElementById(name).classList.add("btn-primary");
        }
    }

    function addColumn() {
        let cardColumnList = document.getElementById("card-column-list");
        for(let i of items) {

            // 새로운 div 요소 생성
            var newDiv1 = document.createElement("div");
            var newDiv2 = document.createElement("div");

            // 첫 번째 div에 label 추가
            var labelElement = document.createElement("label");
            labelElement.textContent = i.label + ":";
            newDiv1.appendChild(labelElement);

            // 두 번째 div에 input 요소 추가
            var inputElement = document.createElement("input");
            inputElement.setAttribute("type", "number");
            inputElement.setAttribute("step", "0.001");
            inputElement.setAttribute("name", i.name);
            inputElement.setAttribute("placeholder", i.name);
            inputElement.setAttribute("value", "0");
            inputElement.classList.add("form-control");
            newDiv2.appendChild(inputElement);

            // cardColumnList의 자식으로 새로운 div들 추가
            cardColumnList.appendChild(newDiv1);
            cardColumnList.appendChild(newDiv2);

            document.getElementById(i.name).style.display = "none";
        }

        items = [];
        const columnModal = document.getElementById('card-column-modal');
        const modal = bootstrap.Modal.getInstance(columnModal);
        modal.hide();
    }
</script>
</body>
</html>
