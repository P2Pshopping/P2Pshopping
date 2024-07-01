<<<<<<< HEAD
<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
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
    background-color: #f5f5f5; /* 배경색 추가 */
    padding: 20px; /* 전체 패딩 추가 */
}

#contents {
    width: 800px;
    background-color: #fff;
    border-radius: 10px;
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
    padding: 20px;
    margin: 20px;
}

#left-sidebar {
	width: 200px;
	margin-bottom: 20px;
	margin-right: 20px;
	font-family: "Noto Sans KR";
	font-size: 12px;
	margin-top: 200px; /* 예시로 상단에서 50px 위치로 이동 */
	margin-left: 20px;
}

#right-sidebar {
    width: 150px;
}

#right-sidebar img {
    display: block;
    margin: 0 auto;
    width: 100px; /* 이미지 너비 수정 */
    height: 100px;
    border-radius: 50%; /* 원형 이미지로 변경 */
    object-fit: cover; /* 이미지가 잘리지 않고 채워지도록 */
}

.btn-group-vertical {
    width: 100%; /* 버튼 그룹 너비 100%로 설정 */
}

.btn-group-vertical button {
    width: 100%; /* 버튼 너비 100%로 설정 */
    margin-bottom: 10px; /* 버튼 간격 추가 */
}

.no_dot {
    list-style-type: none;
    padding: 0;
}

.no_dot li {
    margin-bottom: 10px; /* 리스트 아이템 간격 추가 */
}

.form-control {
    width: calc(100% - 85px); /* 댓글 입력 필드 너비 수정 */
    display: inline-block;
    margin-right: 10px; /* 댓글 입력 필드 오른쪽 여백 추가 */
}

.btn-block {
    width: 100%; /* 버튼 너비 100%로 설정 */
}

#footer {
    overflow: hidden;
    width: 1200px;
    margin: 0 auto;
    padding-bottom: 25px;
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
<jsp:include page="../layout/Header.jsp" />

<div id="container">
    <div id="main-content">
        <div id="left-sidebar">
            <div class="btn-group-vertical" role="group" aria-label="수직 버튼 그룹">
                <button type="button" class="btn btn-outline-warning" onclick="location.href='../board/list.do';">아기사진</button>
                <button type="button" class="btn btn-outline-warning" onclick="location.href='../board/list.do';">거래후기</button>
            </div>
        </div>

        <div id="contents">
            <div id="gallery">
                <ul class="no_dot">
                    <li><h3>제목 : ${dto.title }</h3></li>
                    <li><p>닉네임 : ${dto.name }</p></li>
                    <li><p>조회수 ${dto.visitcount } | 추천수 ${dto.likes }</p></li>
                    <li><img src="../Uploads/${dto.sfile}" style="max-width: 100%;" /> ${dto.content}</li>
                    <li>
                        <input class="btn btn-primary btn-block" type="button" value="수정" onclick="location.href='../mvcboard/edit.do';"> 
                        <input class="btn btn-danger btn-block" type="button" value="삭제"> 
                        <br />
                        <form action="../mvcboard/like.do" method="post" style="display:inline;">
                            <input type="hidden" name="idx" value="${dto.idx}">
                            <button type="submit">
                                <img src="../img/ddabong.png" alt="추천" style="width: 50px; height: 50px;">
                            </button>
                        </form>
                    </li>
                    <li class="mt-2">
                        <input type="text" placeholder="댓글" class="form-control">
                        <button class="btn btn-secondary">등록</button>
                    </li>
                </ul>
            </div>
        </div>

        <div id="right-sidebar" class="border">
            <p style="text-align: center;">인기 사진</p>
            <a href="#"><img alt="아기1" src="../img/3.jpg"></a>
        </div>
    </div>
</div>
<jsp:include page="../layout/Footer.jsp" />

</body>
</html>
=======
<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
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
    background-color: #f5f5f5; /* 배경색 추가 */
    padding: 20px; /* 전체 패딩 추가 */
}

#contents {
    width: 800px;
    background-color: #fff;
    border-radius: 10px;
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
    padding: 20px;
    margin: 20px;
}

#left-sidebar {
	width: 200px;
	margin-bottom: 20px;
	margin-right: 20px;
	font-family: "Noto Sans KR";
	font-size: 12px;
	margin-top: 200px; /* 예시로 상단에서 50px 위치로 이동 */
	margin-left: 20px;
}

#right-sidebar {
    width: 150px;
}

#right-sidebar img {
    display: block;
    margin: 0 auto;
    width: 100px; /* 이미지 너비 수정 */
    height: 100px;
    border-radius: 50%; /* 원형 이미지로 변경 */
    object-fit: cover; /* 이미지가 잘리지 않고 채워지도록 */
}

.btn-group-vertical {
    width: 100%; /* 버튼 그룹 너비 100%로 설정 */
}

.btn-group-vertical button {
    width: 100%; /* 버튼 너비 100%로 설정 */
    margin-bottom: 10px; /* 버튼 간격 추가 */
}

.no_dot {
    list-style-type: none;
    padding: 0;
}

.no_dot li {
    margin-bottom: 10px; /* 리스트 아이템 간격 추가 */
}

.form-control {
    width: calc(100% - 85px); /* 댓글 입력 필드 너비 수정 */
    display: inline-block;
    margin-right: 10px; /* 댓글 입력 필드 오른쪽 여백 추가 */
}

.btn-block {
    width: 100%; /* 버튼 너비 100%로 설정 */
}

#footer {
    overflow: hidden;
    width: 1200px;
    margin: 0 auto;
    padding-bottom: 25px;
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
<jsp:include page="../layout/Header.jsp" />

<div id="container">
    <div id="main-content">
        <div id="left-sidebar">
            <div class="btn-group-vertical" role="group" aria-label="수직 버튼 그룹">
                <button type="button" class="btn btn-outline-warning" onclick="location.href='../board/list.do';">아기사진</button>
                <button type="button" class="btn btn-outline-warning" onclick="location.href='../board/list.do';">거래후기</button>
            </div>
        </div>

        <div id="contents">
            <div id="gallery">
                <ul class="no_dot">
                    <li><h3>제목 : ${dto.title }</h3></li>
                    <li><p>닉네임 : ${dto.name }</p></li>
                    <li><p>조회수 ${dto.visitcount } | 추천수 ${dto.likes }</p></li>
                    <li><img src="../Uploads/${dto.sfile}" style="max-width: 100%;" /> ${dto.content}</li>
                    <li>
                        <input class="btn btn-primary btn-block" type="button" value="수정" onclick="location.href='../mvcboard/edit.do';"> 
                        <input class="btn btn-danger btn-block" type="button" value="삭제"> 
                        <br />
                        <form action="../mvcboard/like.do" method="post" style="display:inline;">
                            <input type="hidden" name="idx" value="${dto.idx}">
                            <button type="submit">
                                <img src="../img/ddabong.png" alt="추천" style="width: 50px; height: 50px;">
                            </button>
                        </form>
                    </li>
                    <li class="mt-2">
                        <input type="text" placeholder="댓글" class="form-control">
                        <button class="btn btn-secondary">등록</button>
                    </li>
                </ul>
            </div>
        </div>

        <div id="right-sidebar" class="border">
            <p style="text-align: center;">인기 사진</p>
            <a href="#"><img alt="아기1" src="../img/3.jpg"></a>
        </div>
    </div>
</div>
<jsp:include page="../layout/Footer.jsp" />

</body>
</html>
>>>>>>> refs/heads/master
