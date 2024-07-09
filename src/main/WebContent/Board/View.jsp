<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js"></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="../iMarket/CSS/style-header.css" rel="stylesheet">
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
	background-color: #f8f9fa;
	font-family: 'Noto Sans KR', sans-serif;
}

#container {
	max-width: 1200px;
	padding: 20px;
	margin: 0 auto;
	background-color: #fff;
	border-radius: 8px;
	box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
}

#main-content {
	display: flex;
	justify-content: space-between;
}

#left-sidebar {
	width: 200px;
	margin-top: 20px;
	font-size: 14px;
}

#contents {
	width: 800px;
	margin: 0 auto;
	position: relative;
}

#right-sidebar {
	width: 150px;
	text-align: center;
	margin-top: 20px;
	margin-left: 20px;
}

#right-sidebar img {
	width: 75px;
	height: 75px;
	margin-bottom: 10px;
	border-radius: 50%;
	object-fit: cover;
}

#gallery {
	display: flex;
	flex-direction: column;
	gap: 10px;
}

#gallery-item {
	width: 100%;
	box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
	border-radius: 10px;
	overflow: hidden;
	text-align: center;
	margin-bottom: 20px;
	cursor: pointer;
	transition: transform 0.3s ease-in-out;
}

#gallery-item:hover {
	transform: scale(1.05);
}

#gallery img {
	width: 100%;
	height: auto;
	display: block;
}

#caption {
	padding: 10px;
	font-size: 14px;
	color: #333;
}

.paging {
	margin-top: 20px;
	text-align: center;
}

.paging a {
	display: inline-block;
	padding: 6px 12px;
	margin: 0px 3px;
	border: 1px solid #ddd;
	background-color: #f5f5f5;
	color: #337ab7;
	text-decoration: none;
	border-radius: 3px;
}

.paging .current {
	background-color: #337ab7;
	color: white;
	border: 1px solid #337ab7;
}

.no_dot {
	list-style-type: none;
	padding-left: 0;
	/* Add this if you want to remove the default padding */
}

.paging a:hover {
	background-color: #ddd;
}

.btn-group-vertical .btn {
	margin-bottom: 10px;
}

#action-buttons {
	margin-top: 10px;
	text-align: center;
}

.comment-container {
	margin-top: 20px;
	padding: 15px;
	background-color: #ffffff;
	border: 0.5px solid #ddd;
	border-radius: 8px;
}

.comment-item {
	padding: 10px 0;
	border-bottom: 1px solid #eee;
}

.comment-item:last-child {
	border-bottom: none;
}

.comment-header {
	font-weight: bold;
	color: #555;
}

.comment-content {
	margin-top: 5px;
	color: #333;
}

.comment-form {
	margin-top: 15px;
	display: flex;
}

.comment-date {
	margin-left: auto;
}

.comment-actions {
	display: flex;
	justify-content: space-between;
}

.comment-form input[type="text"] {
	flex-grow: 1;
	margin-right: 10px;
}

