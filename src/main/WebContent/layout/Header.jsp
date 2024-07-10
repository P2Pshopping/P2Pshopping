<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%-- <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> --%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.min.js"></script>
<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=0637e168501ef6ed107e35286b4b79b1&libraries=services"></script>
<script>
	$(document)
			.ready(
					function() {
						var data = [ "유아 안전용품 > 아기 모니터",
								"유아 안전용품 > 침대 난간 및 가드", "유아 안전용품 > 게이트 및 가드",
								"유아 안전용품 > 기타 아기 및 어린이 안전용품", "유아 안전용품 > 놀이펜",
								"바운서, 로커 및 그네 > 아기 바운서",
								"바운서, 로커 및 그네 > 아기 로커", "바운서, 로커 및 그네 > 아기 그네",
								"바운서, 로커 및 그네 > 아기 보행기", "아기 옷",
								"카시트 및 아기 캐리어", "기저귀 용품 > 기저귀 가방",
								"기저귀 용품 > 기저귀 가방", "기저귀 용품 > 기저귀 매트",
								"기저귀 용품 > 기타 기저귀 갈이 용품", "기저귀 용품 > 유아용 변기",
								"수유 용품 > 젖병 워머", "수유 용품 > 젖병", "수유 용품 > 유축기",
								"수유 용품 > 기타 수유 용품", "유아 옷, 신발 및 액세서리 > 옷 묶음",
								"유아 옷, 신발 및 액세서리 > 드레스",
								"유아 옷, 신발 및 액세서리 > 청바지 및 바지",
								"유아 옷, 신발 및 액세서리 > 어린이 액세서리",
								"유아 옷, 신발 및 액세서리 > 코트 및 재킷",
								"유아 옷, 신발 및 액세서리 > 잠옷",
								"유아 옷, 신발 및 액세서리 > 기타 어린이 옷",
								"유아 옷, 신발 및 액세서리 > 신발 및 부츠",
								"유아 옷, 신발 및 액세서리 > 수영복",
								"유아 옷, 신발 및 액세서리 > 상의 및 셔츠",
								"유아 및 어린이 가구 > 욕조", "유아 및 어린이 가구 > 기저귀 교환대",
								"유아 및 어린이 가구 > 유아용 침대",
								"유아 및 어린이 가구 > 아기 침대 및 요람",
								"유아 및 어린이 가구 > 하이체어",
								"유아 및 어린이 가구 > 램프, 조명 및 갓", "유아 및 어린이 가구 > 기타",
								"야외 장난감 > 기타 야외 장난감", "야외 장난감 > 놀이집 및 놀이 텐트",
								"야외 장난감 > 모래놀이 및 물놀이 장난감", "야외 장난감 > 스쿠터",
								"야외 장난감 > 스케이트보드", "야외 장난감 > 미끄럼틀",
								"유모차 및 스토롤러", "장난감" ];

						// 검색어 자동완성
						$('#autocompleteInput').autocomplete(
								{
									source : function(request, response) {
										var results = $.ui.autocomplete.filter(
												data, request.term);
										response(results.slice(0, 3));
									},
									minLength : 1
								});
					});
</script>
<style>
.ui-autocomplete {
	color: #0000FF; /* 텍스트 색상 변경 */
}
</style>

</head>

