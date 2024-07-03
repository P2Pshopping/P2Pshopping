<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js" charset="utf-8"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
</head>
<body>
<script type = "text/javascript">
var naver_id_login = new naver_id_login("siZ_BDmACND9WyZwgnu1", "http://localhost:8081/members/mypage/social/naver/link");
	alert(naver_id_login.oauthParams.access_token);
	
	naver_id_login.get_naver_userprofile("naverSignInCallback()");
	
	function naverSignInCallback(){
		alert(naver_id_login.getProfileData("name"));
		alert(naver_id_login.getProfileData("mobile"));
		alert(naver_id_login.getProfileData("birthyear"));
	}


</script>

</body>
</html>