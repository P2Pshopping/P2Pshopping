<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>병원찾기</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            text-align: center;
            background-color: #E0F7FA;
        }
        h1 {
            color: #000000;
        }
        h2 {
            color: #D81B60;
        }
        .container {
            display: flex;
            justify-content: center;
            align-items: center;
            height: 80vh;
        }
        .option {
            margin: 20px;
            padding: 20px;
            border: 1px solid #BDBDBD;
            border-radius: 10px;
            background-color: #FFFFFF;
            width: 150px;
            height: 150px;
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
            cursor: pointer;
            transition: transform 0.2s;
        }
        .option:hover {
            transform: scale(1.1);
        }
        .option img {
            width: 50%;
            height: auto;
        }
        .option p {
            margin-top: 10px;
            font-size: 1.2em;
            color: #424242;
        }
    </style>
    <script>
        function searchHospitals(department) {
            console.log("searchHospitals called with department:", department); // 디버그 메시지

            if (navigator.geolocation) {
                navigator.geolocation.getCurrentPosition(function(position) {
                    console.log("Geolocation success:", position); // 디버그 메시지

                    var latitude = position.coords.latitude;
                    var longitude = position.coords.longitude;

                    // 프록시 서버를 통해 좌표를 도로명 주소로 변환
                    var xhr = new XMLHttpRequest();
                    var url = 'ProxyServlet?latitude=' + latitude + '&longitude=' + longitude;
                    xhr.open('GET', url, true);
                    xhr.onreadystatechange = function () {
                        if (xhr.readyState == 4) {
                            if (xhr.status == 200) {
                                console.log("API call success:", xhr.responseText); // 디버그 메시지

                                var response = JSON.parse(xhr.responseText);
                                var roadAddress = response.results[0].land.number1;
                                window.location.href = 'search.jsp?department=' + encodeURIComponent(department) + '&address=' + encodeURIComponent(roadAddress);
                            } else {
                                console.log("API call failed:", xhr.responseText); // 디버그 메시지
                            }
                        }
                    };
                    xhr.send();
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
    <header>
        <h1>병원찾기</h1>
        <h2>원하는 <span style="color: #D81B60;">진료과</span>를 선택해주세요</h2>
    </header>
    <div class="container">
        <div class="option" onclick="searchHospitals('산부인과')">
            <img src="gynecology_icon.png" alt="산부인과">
            <p>산부인과</p>
        </div>
        <div class="option" onclick="searchHospitals('소아과')">
            <img src="pediatrics_icon.png" alt="소아과">
            <p>소아과</p>
        </div>
    </div>
</body>
</html>

