<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link
    href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
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
	width: 200px;
	margin-bottom: 20px;
	margin-right: 20px;
	font-family: "Noto Sans KR";
	font-size: 12px;
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
    
    <div id="container">
        <div class="flex-container">
            <div id="left-sidebar">
                <div class="btn-group-vertical" role="group"
                    aria-label="Vertical button group" style="font-size: 8px;">
                    <button type="button" class="btn btn-outline-warning">전체보기</button>
                    <button type="button" class="btn btn-outline-warning">아기사진</button>
                    <button type="button" class="btn btn-outline-warning">거래후기</button>
                </div>
            </div>

            <div id="contents">
                <div id="gallery">
                    <c:forEach var="board" items="${boardLists}">
                        <div id="gallery-item">
                            <a href="#"><img src="${board.imgUrl_1}" alt="Item"></a>
                            <div id="caption">${board.title}</div>
                        </div>
                    </c:forEach>
                    <c:if test="${empty boardLists}">
                        <p>등록된 게시물이 없습니다</p>
                    </c:if>
                </div>
            </div>

            <!-- 검색창 추가 -->
            <div class="input-group mt-4 mb-4"
                style="max-width: 300px; margin: 0 auto;">
                <input type="text" class="form-control" placeholder="검색어를 입력하세요"
                    aria-label="검색" aria-describedby="button-search">
                <button class="btn btn-outline-secondary" type="button"
                    id="button-search">검색</button>

                <button type="button"
                        class="btn btn-outline-warning" onclick="location.href='../boards/Write.jsp';">글쓰기</button>
            </div>
            <div id="right-sidebar" class="border">
                <p>인기 게시글</p>
                <a href="#"><img alt="아기1" src="../img/333.jpg" width="100"
                    height="100"></a>
            </div>
        </div>
</div>
        
</body>
</html>
