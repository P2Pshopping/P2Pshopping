<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.11.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/js/bootstrap.min.js"></script>
<link href="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.12/summernote-bs4.css" rel="stylesheet">
<script src="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.12/summernote-bs4.js"></script>

<title>게시글</title>
<style>
body {
    font-size: 14px;
}

#container {
    width: 1200px;
    padding: 20px;
    margin: 0 auto;
}

#contents {
    flex-grow: 1;
    margin: 20px;
}

#left-sidebar, #right-sidebar {
    width: 150px;
    margin-bottom: 20px;
}

#left-sidebar {
    margin-right: 20px;
}

#right-sidebar {
    margin-left: 20px;
}

.flex-container {
    display: flex;
}

footer {
    background-color: #f8f9fa;
    padding: 20px 0;
    text-align: center;
    margin-top: 20px;
}
</style>
</head>
<body>

<!-- Main Container -->
<div id="container">
    <div class="flex-container">
        <div id="left-sidebar">
            <div class="btn-group-vertical" role="group" aria-label="Vertical button group">
                <button type="button" class="btn btn-outline-warning">전체보기</button>
                <button type="button" class="btn btn-outline-warning">아기 자랑</button>
                <button type="button" class="btn btn-outline-info">거래 후기</button>
            </div>
        </div>
        
        <div id="contents">
            <form>
                <div class="form-group">
                    <label for="category">분류</label>
                    <select class="form-control" id="category">
                        <option>아기 자랑</option>
                        <option>거래 후기</option>
                    </select>
                </div>
                <div class="form-group">
                    <label for="title">제목</label>
                    <input type="text" class="form-control" id="title" placeholder="제목을 입력하세요">
                </div>
                <div class="form-group">
                    <label for="summernote">내용</label>
                    <div id="summernote"></div>
                </div>
                <button type="submit" class="btn btn-primary">확인</button>
                <button type="button" class="btn btn-secondary">취소</button>
            </form>
            <script>
                $('#summernote').summernote({
                    placeholder: 'Hello bootstrap 4',
                    tabsize: 2,
                    height: 300,
                    minHeight: 300,
                    maxHeight: 500,
                });
            </script>
        </div>
        
        <div id="right-sidebar" class="border">
            <img alt="아기1" src="../img/333.jpg" class="img-fluid">
        </div>
    </div>
</div>



</body>
</html>
