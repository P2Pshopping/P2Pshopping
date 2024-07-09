<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%-- <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> --%>
<%@ taglib uri="jakarta.tags.core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<title>Admin Dashboard</title>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<style>
/* body {
	background-color: #f8f9fa;
} */

.container {
	background-color: #343a40;
	color: white;
	padding: 20px;
	border-radius: 8px;
	margin-top: 20px;
	box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
}

.card {
	background-color: #495057;
	color: white;
}

.card .card-title {
	color: #ffc107;
}

.btn-primary {
	background-color: #007bff;
	border: none;
}

.btn-secondary {
	background-color: #6c757d;
	border: none;
}

.btn-warning {
	background-color: #ffc107;
	border: none;
}

.btn-danger {
	background-color: #dc3545;
	border: none;
}

.btn-sm {
	padding: 5px 10px;
}

.chart-container {
	position: relative;
	margin: auto;
	height: 300px;
	width: 300px;
}

.chart-container-large {
	position: relative;
	margin: auto;
	height: 400px;
	width: 800px;
}
</style>
</head>
<body style="overflow-x: scroll; margin: 0 auto; width: 1200px; align-items: center; background-color: #f7f7f7;">
	<%@include file="../layout/Header.jsp"%>
	<div class="container mt-5">
		<h2 class="mb-4">관리자님 환영합니다</h2>
		<div class="row mb-4">
			<div class="col text-center">
				<a href="${pageContext.request.contextPath}/admin/users/*"
					class="btn btn-primary mx-2">회원관리</a> <a
					href="${pageContext.request.contextPath}/admin/categories.do"
					class="btn btn-secondary mx-2">카테고리관리</a>
			</div>
		</div>

		<div class="row">
			<div class="col-md-6 mb-4">
				<div class="card">
					<div class="card-body text-center">
						<h5 class="card-title">사용자 통계</h5>
						<p>활성 사용자 수: ${activeUsers}</p>
						<p>비활성 사용자 수: ${inactiveUsers}</p>
						<div class="chart-container">
							<canvas id="userChart"></canvas>
						</div>
					</div>
				</div>
			</div>
			<div class="col-md-6 mb-4">
				<div class="card">
					<div class="card-body text-center">
						<h5 class="card-title">거래 통계</h5>
						<p>오늘 거래 수: ${todayTransactions}</p>
						<p>이번 주 거래 수: ${weekTransactions}</p>
						<p>이번 달 거래 수: ${monthTransactions}</p>
						<div class="chart-container">
							<canvas id="transactionChart"></canvas>
						</div>
					</div>
				</div>
			</div>
		</div>

		<div class="row mb-4">
			<div class="col">
				<div class="card">
					<div class="card-body">
						<h5 class="card-title">신규 등록 제품 수</h5>
						<p>${newProducts}</p>
					</div>
				</div>
			</div>
		</div>

		<div class="row mb-4">
			<div class="col">
				<div class="card">
					<div class="card-body">
						<h5 class="card-title">최근 리뷰 및 피드백</h5>
						<c:forEach var="review" items="${recentReviews}">
							<p>${review.title}- ${review.rating}</p>
						</c:forEach>
					</div>
				</div>
			</div>
		</div>

		<div class="row mb-4">
			<div class="col">
				<div class="card">
					<div class="card-body text-center">
						<h5 class="card-title">사이트 트래픽 통계</h5>
						<p>전체 방문 수: ${totalVisits}</p>
						<p>관리페이지 방문: ${dashboardVisits}/ 메인페이지 방문: ${MainpageVisits}/
							판매페이지 방문: ${sellProductVisits}/ 병원페이지 방문: ${HospitalVisits}</p>
						<div class="chart-container-large">
							<canvas id="trafficChart"></canvas>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<script>
        document.addEventListener('DOMContentLoaded', function() {
            console.log("DOM fully loaded and parsed"); // 로그 추가

            // 페이지 로드 시 방문 기록 저장
            var pageUrl = window.location.pathname + window.location.search;
            console.log("Page URL: " + pageUrl); // 로그 추가

            $.ajax({
                url: '${pageContext.request.contextPath}/track',
                method: 'GET',
                data: { pageUrl: pageUrl },
                success: function(response) {
                    console.log('Visit recorded');
                },
                error: function(xhr, status, error) {
                    console.error('Error recording visit:', error);
                }
            });

            // Chart.js 차트 추가
            var userChart = new Chart(document.getElementById('userChart').getContext('2d'), {
                type: 'doughnut',
                data: {
                    labels: ['활성 사용자', '비활성 사용자'],
                    datasets: [{
                        data: [${activeUsers}, ${inactiveUsers}],
                        backgroundColor: ['#36a2eb', '#ff6384']
                    }]
                },
                options: {
                    responsive: true
                }
            });

            var transactionChart = new Chart(document.getElementById('transactionChart').getContext('2d'), {
                type: 'bar',
                data: {
                    labels: ['오늘', '이번 주', '이번 달'],
                    datasets: [{
                        label: '거래 수',
                        data: [${todayTransactions}, ${weekTransactions}, ${monthTransactions}],
                        backgroundColor: ['#36a2eb', '#ff6384', '#ffcd56']
                    }]
                },
                options: {
                    responsive: true
                }
            });

            var trafficChart = new Chart(document.getElementById('trafficChart').getContext('2d'), {
                type: 'line',
                data: {
                    labels: ['전체 방문 수', '관리페이지', '메인페이지', '판매페이지', '병원페이지'],
                    datasets: [{
                        label: '방문 수',
                        data: [${totalVisits}, ${dashboardVisits}, ${MainpageVisits}, ${sellProductVisits}, ${HospitalVisits}],
                        borderColor: '#36a2eb',
                        fill: false
                    }]
                },
                options: {
                    responsive: true
                }
            });
        });
    </script>
</body>
<%@ include file="../layout/Footer.jsp"%>
</html>
