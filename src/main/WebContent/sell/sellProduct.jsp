<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>상품 판매하기</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
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
            text-align: ce nter;
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
<%@include file="../layout/Header.jsp"%>
<div class="container">
    <h2>상품 판매하기</h2>
    <div class="category-section">
        <label for="category">카테고리</label> <span style="color: green;">✔</span>
        <p>상품판매 > 유모차 및 스토롤러 <a href="#">수정</a></p>
    </div>

    <div class="photo-upload">
        <img src="camera-icon.png" alt="Camera Icon">
        <p>20장 이하의 사진을 추가해주세요</p>
    </div>
    <div class="info-text">
        <p>💡 상품을 자세히 보여줄 수 있는 사진은 조회수와 댓글 증가에 도움이 됩니다</p>
    </div>

    <form action="productDetail.jsp" method="post">
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

        <div class="seller-info">
            <h3>판매자 정보 *</h3>
            <p>성함: 서준맘</p>
            <p>위치: 대전광역시 서구 갈마2동 <a href="#">수정</a></p>
            <p>이메일: seojooni@naver.com</p>
            <p>휴대폰:</p>
        </div>

        <div class="note">
            <p>모든 이메일 답변은 iMarket 메시지 센터를 통해 전송됩니다. 잠재적인 사기, 스팸 또는 의심스러운 행동을 방지하고 식별하기 위해 당사는 귀하의 이메일 주소를 익명화하고 대화를 모니터링할 권리를 보유합니다.</p>
            <p>상품판매 게시를 선택하면 당사의 <a href="#">이용약관</a> 및 <a href="#">게시 규칙</a>을 읽고 이에 동의하는 것으로 간주됩니다. 귀하의 데이터 처리에 관한 정보는 <a href="#">개인정보 보호정책</a>을 참조하세요.</p>
        </div>

        <div class="form-footer">
            <button type="submit">상품판매 게시물 등록</button>
        </div>
    </form>
</div>

</body>
<%@ include file="../layout/Footer.jsp"%>
</html>