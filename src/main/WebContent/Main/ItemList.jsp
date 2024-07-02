<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>

<style>
.container {
	background-color: #fff;
	padding: 20px;
	margin-top: 20px;
	border-radius: 8px;
	box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
}
</style>
<meta charset="UTF-8">
<script
	src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js"></script>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">

<meta name="viewport" content="width=device-width, initial-scale=1">
<title>상품메뉴</title>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
</head>
<body>

	<%@include file="../layout/Header.jsp"%>

	<div class="row" style="margin-top: 10%; margin-bottom: -3%;">
		<figure style="display: flex; justify-content: center">
			<blockquote class="blockquote"
				style="width: 1200px; display: flex; justify-content: flex-start">
				<p
					style="margin-right: 5%; display: flex; justify-content: flex-start; font-size: 30px; font-weight: 700;">중고장터</p>
				<ul class="nav nav-tabs" id="myTab" role="tablist">
					<li class="nav-item" role="presentation">
						<button class="nav-link active" id="home-tab" data-bs-toggle="tab"
							data-bs-target="#home-tab-pane" type="button" role="tab"
							aria-controls="home-tab-pane" aria-selected="true">Home</button>
					</li>
					<li class="nav-item" role="presentation">
						<button class="nav-link" id="profile-tab" data-bs-toggle="tab"
							data-bs-target="#profile-tab-pane" type="button" role="tab"
							aria-controls="profile-tab-pane" aria-selected="false">Profile</button>
					</li>
					<li class="nav-item" role="presentation">
						<button class="nav-link" id="contact-tab" data-bs-toggle="tab"
							data-bs-target="#contact-tab-pane" type="button" role="tab"
							aria-controls="contact-tab-pane" aria-selected="false">Contact</button>
					</li>
					<li class="nav-item" role="presentation">
						<button class="nav-link" id="disabled-tab" data-bs-toggle="tab"
							data-bs-target="#disabled-tab-pane" type="button" role="tab"
							aria-controls="disabled-tab-pane" aria-selected="false" disabled>Disabled</button>
					</li>
				</ul>
			</blockquote>
		</figure>s
	</div>


	<div class="flex-center" style="margin-top: 5%;">
		<div class="container"
			style="display: flex-center; justify-content: center; max-width: 1200px;">
			<div class="row">
				<div class="col" style="width: 25%; border: 1px">

<c:forEach var="name" items="${ItemListDTO}">
<td>${ name.price }</td>
</c:forEach>
					<div class="tab-content" id="myTabContent">
						<div class="tab-pane fade show active" id="home-tab-pane"
							role="tabpanel" aria-labelledby="home-tab" tabindex="0">
							<c:choose>
								<c:when test="${ empty boardLists }">
									<tr>
										<td colspan="6" align="center">등록된 게시물이 없습니다^^*</td>
									</tr>
								</c:when>
								<c:otherwise>
									<c:forEach items="${ boardLists }" var="row" varStatus="loop">
										<tr align="center">
											<td>${ map.totalCount - (((map.pageNum-1) * map.pageSize) + loop.index) }
											</td>
											<td align="left"><a href="/ItemList.do?idx=${ row.id }">${ row.productname }</a>
											</td>
											<td>${ row.username }</td>
											<td>${ row.productname }</td>
											<td>${ row.price }</td>
										</tr>
									</c:forEach>
								</c:otherwise>
							</c:choose>
						</div>
						<div class="tab-pane fade" id="profile-tab-pane" role="tabpanel"
							aria-labelledby="profile-tab" tabindex="0">...</div>
						<div class="tab-pane fade" id="contact-tab-pane" role="tabpanel"
							aria-labelledby="contact-tab" tabindex="0">...</div>
						<div class="tab-pane fade" id="disabled-tab-pane" role="tabpanel"
							aria-labelledby="disabled-tab" tabindex="0">...</div>
					</div>
				</div>

			</div>
		</div>
	</div>


	<jsp:include page="../layout/Footer.jsp" />

</body>
</html>