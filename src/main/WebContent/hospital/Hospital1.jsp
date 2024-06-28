<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>병원찾기</title>
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;700&display=swap" rel="stylesheet">
    <style>
        body {
            font-family: 'Roboto', sans-serif;
            text-align: center;
            background-color: #E0F7FA;
            margin: 0;
            padding: 0;
        }
        header {
            margin-top: 20px;
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
        }
        h1 {
            color: #000000;
            font-size: 2.5em;
        }
        h2 {
            color: #D81B60;
            font-size: 1.5em;
            margin-bottom: 40px;
        }
        .container {
            display: flex;
            justify-content: center;
            align-items: center;
            height: 60vh;
        }
        .option {
            margin: 20px;
            padding: 20px;
            border: 1px solid #BDBDBD;
            border-radius: 10px;
            background-color: #FFFFFF;
            width: 200px;
            height: 200px;
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
            cursor: pointer;
            transition: transform 0.2s, box-shadow 0.2s;
            box-shadow: 0 4px 8px rgba(0,0,0,0.1);
        }
        .option:hover {
            transform: scale(1.1);
            box-shadow: 0 8px 16px rgba(0,0,0,0.2);
        }
        .option img {
            width: 70%;
            height: auto;
        }
        .option p {
            margin-top: 15px;
            font-size: 1.2em;
            color: #424242;
        }
    </style>
    <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=0637e168501ef6ed107e35286b4b79b1&libraries=services"></script>
    <script>
        function searchHospitals(department) {
            if (navigator.geolocation) {
                navigator.geolocation.getCurrentPosition(function(position) {
                    var latitude = position.coords.latitude;
                    var longitude = position.coords.longitude;
                    var query = department === '산부인과' ? '산부인과' : '소아과';
                    var url = 'https://map.kakao.com/?q=' + encodeURIComponent(query) + '&center=' + longitude + ',' + latitude + '&radius=2000';
                    window.open(url, '_blank');
                }, function(error) {
                    alert('위치 정보를 가져올 수 없습니다.');
                });
            } else {
                alert('위치 정보를 사용할 수 없습니다.');
            }
        }
    </script>
</head>
<body>
	<%@ include file="../layout/Header.jsp"%>
    <header>
        <h1>병원찾기</h1>
        <h2>원하는 <span style="color: #D81B60;">진료과</span>를 선택해주세요</h2>
    </header>
    <div class="container">
        <div class="option" onclick="searchHospitals('산부인과')">
            <img src="../Image/gynecology.png" alt="산부인과">
            <p>산부인과</p>
        </div>
        <div class="option" onclick="searchHospitals('소아과')">
            <img src="../Image/pediatrician.png" alt="소아과">
            <p>소아과</p>
        </div>
    </div>
    
    	<%@ include file="../layout/Footer.jsp"%>
</body>
</html>

