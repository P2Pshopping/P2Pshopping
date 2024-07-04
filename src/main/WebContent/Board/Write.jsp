<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<!-- 현재 오류가  java.io.IOException: java.io.FileNotFoundException: 어디서 경로를 지정한 건지 찾을 수가 없음 -->

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/css/bootstrap.min.css">
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.11.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/js/bootstrap.min.js"></script>
    <!-- CKEditor CDN 추가 -->
    <script src="https://cdn.ckeditor.com/4.16.0/standard/ckeditor.js"></script>
    <title>글작성</title>
    <style>
        body {
            font-size: 14px;
            background-color: #f8f9fa;
        }

        #container {
            max-width: 900px;
            padding: 20px;
            margin: 20px auto;
            background-color: #ffffff;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        .form-group label {
            font-weight: bold;
        }

        .btn-primary {
            background-color: #007bff;
            border-color: #007bff;
        }

        .btn-primary:hover {
            background-color: #0056b3;
            border-color: #004085;
        }

        .btn-secondary {
            background-color: #6c757d;
            border-color: #6c757d;
        }

        .btn-secondary:hover {
            background-color: #5a6268;
            border-color: #545b62;
        }

    </style>
</head>
<body>
    <jsp:include page="../layout/Header.jsp" />
    <!-- Main Container -->
    <div id="container">
        <h2 class="text-center"></h2>
        <form name="writeFrm" method="post" enctype="multipart/form-data" action="../mvcboard/write.do" onsubmit="return validateForm(this);">
            <div class="form-group">
                <label for="category">분류</label>
                <select class="form-control" id="bno" name="bno">
                    <option value="1">아기 자랑</option>
                    <option value="2">거래 후기</option>
                </select>
            </div>
            <div class="form-group">
                <label for="title">제목</label>
                <input type="text" class="form-control" id="title" name="title" placeholder="제목을 입력하세요">
            </div>
            <div class="form-group">
                <label for="name">작성자: </label>
                <span><%=session.getAttribute("name")%></span>
                <input type="hidden" name="username" value="<%=session.getAttribute("username")%>">
            </div>
            <div class="form-group">
                <label for="content">내용</label>
                <textarea class="form-control" id="content" name="content" rows="10" placeholder="내용을 입력하세요"></textarea>
                <script>
                    CKEDITOR.replace('content');
                </script>
            </div>
            <div class="form-group">
                <label for="attachedFile">파일 첨부</label>
                <input type="file" class="form-control-file" name="attachedFile" id="attachedFile" onchange="insertFileIntoEditor()">
            </div>
            <div class="text-center">
                <button type="submit" class="btn btn-primary">확인</button>
                <button type="button" class="btn btn-secondary" onclick="location.href='../Board/List.jsp';">취소</button>
            </div>
        </form>
    </div>
    <jsp:include page="../layout/Footer.jsp" />
    <script>
        function insertFileIntoEditor() {
            var file = document.getElementById('attachedFile').files[0];
            if (!file) {
                return;
            }
            var fileType = file.type;
            if (fileType.startsWith('image/')) {
                // 이미지 파일 처리 로직
            } else {
                alert('이미지 파일이 아닙니다.');
            }
        }

        function validateForm(form) {
            var title = form.title.value.trim();
            var content = CKEDITOR.instances.content.getData().trim();
            if (title === "") {
                alert("제목을 입력하세요.");
                form.title.focus();
                return false;
            }
            if (content === "") {
                alert("내용을 입력하세요.");
                CKEDITOR.instances.content.focus();
                return false;
            }
            return true;
        }
    </script>
</body>
</html>