#view {
	margin-left: auto;
}
</style>
</head>
<body>
	<jsp:include page="../layout/Header.jsp" />
	<div id="container">
		<div id="main-content">
			<div id="left-sidebar">
				<div class="btn-group-vertical" role="group"
					aria-label="Vertical button group">
					<button type="button" class="btn btn-outline-warning"
						onclick="location.href='../mvcboard/list.do';"
						style="font-size: 18px;">아기사진</button>
					<button type="button" class="btn btn-outline-warning"
						onclick="location.href='../mvcboard/list.do';"
						style="font-size: 18px;">거래후기</button>
				</div>
			</div>

			<div id="contents">

				<!-- 좋아요 에러 메시지 출력 -->
				<c:if test="${param.error == 'notLoggedIn'}">
					<div class="alert alert-danger" role="alert">로그인 후 이용 가능합니다.
					</div>
				</c:if>
				<c:if test="${param.error == 'alreadyLiked'}">
					<div class="alert alert-warning" role="alert">이미 좋아요를 눌렀습니다.
					</div>
				</c:if>

				<div id="gallery">
					<ul class="no_dot">
						<li><h3>제목 : ${dto.title }</h3></li>
						<li><p>작성자 : ${writerName }</p></li>
						<li><p>조회수 ${dto.views } | 추천수 ${dto.likes } | 작성시간
								${dto.createDate }</p></li>
						<li><p>
								<img src="../uploads/${dto.sfile}" style="max-width: 100%;" /><br />
								${dto.content}
							</p></li>
						<li>
							<form action="../mvcboard/like.do" method="post"
								style="display: flex; justify-content: center;">
								<input type="hidden" name="id" value="${dto.id}">
								<button type="submit" class="btn btn-outline-success"
									<c:if test="${dao.isLikedByUser(dto.id, sessionScope.id)}">disabled</c:if>>
									<img src="../Image/ddabong.png" alt="추천"
										style="width: 50px; height: 50px;">
								</button>
							</form>

						</li>
					</ul>
				</div>

				<div id="action-buttons">
					<c:if test="${sessionScope.id == dto.writerId}">
						<input type="hidden" name="id" value="${dto.id}">
						<button class="btn btn-primary" type="button"
							onclick="location.href='../mvcboard/edit.do?mode=edit&id=${param.id }';">수정하기</button>
					</c:if>

					<c:if test="${sessionScope.id == dto.writerId}">
						<form action="../mvcboard/deletePost.do" method="post"
							id="deleteForm" style="display: inline;">
							<input type="hidden" name="id" value="${dto.id}"> <input
								class="btn btn-secondary" type="submit" value="삭제"
								onclick="confirmDelete();">
						</form>
					</c:if>
				</div>

				<!-- 댓글 표시 -->
				<div class="comment-container mt-4">
					<h5>전체 댓글 ${commentList.size()}개</h5>
					<c:forEach items="${commentList}" var="comment">
						<div class="comment-item">
							<div>
								<span>${comment.cm_writerName}</span><br> <span
									class="comment-content">${comment.cm_content}</span>
							</div>
							<div class="comment-actions">
								<span class="comment-date">${comment.cm_createDate}</span>
								<form action="../mvcboard/deleteComment.do" method="post"
									style="display: inline;">
									<input type="hidden" name="commentId" value="${comment.cm_id}">
									<input type="hidden" name="boardId" value="${dto.id}">
									<c:if test="${sessionScope.id == comment.cm_writerId }">
										&nbsp;<button type="submit"
											class="btn btn-outline-danger btn-sm">삭제</button>
									</c:if>
								</form>
							</div>
						</div>
					</c:forEach>
				</div>

				<div class="mt-3">
					<form action="../mvcboard/addComment.do" method="post">
						<div class="input-group mb-3">
							<input type="text" name="content" class="form-control"
								placeholder="댓글 입력" aria-label="댓글 입력"
								aria-describedby="button-addon2"> <input type="hidden"
								name="id" value="${dto.id}">
							<button class="btn btn-outline-secondary" type="submit"
								id="button-addon2">등록</button>
						</div>
					</form>
				</div>
			</div>

			<div id="right-sidebar">
				<p>인기글</p>
				<c:forEach items="${likePosts}" var="post">
					<a href="../mvcboard/view.do?id=${post.id}"> <c:if
							test="${not empty post.sfile}">
							<img alt="${post.title}"
								src="../mvcboard/download.do?ofile=${post.ofile}&sfile=${post.sfile}&id=${post.id}" />
						</c:if>
						<p></p>
					</a>
				</c:forEach>
			</div>
		</div>
	</div>
	<jsp:include page="../layout/Footer.jsp" />

	<script>
		function confirmDelete() {
			if (confirm("정말 삭제하시겠습니까?")) {
				document.getElementById('deleteForm').submit();
			}
		}
	</script>

	<script
		src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.7/dist/umd/popper.min.js"
		integrity="sha384-oBqDVmMz4fnFO9gybBogGzAxU6j5Y3a50p1z0l5y1H5k5jUp7Bhp8vT8Dr+8bkH+"
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.min.js"
		integrity="sha384-q2mBWTwC8PQ8xu3KjZWR6zrXb+buJ1fgNHhA8sDDYmy1J6C6tv8HgASpRl8d6Pc0"
		crossorigin="anonymous"></script>
</body>
</html>