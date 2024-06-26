<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.BufferedReader, java.io.InputStreamReader, java.net.HttpURLConnection, java.net.URL" %>
<%@ page import="org.json.JSONArray, org.json.JSONObject" %>
<%
    String department = request.getParameter("department");
    String latitude = request.getParameter("latitude");
    String longitude = request.getParameter("longitude");
    String clientId = "ztfp2obt82";
    String clientSecret = "hnPwfHZh6DgZl65JqRsZJks2sfn8ahvpnfY0mLjG";

    if (department == null || latitude == null || longitude == null) {
        out.println("Missing required parameters.");
        return;
    }

    String apiURL = "https://naveropenapi.apigw.ntruss.com/map-place/v1/search?query=" + java.net.URLEncoder.encode(department, "UTF-8") + "&coordinate=" + latitude + "," + longitude;

    StringBuilder responseBuilder = new StringBuilder();
    JSONArray items = null;
    try {
        URL url = new URL(apiURL);
        HttpURLConnection con = (HttpURLConnection) url.openConnection();
        con.setRequestMethod("GET");
        con.setRequestProperty("X-NCP-APIGW-API-KEY-ID", clientId);
        con.setRequestProperty("X-NCP-APIGW-API-KEY", clientSecret);

        int responseCode = con.getResponseCode();
        BufferedReader br;
        if (responseCode == 200) {
            br = new BufferedReader(new InputStreamReader(con.getInputStream()));
        } else {
            br = new BufferedReader(new InputStreamReader(con.getErrorStream()));
        }
        String inputLine;
        while ((inputLine = br.readLine()) != null) {
            responseBuilder.append(inputLine);
        }
        br.close();

        // 디버깅용 응답 데이터 출력
        out.println("<pre>Response Data: " + responseBuilder.toString() + "</pre>");

        JSONObject jsonResponse = new JSONObject(responseBuilder.toString());
        items = jsonResponse.getJSONArray("places");
    } catch (Exception e) {
        e.printStackTrace();
        out.println("Error: " + e.getMessage());
        return;
    }
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>병원찾기 - 결과</title>
    <script type="text/javascript" src="https://openapi.map.naver.com/openapi/v3/maps.js?ncpClientId=YOUR_NAVER_CLIENT_ID"></script>
    <script>
        function initMap() {
            var mapOptions = {
                center: new naver.maps.LatLng(<%= latitude %>, <%= longitude %>),
                zoom: 15
            };
            var map = new naver.maps.Map('map', mapOptions);

            var markerList = [];
            var infowindowList = [];
            <% for (int i = 0; i < items.length(); i++) {
                JSONObject item = items.getJSONObject(i);
                String name = item.getString("name");
                String roadAddress = item.getString("roadAddress");
                String jibunAddress = item.getString("jibunAddress");
                double lat = item.getDouble("y");
                double lng = item.getDouble("x");
            %>
            var marker = new naver.maps.Marker({
                position: new naver.maps.LatLng(<%= lat %>, <%= lng %>),
                map: map
            });
            var infowindow = new naver.maps.InfoWindow({
                content: '<div style="width:150px;text-align:center;padding:10px;"><b><%= name %></b><br><%= roadAddress %><br><%= jibunAddress %></div>'
            });
            markerList.push(marker);
            infowindowList.push(infowindow);
            <% } %>

            for (var i=0; i<markerList.length; i++) {
                naver.maps.Event.addListener(markerList[i], 'click', getClickHandler(i));
            }

            function getClickHandler(seq) {
                return function(e) {
                    var marker = markerList[seq],
                        infowindow = infowindowList[seq];
                    if (infowindow.getMap()) {
                        infowindow.close();
                    } else {
                        infowindow.open(map, marker);
                    }
                }
            }
        }

        window.onload = initMap;
    </script>
</head>
<body>
    <h1>병원찾기 결과</h1>
    <div id="map" style="width:100%;height:400px;"></div>
</body>
</html>

