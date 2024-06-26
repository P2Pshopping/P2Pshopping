<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="fn" %>


<!-- 로그인 화면에서 border 테두리 없애는거 성공시키고 카카오 로그인 눌렀을때 카카오 로그인 시도 하게 하는거 찾고 네이버 로그인도 이어서 실행되게 하기 -->





<link href="text.css" rel="stylesheet" type="text/css">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"	rel="stylesheet"	integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"	crossorigin="anonymous">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js" integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF" crossorigin="anonymous"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous"><meta name="viewport" content="width=device-width, initial-scale=1">

<head>
<meta charset="UTF-8">
<title>Login</title>
<script src="https://t1.kakaocdn.net/kakao_js_sdk/2.7.2/kakao.min.js" 
integrity="sha384-TiCUE00h649CAMonG018J2ujOgDKW/kVWlChEuu4jK2vxfAAD0eZxzCKakxg55G4"
 crossorigin="anonymous"></script>
<script >

Kakao.init("c001e197e7fa7a4857d81e3876d22b27");
console.log(Kakao.isInitialized());   
  
</script>

<script>
  function loginWithKakao() {
    Kakao.Auth.authorize({
      redirectUri: 'http://localhost:8080/iMarket/Join/Kakaojoin.jsp',
    });
  } 
  displayToken()
  function displayToken() {
	    var token = getCookie('authorize-access-token');

	    if(token) {
	      Kakao.Auth.setAccessToken(token);// 쿠키에서 얻은 토큰을 사용하여 Kakao SDK에 접근 토큰 설정
	      Kakao.Auth.getStatusInfo()  // Kakao SDK를 사용하여 로그인 상태 정보를 가져오는 비동기 함수 호출
	        .then(function(res) {	// 로그인 상태가 'connected'인 경우, 토큰을 화면에 표시
	          if (res.status === 'connected') {
	            document.getElementById('token-result').innerText
	              = 'login success, token: ' + Kakao.Auth.getAccessToken();
	          }
	        })
	        .catch(function(err) {
	          Kakao.Auth.setAccessToken(null); // 오류 발생 시, 접근 토큰을 초기화
	        });
	    }
	  }

	  function getCookie(name) {  // 쿠키에서 특정 이름의 쿠키 값을 가져오는 함수
 
	    var parts = document.cookie.split(name + '=');
	    if (parts.length === 2) { return parts[1].split(';')[0]; }
	  }
	</script>

	   <script>
	   
	  Kakao.init('c001e197e7fa7a4857d81e3876d22b27');
	  console.log(Kakao.isInitialized()); 
	  
	   function loginWithKakao() {
           Kakao.Auth.login({
               success: function(authObj) {
                   // 로그인 성공 시, authObj에서 토큰을 받아와 서버로 전송하거나 필요한 작업을 수행합니다.
                   console.log(authObj);
               },
               fail: function(err) {
                   // 로그인 실패 시 처리할 작업을 추가합니다.
                   console.error(err);
               }
           });
           class ViewController: UIViewController, WKUIDelegate, WKNavigationDelegate {

        	    // 웹뷰 목록 관리
        	    var webViews = [WKWebView]()

        	    ...

        	    /// ---------- 팝업 열기 ----------
        	    /// - 카카오 JavaScript SDK의 로그인 기능은 popup을 이용합니다.
        	    /// - window.open() 호출 시 별도 팝업 webview가 생성되어야 합니다.
        	    ///
        	    function webView(_ webView: WKWebView,
        	                 createWebViewWith configuration: WKWebViewConfiguration,
        	                 for navigationAction: WKNavigationAction,
        	                 windowFeatures: WKWindowFeatures
        	    ) -> WKWebView? {
        	        guard let frame = self.webViews.last?.frame else {
        	            return nil
        	        }

        	        // 웹뷰를 생성하여 리턴하면 현재 웹뷰와 parent 관계가 형성됩니다.
        	        return createWebView(frame: frame, configuration: configuration)
        	    }

        	    /// ---------- 팝업 닫기 ----------
        	    /// - window.close()가 호출되면 앞에서 생성한 팝업 webview를 닫아야 합니다.
        	    ///
        	    func webViewDidClose(_ webView: WKWebView) {
        	        destroyCurrentWebView()
        	    }

        	    // 웹뷰 생성 메서드 예제
        	    func createWebView(frame: CGRect, configuration: WKWebViewConfiguration) -> WKWebView {
        	        let webView = WKWebView(frame: frame, configuration: configuration)
        	        
        	        // set delegate
        	        webView.uiDelegate = self
        	        webView.navigationDelegate = self
        	                
        	        // 화면에 추가
        	        self.view.addSubview(webView)

        	        // 웹뷰 목록에 추가
        	        self.webViews.append(webView)

        	        // 그 외 서비스 환경에 최적화된 뷰 설정하기

        	        
        	        return webView
        	    }

        	    // 웹뷰 삭제 메서드 예제
        	    func destroyCurrentWebView() {
        	        // 웹뷰 목록과 화면에서 제거하기
        	        self.webViews.popLast()?.removeFromSuperview()
        	    }

        	}
	</script>
<script type = "text/javascript">
function validateForm(form) {

	if (!form.username.value) {
		alert('아이디를 입력해주세요');
		username.focus();
		return false;
		
	}

	if (form.password.value == "") {
		alert('비밀번호를 입력해주세요');
		password.focus();
		return false;
	}

	if (password.length < 6) {
		alert('비밀번호를 6자 이상 입력해주세요');
		password.focus();
		return false;
	}
</script>
</head>

<body style="overflow-x: scroll; margin:0 auto; width:1200px; align-items : center;">
 <%@include file="../../layout/Header.jsp"%>
 <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
	<span style="color: red; font-size: 1.2em;"> 
<%= request.getAttribute("LoginErrMsg") == null ? "" : request.getAttribute("LoginErrMsg") %>	
<% if(session.getAttribute("UserId") == null) { %>
</span>


	<script>
	  

		function validateForm(form) {
			if (!form.username.value) {
				alert("아이디를 입력하세요.");
				return false;
			}
			if (form.password.value == "") {
				alert("패스워드를 입력하세요.");
				return false;
			}
		}
		
	
		
	</script>



	<div class="login_wrapper">
	<div class="flex-center">
Login In
</div>
	
		<div class="login_form">
		


		  <form action="<c:url value='/login.do' />"  method="post" name = "loginFrm" onsubmit = "return validateForm(this);">

				<input type="text"  name="username" class="login_text" placeholder="ID">
				 <input type="password" name="password" class="login_text"  placeholder="PASSWORD">

				<p>
				<div class ="blank">
					<a href="../Find/FindId.jsp" class="btn btn-link" type=button
						id="Find">Forgot Password?</a> 
						
						
					<a href="../agree/agree.jsp"
						class="btn btn-link" type=button id="join">Sign In</a> 
						
					<input type="checkbox" class="form-check-input" name="save_check">
					<label class="form-check-label">아이디 저장</label>
				</div>
				</p>
			<div class="d-grid gap-2 mx-auto" >
				<input type="submit" width="300px" height="45px" class="btn btn-secondary"   value = "로그인"/>

	</div>
		</form>


		 <button class="kakao"  type="submit">
		 <a id="kakao-login-btn" href="javascript:loginWithKakao()">
                <img src="kakao_login.png" onclick="javascript:loginWithKakao();" alt="카카오 로그인">
</a>
            </button>
<p id="token-result"></p>

           
            <button class="kakao" type="submit">
                <img src="naver_login.png" alt="네이버 로그인">
                </button>
			</div>

		</div>
		<% if (request.getParameter("error") != null) { %>
    <p style="color: red;">Invalid username or password. Please try again.</p>
<% } %>
		
	<%
	} else { //로그인된 상태
	%>
<%=session.getAttribute("username")%>
	회원님, 로그인하셨습니다.
	<br />
	<a href="<c:url value='/login.do' />">[로그아웃]</a>
	<%
	}
	%>

<div style = "margin-top:50%;">
<%@include file="../layout/Footer.jsp"%>
</div>
</body>
</html>