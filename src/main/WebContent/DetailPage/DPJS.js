
	function currentLocation() {
		if(navigator.geolocation) {
			System.out.println("된듯");
			navigator.geolocation.getCurrentPosition(function(postion){
				
				var lat = position.coords.latitude; //위도
				var lon = position.coords.longtitude; //경도
				
				var locPosition = new kakao.maps.LatLng(lat,lon);
				
				var message = '<div style="padding:5px;">현위치</div>';
				
				displayMarker(locPosition, message);
			});
		}else {
			var locPostion = new kakao.maps.LatLng(37.4812845080678,126.952713197762),
				message = '현재 위치를 알 수 없어 기본 위치로 이동합니다.'
				
				currentLatLon['lat']=33.450701
				currentLatLon['lon']=126.570667
				
				displayMarker(locPosition, message);
			
		}
		return true
	}
	currentLocation();
	
	
	
	function displayMarker(locPosition,message) {
		var imageSize = new kakao.maps.size(200,300);
		var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize);
		
		var marker = new kakao.maps.Marker({
			map:map,
			position:locPosition,
			image: markerImage,
		});
		
		var iwContent = message, 
			iwRemoveable = true;
		
		var infowindow = new kakao.maps.InfoWindow({
			content : iwContent,
			removable : iwRemoveable
		});
		
		infowindow.open(map,marker);
		
		map.setCenter(locPosition);
		
	
	}
	
		function chatWinOpen() {
		var id = document.getElementById("chatId");
		if(id.value == "") {
			alert("대화명을 입력 후 채팅창을 열어주세요");
			id.focus();
			return;
		}
		window.open("ChatWindow.jsp?chatId=" + id.value, "", "width=320,height=400");
		id.value = "";
	}
	
	

	 