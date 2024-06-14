<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%!String str1 = "JSP상품판매";
	String str2 = "안녕하세요!!";%>
<!DOCTYPE html>
<html>
<head>
<!-- 반응형 meta tags -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta charset="utf-8">
<!-- Bootstrap CSS -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
	crossorigin="anonymous">

<!-- Bootstrap CSS -->
<link
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
	rel="stylesheet">
<!-- jQuery -->
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<!-- jQuery UI -->
<link href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css"
	rel="stylesheet">
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.min.js"></script>
<!-- Bootstrap JS -->
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>

    <style>
        .narrow-select {
            width: 1000px; /* 원하는 너비로 설정 */
            hight: 1000px;
        }
    </style>

<title>상품 판매하기</title>
</head>
<body>


	<div class="container mt-5">
		<h2>상품 판매하기</h2>
		<p>카테고리</p>
		<div class="form-group">
			<label for="autocompleteInput">어떤 물건을 판매하고 싶으신가요?:</label> <input
				type="text" id="autocompleteInput" class="form-control"
				placeholder="Start typing...">
		</div>
	</div>

	<script>
		$(document).ready(
				function() {
					const data = [ "유아 안전용품 > 아기 모니터", "유아 안전용품 > 침대 난간 및 가드",
							"유아 안전용품 > 게이트 및 가드", "유아 안전용품 > 기타 아기 및 어린이 안전용품",
							"유아 안전용품 > 놀이펜", "바운서, 로커 및 그네 > 아기 바운서",
							"바운서, 로커 및 그네 > 아기 로커", "바운서, 로커 및 그네 > 아기 그네",
							"바운서, 로커 및 그네 > 아기 보행기", "아기 옷", "카시트 및 아기 캐리어",
							"기저귀 용품 > 기저귀 가방", "기저귀 용품 > 기저귀 가방",
							"기저귀 용품 > 기저귀 매트", "기저귀 용품 > 기타 기저귀 갈이 용품",
							"기저귀 용품 > 유아용 변기", "수유 용품 > 젖병 워머", "수유 용품 > 젖병",
							"수유 용품 > 유축기", "수유 용품 > 기타 수유 용품",
							"유아 옷, 신발 및 액세서리 > 옷 묶음", "유아 옷, 신발 및 액세서리 > 드레스",
							"유아 옷, 신발 및 액세서리 > 청바지 및 바지",
							"유아 옷, 신발 및 액세서리 > 어린이 액세서리",
							"유아 옷, 신발 및 액세서리 > 코트 및 재킷",
							"유아 옷, 신발 및 액세서리 > 잠옷",
							"유아 옷, 신발 및 액세서리 > 기타 어린이 옷",
							"유아 옷, 신발 및 액세서리 > 신발 및 부츠",
							"유아 옷, 신발 및 액세서리 > 수영복",
							"유아 옷, 신발 및 액세서리 > 상의 및 셔츠", "유아 및 어린이 가구 > 욕조",
							"유아 및 어린이 가구 > 기저귀 교환대", "유아 및 어린이 가구 > 유아용 침대",
							"유아 및 어린이 가구 > 아기 침대 및 요람", "유아 및 어린이 가구 > 하이체어",
							"유아 및 어린이 가구 > 램프, 조명 및 갓", "유아 및 어린이 가구 > 기타",
							"야외 장난감 > 기타 야외 장난감", "야외 장난감 > 놀이집 및 놀이 텐트",
							"야외 장난감 > 모래놀이 및 물놀이 장난감", "야외 장난감 > 스쿠터",
							"야외 장난감 > 스케이트보드", "야외 장난감 > 미끄럼틀", "유모차 및 스토롤러",
							"장난감", ];
					$('#autocompleteInput').autocomplete({
						  source: function(request, response) {
				                var results = $.ui.autocomplete.filter(data, request.term);
				                response(results.slice(0, 3)); // 상위 3개 항목만 반환
				            },
						minLength : 1
					});
				});
	</script>


	<h5>카테고리를 직접 둘러보시겠어요?</h5>
	<select class="form-select narrow-select" multiple
		aria-label="Multiple select example">
		<option value="1">유아 안전용품</option>
		<option value="2">바운서, 로커 및 그네</option>
		<option value="3">아기 옷</option>
		<option value="4">카시트 및 아기 캐리어</option>
		<option value="5">기저귀 용품</option>
		<option value="6">수유 용품</option>
		<option value="7">유아 옷, 신발 및 액세서리</option>
		<option value="8">유아 및 어린이 가구</option>
		<option value="9">야외 장난감</option>
		<option value="10">장난감</option>
	</select>









	<!-- Separate Popper and Bootstrap JS -->
	<script
		src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"
		integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p"
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js"
		integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF"
		crossorigin="anonymous"></script>
</body>
</html>