<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
<title>i-Market</title>
<style>
html, body {
    height: 100%;
    margin: 0;
    padding: 0;
}

#container {
    min-height: 100%;
    display: flex;
    flex-direction: column;
}

#main-content {
    flex: 1;
    display: flex;
    justify-content: center;
}

#contents {
    width: 800px;
    padding: 20px;
    margin: 20px;
    background-color: #fff;
    border-radius: 10px;
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
}

#left-sidebar {
    width: 180px;
    margin-bottom: 20px;
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
    display: block;
}

.no_dot {
    list-style-type: none;
    padding: 0;
}

#gallery {
    display: flex;
    flex-wrap: wrap;
    gap: 10px;
}

.flex-container {
    display: flex;
    justify-content: center;
    width: 100%;
}

#footer {
    overflow: hidden;
    width: 1200px;
    margin: 0 auto;
    padding-bottom: 25px ;
    background: url(/img/imfs/main/bg_footer.jpg) repeat-x;
    font-family: "Noto Sans KR";
    font-weight: 400;
    font-size: 12px;
    color: black;
    background-color: whitesmoke;
    z-index: 2;
}
</style>
</head>
<body>


<div id="container">
    <div id="main-content" class="flex-container">
        <div id="left-sidebar">
            <div class="btn-group-vertical" role="group" aria-label="수직 버튼 그룹">
                <button type="button" class="btn btn-outline-warning">전체보기</button>
                <button type="button" class="btn btn-outline-warning">아기사진</button>
                <button type="button" class="btn btn-outline-warning">거래후기</button>
            </div>
        </div>

        <div id="contents">
            <div id="gallery">
                <ul class="no_dot">
                    <li><h3>제목 : <h3>${dto.title }<h3></h3></h3>
                
                    </li>
                    <hr style="border: solid 1px black">
                    <li><p>닉네임 : OOO</p>
                    <hr style="border: solid 1px black">
                    <p>조회수 50 | 추천수 30 | 댓글 3</p></li>
                    <li><img src="../image/2.jpg" alt="Item"></li>
                    <hr style="border: solid 1px black">
                    <li>
                        <input class="btn btn-primary" type="button" value="수정">
                        <input class="btn btn-danger" type="button" value="삭제"> <br />
                        <input class="btn btn-success" type="button" value="추천">
                    </li>
                    <li class="mt-2">
                        <input type="text" placeholder="댓글" class="form-control d-inline-block w-75">
                        <button class="btn btn-secondary d-inline-block w-24">등록</button>
                    </li>
                </ul>
            </div>
        </div>

        <div id="right-sidebar" class="border">
            <p style="margin = 0 auto;">인기 게시글</p>
            <a href="#"><img alt="아기1" src="../img/333.jpg" width="100" height="100"></a>
        </div>
    </div>

    
</div>

</body>
</html>