<body>

	<div class="header-second"
		style="display: flex; justify-content: center;">
		<nav
			class="navbar navbar-expand-max-height navbar-light bg-$orange-300"
			style="display: flex; width: 1200px;">
			<div class="container-fluid">
				<div class="row" style="display: flex; width: 1100px;">
					<div class="col-sm-4">
						<a class="navbar-brand" href="${pageContext.request.contextPath}/Main/default.jsp"
							style="font-weight: 700; font-size: 50px;"><span
							style="color: rgb(219, 20, 60, 0.5); font-weight: 700; font-size: 50px;">i-</span>Market
						</a>
					</div>
					<div class="col-md-2"></div>
					<div class="col-md-6"
						style="display: flex; justify-content: right; align-items: center; font-color: black;">

						<c:if test="${sessionScope.password != null}">


							<%-- <a href="${pageContext.request.contextPath}/cart?cmd=cartList" class="bi bi-cart-fill" style="margin: 2%; color:black; --bs-btn-font-size: .75rem;">장바구니</a> --%>

							<c:choose>
								<c:when test="${sessionScope.username == 'a'}">
									<%-- username이 'a'일시 관리자 페이지 링크 보이기 --%>
									<a href="${pageContext.request.contextPath}/dashboard"
										class="bi bi-person-badge"
										style="margin: 2%; color: black; --bs-btn-font-size: .75rem;">관리자</a>
								</c:when>
								<c:otherwise>
									<%-- 찜 링크 보이기 --%>
									<a
										href="${pageContext.request.contextPath}/Favor/favorList.jsp"
										class="bi bi-suit-heart-fill"
										style="margin: 2%; color: red; --bs-btn-font-size: .75rem;">찜
									</a>
								</c:otherwise>
							</c:choose>
							<a href="${pageContext.request.contextPath}/Change/Change.jsp"
								class="bi bi-gear-fill"
								style="margin: 2%; color: black; --bs-btn-font-size: .75rem;">정보수정
							</a>
							<a href="${pageContext.request.contextPath}/logout.do"
								class="bi bi-box-arrow-left"
								style="margin: 2%; color: black; --bs-btn-font-size: .75rem;">로그아웃
							</a>

							<a href="${pageContext.request.contextPath}/sell/sell.jsp"
								class="bi bi-upload btn btn-outline-secondary" type="submit"
								style="margin-left: 40px; margin-right: -20px; --bs-btn-font-size: 1.05rem;">
								상품등록 </a>
						</c:if>
						<c:if test="${sessionScope.password == null}">
							<a href="${pageContext.request.contextPath}/Login/login.jsp"
								class="bi bi-box-arrow-in-right btn btn-success btn-sm"
								style="margin: 2%; color: fff; --bs-btn-font-size: .75rem;">
								Login </a>
							<a href="${pageContext.request.contextPath}/Join/join.jsp"
								class="bi bi-person-plus-fill btn btn-primary btn-sm"
								style="margin: 2%; color: fff; --bs-btn-font-size: .75rem;">
								create account </a>
						</c:if>
					</div>
				</div>

				<button class="navbar-toggler" type="button"
					data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
					aria-controls="navbarSupportedContent" aria-expanded="false"
					aria-label="Toggle navigation">
					<span class="navbar-toggler-icon"></span>
				</button>
				<div class="collapse navbar-collapse" id="navbarSupportedContent">
				<form name= list method= "get" >
					<ul class="navbar-nav me-auto mb-2 mb-lg-0">
						<li class="nav-item"><a class="nav-link active"
							aria-current="page" href="${pageContext.request.contextPath}/Main/default.jsp">홈</a></li>
						<li class="nav-item"><a class="nav-link active"
							aria-cureent="page"
							href="${pageContext.request.contextPath}/hospital/Hospital1.jsp">병원찾기</a>
						</li>
						<li class="nav-item dropdown"><a
							class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
							role="button" data-bs-toggle="dropdown" aria-expanded="false">
								중고장터 </a>
							<ul class="dropdown-menu" aria-labelledby="navbarDropdown">
							
							
								
								<li><a class="dropdown-item" href="${pageContext.request.contextPath}/itemList/ItemList.do">상품목록</a></li>
								<li><a class="dropdown-item" href="${pageContext.request.contextPath}/mvcboard/list.do">커뮤니티</a></li>
							</ul></li>
							
					</ul>
					</form>
					<form class="d-flex" action="${pageContext.request.contextPath}/itemList/ItemList.do" method="get">
						<input class="form-control me-2" id="keyword" name="keyword"
							type="text" placeholder="상품명 또는 브랜드명으로 검색해주세요."
							aria-label="Search">
						<button class="btn btn-outline-success" type="submit">Search</button>
					</form>
				</div>

			</div>


	</div>
</body>
</html>