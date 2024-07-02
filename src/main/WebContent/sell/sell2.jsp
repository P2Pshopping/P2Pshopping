<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>상품 판매하기</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f7f7f7;
        }
        .container {
            background-color: #fff;
            padding: 20px;
            margin-top: 20px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
        .category-section {
            margin-bottom: 20px;
        }
        .category-section label {
            font-weight: bold;
        }
        .category-section select, .category-section input, .category-section textarea {
            width: 100%;
            padding: 10px;
            margin-top: 5px;
            border-radius: 4px;
            border: 1px solid #ccc;
        }
        .photo-upload {
            border: 2px dashed #ccc;
            border-radius: 8px;
            text-align: center;
            padding: 20px;
            margin-bottom: 10px;
        }
        .photo-upload img {
            width: 50px;
            margin-bottom: 10px;
        }
        .info-text {
            background-color: #f9f9f9;
            border-left: 4px solid #2196F3;
            padding: 10px;
            margin-bottom: 20px;
            font-size: 14px;
        }
        .form-group label {
            font-weight: bold;
        }
        .seller-info {
            margin-top: 20px;
        }
        .note {
            background-color: #e7f3fe;
            border-left: 6px solid #2196F3;
            padding: 15px;
            margin-top: 20px;
        }
        .note p {
            margin: 0;
            font-size: 14px;
        }
        .form-footer {
            margin-top: 20px;
            text-align: center;
        }
        .form-footer button {
            padding: 10px 20px;
            border: none;
            background-color: #28a745;
            color: #fff;
            border-radius: 4px;
            cursor: pointer;
        }
        .form-footer button:hover {
            background-color: #218838;
        }
    </style>
</head>
<body>
    <jsp:include page="../layout/Header.jsp" />
    <!-- 화면어둡게 -->
    <div id="overlay" class="hidden"></div>
    <%
        String selectedCategory = request.getParameter("selectedCategory");
        String selectedSubcategory = request.getParameter("selectedSubcategory");

        session.setAttribute("selectedCategory", selectedCategory);
        session.setAttribute("selectedSubcategory", selectedSubcategory);
    %>

    <%
        // 방문 기록 서블릿 호출
        response.sendRedirect("/track?pageUrl=/iMarket/sell/sellProduct.jsp");
    %>

    <div class="container">
        <h2>상품 판매하기</h2>
        <form action="/iMarket/sell/sellController" method="post" enctype="multipart/form-data">
            <div class="category-section">
                <label for="categorySelect">카테고리</label> <span style="color: green;">✔</span>
                <p>상품판매 > <%= session.getAttribute("selectedCategory") %> > <%= session.getAttribute("selectedSubcategory") %><a href="#">수정</a></p>
            </div>
            <div class="photo-upload">
                <input type="file" id="productImages" name="productImages" class="form-control" multiple required>
                <p>4장 이하의 사진을 추가해주세요</p>
            </div>
            <div class="info-text">
                <p>💡 상품을 자세히 보여줄 수 있는 사진은 조회수와 댓글 증가에 도움이 됩니다</p>
            </div>
            <div class="form-group">
                <label for="productName">상품명 *</label>
                <input type="text" id="productName" name="productName" class="form-control" required>
            </div>
            <div class="form-group">
                <label for="productDescription">상품설명 *</label>
                <textarea id="productDescription" name="productDescription" class="form-control" rows="5" required></textarea>
            </div>
            <div class="form-group">
                <label for="price">가격 *</label>
                <input type="text" id="price" name="price" class="form-control" required>
            </div>
            <input type="hidden" name="selectedCategory" value="<%= session.getAttribute("selectedCategory") %>">
            <input type="hidden" name="selectedSubcategory" value="<%= session.getAttribute("selectedSubcategory") %>">
            <input type="hidden" id="roadAddrPart1" name="roadAddrPart1">
            <div class="seller-info">
                <h3>판매자 정보 *</h3>
                <p>성함: <%= session.getAttribute("name") %></p>
                <p>위치: <input type="text" id="roadAddrPart1Display" style="width:40%"> <button type="submit" id="nextPage" class="btn btn-primary">수정</button></p>
                <p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" id="addrDetail" style="width:40%" value=""></p>
                <p>이메일: <%= session.getAttribute("email") %></p>
                <p>휴대폰: <%= session.getAttribute("phone") %></p>
            </div>
            <div class="note">
                <p>모든 이메일 답변은 iMarket 메시지 센터를 통해 전송됩니다. 잠재적인 사기, 스팸 또는 의심스러운 행동을 방지하고 식별하기 위해 당사는 귀하의 이메일 주소를 익명화하고 대화를 모니터링할 권리를 보유합니다.</p>
                <p>상품판매 게시를 선택하면 당사의 <a href="#">이용약관</a> 및 <a href="#">게시 규칙</a>을 읽고 이에 동의하는 것으로 간주됩니다. 귀하의 데이터 처리에 관한 정보는 <a href="#">개인정보 보호정책</a>을 참조하세요.</p>
            </div>
            <div class="form-footer">
                <button type="submit" class="btn btn-success">상품판매 게시물 등록</button>
            </div>
        </form>
    </div>
    <script>
        document.addEventListener('DOMContentLoaded', function() {
            var roadAddrPart1 = sessionStorage.getItem('roadAddrPart1');
            var addrDetail = sessionStorage.getItem('addrDetail');
            var roadAddrPart2 = sessionStorage.getItem('roadAddrPart2');
            var zipNo = sessionStorage.getItem('zipNo');

            if (roadAddrPart1) {
                document.getElementById('roadAddrPart1').value = roadAddrPart1;
                document.getElementById('roadAddrPart1Display').value = roadAddrPart1;
            }
            if (addrDetail) {
                document.getElementById('addrDetail').value = addrDetail;
                document.getElementById('addrDetailDisplay').value = addrDetail;
            }
            if (roadAddrPart2) document.getElementById('roadAddrPart2').value = roadAddrPart2;
            if (zipNo) document.getElementById('zipNo').value = zipNo;

            $('form').on('submit', function(event) {
                var productName = $('#productName').val();
                var productDescription = $('#productDescription').val();
                var price = $('#price').val();
                var files = $('#productImages')[0].files;

                if (!productName || !productDescription || !price) {
                    alert('상품명, 상품설명, 가격을 모두 입력해주세요.');
                    event.preventDefault();
                } else if (files.length > 4) {
                    alert('최대 4개의 이미지만 업로드할 수 있습니다.');
                    event.preventDefault();
                }
            });
        });
    </script>
    <jsp:include page="../layout/Footer.jsp" />
</body>
</html>
