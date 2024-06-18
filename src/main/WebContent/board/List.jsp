<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
      rel="stylesheet"
      integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
      crossorigin="anonymous">
<title>리스트</title>
<style>
body {
    font-size: 13px;
}

#container {
    width: 1200px;
    padding: 20px;
    margin: 0 auto;
}

#contents {
    flex-grow: 1;
    padding: 0px;
    margin: 20px;
}

#gallery-item img {
    width: 85%;
    height: 150px;
}

#caption {
    padding: 10px;
    font-size: 14px;
    color: #333;
}

#gallery {
    display: flex;
    flex-wrap: wrap;
    gap: 10px;
}

#gallery-item {
    width: calc(33.333% - 20px);
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
    border-radius: 10px;
    overflow: hidden;
    text-align: center;
}

#left-sidebar {
    width: 150px;
    margin-bottom: 20px;
    margin-right: 20px;
}

#right-sidebar {
    width: 150px;
    margin-bottom: 20px;
}

#right-sidebar img {
    margin: 0 auto;
    padding: 0px;
    width: 75px;
    height: 75px;
}

.flex-container {
    display: flex;
}
</style>
</head>
<body>



<div id="container">
    <div class="flex-container">
        <div id="left-sidebar">
            <div class="btn-group-vertical" role="group" aria-label="Vertical button group">
                <button type="button" class="btn btn-outline-warning">전체보기</button>
                <button type="button" class="btn btn-outline-warning">아기사진</button>
                <button type="button" class="btn btn-outline-info">거래후기</button>
                <button type="button" class="btn btn-outline-info">거래후기</button>
            </div>
        </div>
        
        <div id="contents">
            <div id="gallery">
                <div id="gallery-item">
                    <img src="../img/333.jpg" alt="Item">
                </div>
                <div id="gallery-item">
                    <img src="../img/333.jpg" alt="Item">
                </div>
                <div id="gallery-item">
                    <img src="../img/333.jpg" alt="Item">
                </div>
                <div id="gallery-item">
                    <img src="../img/333.jpg" alt="Item">
                </div>
                <div id="gallery-item">
                    <img src="../img/333.jpg" alt="Item">
                </div>
                <div id="gallery-item">
                    <img src="../img/333.jpg" alt="Item">
                </div>
                <div id="gallery-item">
                    <img src="../img/333.jpg" alt="Item">
                </div>
                <div id="gallery-item">
                    <img src="../img/333.jpg" alt="Item">
                </div>
                <div id="gallery-item">
                    <img src="../img/333.jpg" alt="Item">
                </div>
            </div>
        </div>

        <div id="right-sidebar" class="border">
            <img alt="아기1" src="../img/333.jpg" width="100" height="100">
        </div>
    </div>
</div>



<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-w4C1gPKEqFb/yx8hsIZjkhMCixIqL5ykz6qykIv5Qh4lg7hR1Hz6ol4LZcK0zMLG" crossorigin="anonymous"></script>
</body>
</html>
