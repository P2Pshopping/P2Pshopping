<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<!-- 현재 오류가  java.io.IOException: java.io.FileNotFoundException: 어디서 경로를 지정한 건지 찾을 수가 없음 -->

<!DOCTYPE html>
<html lang="ko">
<head>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js"></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="../iMarket/CSS/style-header.css" rel="stylesheet">
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.11.0/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/js/bootstrap.min.js"></script>
<!-- CKEditor CDN 추가 -->
<script src="https://cdn.ckeditor.com/4.16.0/standard/ckeditor.js"></script>
<title>글작성</title>
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
	width: 800px;
	margin: 20px auto;
}
</style>
</head>
<body>
	<jsp:include page="../layout/Header.jsp" />
	<!-- Main Container -->
	<div id="container">


		<div id="contents">
			<form name="writeFrm" method="post" enctype="multipart/form-data"
				action="../mvcboard/write.do" onsubmit="return validateForm(this);">

				<div class="form-group">
					<label for="title">제목</label> <input type="text"
						class="form-control" id="title" name="title"
						placeholder="제목을 입력하세요">
				</div>
				<div class="form-group">
					<label for="name">작성자 : </label> <label><%=session.getAttribute("name")%></label>
					<input type="hidden" name="username"
						value="<%=session.getAttribute("username")%>">
				</div>
				<div class="form-group">
					<label for="content">내용</label>
					<textarea class="form-control" id="content" name="content"
						rows="20" placeholder="내용을 입력하세요"></textarea>
				</div>
				<div class="form-group">

					<input type="file" name="ofile" id="ofile"
						onchange="insertFileIntoEditor()" />
				</div>


				<!--                     <input type="file" name="ofile" id="attachedFile" onchange="insertFileIntoEditor()" />
                </div> -->

				<button type="submit" class="btn btn-primary">확인</button>
				<button type="button" class="btn btn-secondary"
					onclick="location.href='../mvcboard/list.do';">취소</button>
			</form>
		</div>

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
			} else {
				alert('이미지 파일이 아닙니다.');
			}
		}
	</script>

</body>
</html>
