<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>병원찾기 - 결과</title>
    <script type="text/javascript" src="https://openapi.map.naver.com/openapi/v3/maps.js?ncpClientId=YOUR_MAP_CLIENT_ID"></script>
    <style>
        #map {width:100%;height:400px;}
        .menu_wrap {position:relative;max-width:300px;width:100%;height:400px;overflow-y:auto;}
        .item {cursor:pointer;padding:10px;border-bottom:1px solid #eee;}
        .item:hover {background:#f5f5f5;}
    </style>
</head>
<body>
    <h1>병원찾기 결과</h1>
    <div id="map"></div>
    <div class="menu_wrap">
        <ul id="placesList"></ul>
    </div>

    <script>
        var mapOptions = {
            center: new naver.maps.LatLng(37.566826, 126.9786567),
            zoom: 10
        };
        var map = new naver.maps.Map('map', mapOptions);

        var markerList = [];
        var infowindowList = [];

        function searchHospitals() {
            var xhr = new XMLHttpRequest();
            var url = 'HospitalSearchServlet?department=<%= request.getParameter("department") %>&address=<%= request.getParameter("address") %>';
            xhr.open('GET', url, true);
            xhr.onreadystatechange = function () {
                if (xhr.readyState == 4 && xhr.status == 200) {
                    var response = JSON.parse(xhr.responseText);
                    var items = response.items;
                    displayPlaces(items);
                }
            };
            xhr.send();
        }

        function displayPlaces(places) {
            var listEl = document.getElementById('placesList'),
                bounds = new naver.maps.LatLngBounds();

            for (var i = 0; i < places.length; i++) {
                var place = places[i];
                var position = new naver.maps.LatLng(place.mapy, place.mapx);
                var marker = new naver.maps.Marker({
                    position: position,
                    map: map
                });
                var infowindow = new naver.maps.InfoWindow({
                    content: '<div style="padding:10px;">' + place.title + '</div>'
                });

                naver.maps.Event.addListener(marker, 'click', getClickHandler(map, marker, infowindow));
                markerList.push(marker);
                infowindowList.push(infowindow);
                bounds.extend(position);

                var itemEl = document.createElement('li');
                itemEl.className = 'item';
                itemEl.innerHTML = '<div><strong>' + place.title + '</strong></div>' +
                    '<div>' + place.roadAddress + '</div>' +
                    '<div>' + place.telephone + '</div>';

                listEl.appendChild(itemEl);
            }

            map.fitBounds(bounds);
        }

        function getClickHandler(map, marker, infowindow) {
            return function() {
                for (var i = 0; i < infowindowList.length; i++) {
                    infowindowList[i].close();
                }
                infowindow.open(map, marker);
            };
        }

        searchHospitals();
    </script>
</body>
</html>


