<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.12/summernote-bs4.css" rel="stylesheet">
<title>글수정</title>
<style>
body {
    font-size: 14px;
    background-color: #f8f9fa;
}

#container {
    max-width: 1200px;
    padding: 20px;
    margin: 0 auto;
    background-color: #fff;
    border-radius: 8px;
    box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
}

#contents {
    max-width: 800px;
    margin: 20px auto;
}

#footer {
    overflow: hidden;
    width: 100%;
    padding: 20px 0;
    background: url(/img/imfs/main/bg_footer.jpg) repeat-x;
    font-family: "Noto Sans KR";
    font-weight: 400;
    font-size: 12px;
    color: black;
    background-color: whitesmoke;
    text-align: center;
}
</style>
</head>
<body>
    <jsp:include page="../layout/Header.jsp" />
    <div id="container">
        <div id="contents">
            <form name="writeFrm" method="post" enctype="multipart/form-data" action="../mvcboard/edit.do" onsubmit="return validateForm(this);">
                <input type="hidden" name="id" value="${dto.id}" />
                <input type="hidden" name="prevOfile" value="${dto.ofile}" />
                <input type="hidden" name="prevSfile" value="${dto.sfile}" />
                <div class="form-group mb-3">
                    <label for="category">분류</label>
                    <select class="form-control" id="category" name="category">
                        <option value="1" ${dto.bno == 1 ? 'selected' : ''}>아기 자랑</option>
                        <option value="2" ${dto.bno == 2 ? 'selected' : ''}>거래 후기</option>
                    </select>
                </div>
                <div class="form-group mb-3">
                    <label for="title">제목</label>
                    <input type="text" class="form-control" id="title" name="title" value="${dto.title}">
                </div>
                <div class="form-group mb-3">
                    <label for="name">작성자 : </label>
                    <label id="name"><%=session.getAttribute("name")%></label>
                </div>
                <div class="form-group mb-3">
                    <label for="content">내용</label>
                    <textarea class="form-control" id="content" name="content" rows="20">${dto.content}</textarea>
                </div>
                <div class="form-group mb-3">
                    <input type="file" name="attachedFile" id="attachedFile" onchange="insertFileIntoEditor()" />
                </div>
                <button type="submit" class="btn btn-primary">수정 완료</button>
                <button type="button" class="btn btn-secondary" onclick="location.href='../mvcboard/list.do';">취소</button>
            </form>
        </div>
    </div>
    <jsp:include page="../layout/Footer.jsp" />
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/2.11.6/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.12/summernote-bs4.js"></script>
    <script>
        $(document).ready(function() {
            $('#content').summernote({
                height: 300
            });
        });

        function validateForm(form) {
            if (form.title.value.trim() == "") {
                alert("제목을 입력하세요.");
                form.title.focus();
                return false;
            }
            if ($('#content').summernote('isEmpty')) {
                alert("내용을 입력하세요.");
                $('#content').summernote('focus');
                return false;
            }
            return true;
        }

        function insertFileIntoEditor() {
            var file = document.getElementById('attachedFile').files[0];
            if (file && file.type.startsWith('image/')) {
                var reader = new FileReader();
                reader.onload = function(e) {
                    $('#content').summernote('insertImage', e.target.result, function ($image) {
                        $image.attr('src', e.target.result);
                    });
                }
                reader.readAsDataURL(file);
            } else {
                alert('이미지 파일이 아닙니다.');
            }
        }
    </script>
</body>
</html>
