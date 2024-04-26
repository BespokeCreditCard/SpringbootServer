<%@ page import="FINAL.bespoke.model.dto.CardItemDto" %>
<%@ page import="java.util.List" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="../header/header.jsp" %>

<div class="p-3">
    <form method="post" action="${pageContext.request.contextPath}/card/cardAdd" enctype="multipart/form-data">
        <div class="d-flex justify-content-between">
            <h2>카드 추가</h2>
            <button type="submit" class="btn btn-primary">저장</button>
        </div>
        <div class="w-75 align-items-center m-auto">

            <div class="d-flex align-items-center justify-content-between">
                <label>카드명 : </label>
                <div class="w-75">
                    <input type="text" name="card" placeholder="카드명" class="form-control">
                </div>
            </div>
            <div class="d-flex w-100 align-items-center justify-content-between">
                <!-- 파일 업로드를 위한 input -->
                <form method="post" action="/upload/addcardpage" enctype="multipart/form-data">
			        <label for="file">파일 선택:</label>
			        <input type="file" id="file" name="file" accept="image/png" required><br><br>
			        <input type="submit" value="Upload">
			    </form>
                <div class="w-75">
                    <%
                        // 3개가 하나로 들어가야하기때문에 3배수로 돌리기
                        List<CardItemDto> fields = (List<CardItemDto>) request.getAttribute("items");
                        int fieldCount = fields.size();
                        int itemsPerIteration = 3;
                        int iterationCount = (fieldCount + itemsPerIteration - 1) / itemsPerIteration; // 올림 연산

                        for (int i = 0; i < iterationCount; i++) {
                            int startIndex = i == 0 ? 1 : i * itemsPerIteration;
                            int endIndex = Math.min(startIndex + itemsPerIteration, fieldCount);
                    %>
                    <div class="d-flex w-100 align-items-center justify-content-between">
                        <% for (int j = startIndex; j < endIndex; j++) { %>
                        <div style="width: 15%">
                            <label><%= fields.get(j).getLabel() %> :</label>
                        </div>
                        <div style="width: 15%">
                            <input type="number" step="0.00001" name="<%= fields.get(j).getName() %>"
                                   placeholder="<%= fields.get(j).getName() %>" value="0" class="form-control">
                        </div>
                        <% } %>
                    </div>
                    <% } %>
                </div>
            </div>
        </div>
    </form>
</div>

</body>
</html>
