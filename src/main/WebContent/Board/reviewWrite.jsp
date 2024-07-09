<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>리뷰 작성</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
<style>
 /*    body {
        background-color: #f8f9fa;
        font-family: Arial, sans-serif;
    } */
    .container {
        margin-top: 50px;
    }
    .card {
        background-color: #fff;
        box-shadow: 0 4px 8px rgba(0,0,0,0.1);
    }
    .btn-primary {
        background-color: #007bff;
        border-color: #007bff;
    }
    .btn-primary:hover {
        background-color: #0056b3;
        border-color: #0056b3;
    }
    .photo-upload {
        border: 2px dashed #ccc;
        border-radius: 8px;
        text-align: center;
        padding: 20px;
        margin-bottom: 10px;
    }
    .photo-upload p {
        margin-bottom: 0;
    }
</style>
</head>
<body 
	style="overflow-x: scroll; margin: 0 auto; width: 1200px; align-items: center; background-color:#f7f7f7;">
    <%@include file="../layout/Header.jsp"%>
<div class="container">
    <div class="card">
        <div class="card-header">
            <h2>리뷰 작성</h2>
        </div>
        <div class="card-body">
            <form action="write" method="post" enctype="multipart/form-data" onsubmit="return validateForm()">
                <div class="mb-3">
                    <label for="transactionId" class="form-label">거래 ID:</label>
                    <input type="text" class="form-control" id="transactionId" name="transactionId" required>
                </div>
                <div class="mb-3">
                    <label for="title" class="form-label">제목:</label>
                    <input type="text" class="form-control" id="title" name="title" required>
                </div>
                <div class="mb-3">
                    <label for="detail" class="form-label">내용:</label>
                    <textarea class="form-control" id="detail" name="detail" required></textarea>
                </div>
                <div class="mb-3">
                    <label for="rating" class="form-label">평점:</label>
                    <input type="number" class="form-control" id="rating" name="rating" min="1" max="10" required>
                </div>
                <div class="photo-upload">
                    <input type="file" id="reviewImages" name="reviewImages" class="form-control" multiple required>
                    <p>이미지를 추가해주세요</p>
                </div>
                <button type="submit" class="btn btn-primary">작성</button>
            </form>
        </div>
    </div>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
<script>
function validateForm() {
    var transactionId = document.getElementById("transactionId").value;
    if (!transactionId) {
        alert("거래 ID를 입력해주세요.");
        return false;
    }
    return true;
}
</script>
</body>
<%@ include file="../layout/Footer.jsp"%>
</html>
