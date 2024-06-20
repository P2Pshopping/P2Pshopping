<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
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
<title>i-Market</title>
<style>
body {
	font-size: 13px;
	height: 100vh;
	margin: 0;
	display: flex;
	
}

#container {
	width: 1200px;
	padding: 20px;
	margin: 0 auto;
	
}

#contents {
	width: 800px;
	padding: 20px;
	margin: 20px;
	background-color: #fff;
	border-radius: 10px;
	box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
}

#left-sidebar, #right-sidebar {
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
</style>
</head>

<body>

	<div id="container" class="flex-container">
		<div id="left-sidebar">
			<div class="btn-group-vertical" role="group"
				aria-label="Vertical button group">
				<button type="button" class="btn btn-outline-warning">전체보기</button>
				<button type="button" class="btn btn-outline-warning">아기사진</button>
				<button type="button" class="btn btn-outline-info">거래후기</button>
				<button type="button" class="btn btn-outline-info">거래후기</button>
			</div>
		</div>

		<div id="contents">
			<div id="gallery">
				<ul class="no_dot">
					<li><h3>제목 :</h3></li>
					<hr style="border: solid 1px black">
					<li><p>닉네임 :</p>
					<hr style="border: solid 1px black">
					<p>조회수 50 | 추천수 30 | 댓글 3</p></li>
					<li><input type="text" placeholder="내용" class="form-control mb-2"></li>
					<li>
						<input class="btn btn-primary" type="button" value="수정">
						<input class="btn btn-danger" type="button" value="삭제">
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
			<img src="../img/333.jpg"><br />
			<img src="../img/333.jpg"><br />
			<img src="../img/333.jpg">
		</div>
	</div>

	

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-w4C1gPKEqFb/yx8hsIZjkhMCixIqL5ykz6qykIv5Qh4lg7hR1Hz6ol4LZcK0zMLG" crossorigin="anonymous"></script>
</body>
</html>
