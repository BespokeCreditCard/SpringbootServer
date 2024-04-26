<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>AWS S3 파일 업로드</title>
</head>
<body>
    <h2>AWS S3 파일 업로드하자!!!!!!!!!!!!!!!!!!!!! 드가자아!!!!!!!!!!!!!!!!!!</h2>
    
    <form method="post" action="/cardAdd/uploadtest" enctype="multipart/form-data">
        <label for="file">Select Image:</label>
        <input type="file" id="file" name="file" accept="image/png" required><br><br>
        
        <label for="customerName">Customer Name:</label>
        <input type="text" id="customerName" name="customerName" required><br><br>
        
        <input type="submit" value="Upload">
    </form>
</body>
</html>
