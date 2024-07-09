<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.Connection"%>
<%@ page import="common.JDBConnect"%>
<%@ page import="User.UserDAO"%>
<%@ page import="common.UserDTO"%>

<!-- 내일 와서 diff 떠보기 join 페이지 -->


<link href="text.css" rel="stylesheet" type="text/css">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
	crossorigin="anonymous">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"
	integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p"
	crossorigin="anonymous"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js"
	integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF"
	crossorigin="anonymous"></script>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
	crossorigin="anonymous">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
	crossorigin="anonymous">
<meta name="viewport" content="width=device-width, initial-scale=1">



<!DOCTYPE html>
<html>
<head>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<meta charset="UTF-8">
<title>카카오 회원가입</title>



</head>
<body>
	<%@include file="../layout/Header.jsp"%>
	<div style="margin-top: 300px;">

		<div class="wrap">
			<div class="contents">
				<div class="join_wrapper2">
					<div class="logo"> 카카오 회원가입</div>
					<div class="join_form">
						<form action="Kakaojoin.jsp" method="post" id="form__wrap">

							<div class="input-group mb-3" style="width: 600px; margin-top:30px;">
								<label for="inputName"
									class="input-group-text fixed-width-label">성명</label> <input
									type="text" class="form-control" id="inputName"
									name="inputName" placeholder="성명 입력" maxlength="5">
							</div>
							<div class="input-group mb-3" style="width: 600px;">
								<label for="inputBirth"
									class="input-group-text fixed-width-label">생년월일</label> <input
									type="text" class="form-control" id="inputBirth"
									name="inputBirth" placeholder="YYYYMMDD 형식으로 생년월일 입력"
									maxlength="8"  oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');">

							</div>

							<div class="input-group-container" style ="justify-content: center;">
								<div class="input-group mb-3" style="width: 480px;">
									<label for="inputId" class="input-group-text fixed-width-label">아이디</label>
									<!-- <div class="input-group mb-3"> -->
									<input type="text" class="form-control" id="username"
										name="username" placeholder="4글자 이상으로 입력해주세요." maxlength="10"> 
										
									<!-- </div> -->
								</div>
										<input
										type="button" class="btn btn-success" id="btnCheckId" style ="margin-left:20px; width:100px; height:38px;"
										value="중복 확인">
							</div>
							<div class="input-group mb-3" style="width: 600px;">
								<label for="inputPWD" class="input-group-text fixed-width-label">비밀번호</label>
								<input type="password" class="form-control" id="inputPWD"
									name="inputPWD" placeholder="영어,숫자,특수기호 3가지를 모두 사용해주세요." maxlength="20">
							</div>
							<div class="input-group mb-3" style="width: 600px;">
								<label for="inputPWDC"
									class="input-group-text fixed-width-label">비밀번호 확인</label> <input
									type="password" class="form-control" id="inputPWDC"
									name="inputPWDC" placeholder="위와 같이 입력하세요" maxlength="20">
							</div>
							<div class="input-group mb-3" style="width: 600px;">
								<label for="inputPhone"
									class="input-group-text fixed-width-label">전화번호</label> <input
									type="text" class="form-control" id="inputPhone"
									name="inputPhone" placeholder="11자리에 맞게 전화번호를 입력해주세요." maxlength="11" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');">
							</div>
							<div class="input-group mb-3" style="width: 600px;">
								<label for="inputEmail"
									class="input-group-text fixed-width-label">Email</label>
									 <input
									type="text" class="form-control" name="inputEmail"  id= "inputEmail" placeholder="Username"
									aria-label="Username"> 
									<span class="input-group-text">@</span>
								<!-- <input type="email" class="form-control" id="inputEmail"
									name="inputEmail" placeholder="이메일을 입력하세요.">  -->
									
									<input class="form-control" id="domain-txt" name ="domain-txt" type="email" placeholder="이메일 주소" disabled/> 
									<select class="box" id="domain-list" name ="domain-list">
  									<option value="type">직접 입력</option>
									  <option value="naver.com"  id="domain-list">naver.com</option>
									<option value="google.com">google.com</option>
									<option value="hanmail.net">hanmail.net</option>
									<option value="nate.com">nate.com</option>
									<option value="kakao.com">kakao.com</option>
								</select>
							</div>
							<div onload="init();">
							<div class="input-group-container" style ="justify-content: center;">
								<div class="input-group mb-3" style="width: 480px;">
									<label for="inputAddress"
										class="input-group-text fixed-width-label">주소</label>
									<!-- <div class="input-group"> -->
									<input type="text" class="form-control" id="roadAddrPart1"
										name="inputAddress" placeholder="주소 입력">
										
									<!-- </div> -->
								</div>
									<button type="button" onclick="goPopup()" style ="margin-left:20px; width:100px; height:38px;"
										class="btn btn-success">주소 검색</button>
										</div>
								<div class="input-group mb-3" style="width: 600px;">
									<label for="inputAddress2"
										class="input-group-text fixed-width-label">상세 주소</label> <input
										type="text" class="form-control" id="addrDetail"
										name="inputAddress2" placeholder="상세 주소 입력">
									<!-- zipNo 안써도 지우지마 -->
									<input type="hidden" class="form-control" id="zipNo"
										name="inputAddress2" placeholder="">
								</div>
							</div>
							<div class="blank"></div>
							<p></p>

							<!--                 <div class="terms__box">
                        <div class="input__check">
                            <input  type="checkbox" id="privacyPolicy" name ="agreement"value="privacyPolicy" required>
                            <label class="required" for="privacyPolicy"> 회원가입 하시겠습니까 ? </label>
                        </div>
                   </div> -->
							
							<span class="button-container" style ="margin-top:80px;">
								<a href="../Main/Mainpage.jsp" class="btn btn-secondary btn-lg" >뒤로
									가기</a>
								<button type="submit" id="target_btn"
									class="btn btn-success btn-lg" name="loginButton" 
									onclick="loginbtn();" disabled>회원 가입</button>

							</span>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div style="margin-top: 10%;">
		<%@include file="../layout/Footer.jsp"%>
	</div>
	<%
	String inputYn = request.getParameter("inputYn");
	String roadAddrPart1 = request.getParameter("roadAddrPart1");
	String addrDetail = request.getParameter("addrDetail");
	String message = null;
	String inputEmailValue = request.getParameter("inputEmail"); // Username 입력 값
	String domainTxtValue = request.getParameter("domain-txt"); // 직접 입력한 도메인
	String domainListValue = request.getParameter("domain-list"); // 선택한 도메인
	
	String emails;
	if (domainTxtValue != null) {
	    emails = inputEmailValue + "@" + domainTxtValue; // Username + 직접 입력한 도메인
	} else if (  domainListValue != null) {
	    emails = inputEmailValue + "@" + domainListValue; // Username + 선택한 도메인
	} else {
	  emails = "null";
	}
	
	
	if ("POST".equalsIgnoreCase(request.getMethod())) {
		String name = request.getParameter("inputName");
		String birth = request.getParameter("inputBirth");
	
		String username = request.getParameter("username");
		String password = request.getParameter("inputPWD");
		String passwordc = request.getParameter("inputPWDC");
		String phone = request.getParameter("inputPhone");
		 String email = emails;
		String address = request.getParameter("inputAddress");
	
		// 서버 측에서 추가적인 유효성 검사 및 회원가입 처리 로직
		 if (name == null || name.trim().isEmpty() ||
  			 birth == null || birth.trim().isEmpty() ||
   			 username == null || username.trim().isEmpty() ||
    		 password == null || password.trim().isEmpty() ||
    		 phone == null || phone.trim().isEmpty() ||
    		 email == null || email.trim().isEmpty() ||
    		 address == null || address.trim().isEmpty()) 
		 {
		
			 message = "모든 필수 항목을 입력해주세요.";
%>
<script>
    alert("모든 필수 항목을 입력해주세요.");
    event.preventDefault();
</script>
<% }else{
if (username.length() < 4) {
  
%>
<script>
    alert("아이디는 최소 4글자 이상이어야 합니다.");
    event.preventDefault();
</script>
<%
} else if (birth.length() != 8) {
    
%>
<script>
    alert("생년월일은 8글자여야 합니다.");
    event.preventDefault();
</script>
<%
        } else if (phone.length() != 11 || !phone.matches("[0-9]+")) {
            message = "전화번호는 11자리의 숫자로 입력해주세요.";
%>
            <script>
                alert("전화번호는 11자리의 숫자로 입력해주세요.");
                event.preventDefault();
            </script>


	
<%

} else {
    // 이메일 형식 유효성 검사 (정규 표현식 사용 예)
    String emailRegex = "^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\\.[a-zA-Z]{2,}$";
    if (!email.matches(emailRegex)) {
      
    %>
    <script>
        alert("올바른 이메일 형식이 아닙니다.");
        event.preventDefault();
    </script>
<% 
    
    }else{
    	if (!password.equals(passwordc)) {
    	   
    	%>
    	<script>
    	    alert("비밀번호와 비밀번호 확인이 일치하지 않습니다.");
    	    event.preventDefault();
    	</script>
    	<%
    	} else if (password.length() < 4) {
    	   
    	%>
    	<script>
    	    alert("비밀번호는 최소 4글자 이상이어야 합니다.");
    	    event.preventDefault();
    	</script>
    	<%
    	} else {
    	    // 정규 표현식을 사용하여 영어, 숫자, 특수 기호 포함 여부 확인
    	    String passwordRegex = "^(?=.*[0-9])(?=.*[a-zA-Z])(?=.*[@#$%^&+=!])(?=\\S+$).{4,}$";
    	    if (!password.matches(passwordRegex)) {
    	        message = "비밀번호는 영어, 숫자, 특수 기호(@#$%^&+=!)를 모두 포함해야 합니다.";
    	    %>
    	    <script>
    	        alert("비밀번호는 영어, 숫자, 특수 기호를 모두 포함해야 합니다.");
    	        event.preventDefault();
    	    </script>
    	    <%
    	    } else {
    	
    
		UserDTO user = new UserDTO();
		user.setName(name);
		user.setUsername(username);
		user.setEmail(email);
		user.setPhone(phone);
		user.setAddress(address);
		user.setBirth(birth);
		user.setPassword(password);
		// 필요한 경우 다른 필드들도 설정
	
		UserDAO userDAO = null;
		try {
			userDAO = new UserDAO(application);
			String hashedPassword = userDAO.hashPassword(password); // 비밀번호 해시
			user.setPassword(hashedPassword); // 해시된 비밀번호 설정
			boolean isUserAdded = userDAO.addUser(user);
	
			if (isUserAdded) {
		/*    message = "회원가입이 성공적으로 완료되었습니다."; */
	%>
	<script>
	    window.location.href = "../Login/login.jsp";
	    alert("회원가입에 성공하였습니다.");
	</script>
	<%
	} else {
	  message = "잘못 입력하셨습니다 다시 입력해주세요.";
	%>
	<script>
	    alert("잘못 입력하셨습니다. 다시 입력해주세요.");
	    event.preventDefault();
	   /* event.preventDefault();ㄱ // 폼 제출을 중단  */
	 
	</script>
	<%
	}
	} catch (Exception e) {
	e.printStackTrace();
	// 예외 처리 로직 추가
	} finally {
	if (userDAO != null) {
	userDAO.close();
	}
	}
	}
}
	}
}}}
	
	%>
	<script>
	const domainListEl = document.querySelector('#domain-list')
	const domainInputEl = document.querySelector('#domain-txt')
	// select 옵션 변경 시
	domainInputEl.value = 'kakao.com';

	domainListEl.addEventListener('change', (event) => {
	  // option에 있는 도메인 선택 시
	  if(event.target.value !== "type") {
	    // 선택한 도메인을 input에 입력하고 disabled
	    domainInputEl.value = event.target.value
	    domainInputEl.disabled = true
	  } else { // 직접 입력 시
	    // input 내용 초기화 & 입력 가능하도록 변경
	    domainInputEl.value = ""
	    domainInputEl.disabled = false
	  }
	})
	</script>
	<script src="assets/js/jquery.min.js"></script>
	<script type="text/javascript">
    $(document).ready(function() {
        // 아이디 중복체크 버튼을 클릭했을 때 비동기통신으로 데이터 주고받음(page새로고침없음)
        $('#btnCheckId').on('click', function() {
            // 입력한 username 가져오기
            var username = $('input[name=username]').val();
        	var result_data;
            // Ajax로 username 보내기
            $.ajax({
                url: '/idCheck',   // 서버의 URL
                type: 'POST',      // POST 방식으로 요청
                data: {
                    username: username // 입력한 username 데이터 보내기
                },
                dataType: "json",   // 응답 데이터 타입은 json로 지정
                success: function(response) {
                    console.log('서버 응답:', response); // 서버 응답 전체를 콘솔에 출력

                    if (response.success) {
                        if (response.result === false) {
                            console.log('사용 가능한 아이디입니다.');
                            alert('사용 가능한 아이디입니다.');
                            $('#target_btn').prop('disabled', false);
                        } else {
                            console.log('중복되는 아이디가 있습니다.');
                            alert('중복되는 아이디가 있습니다.');
                            $('#target_btn').prop('disabled', true);
                        }
                    } else {
                        console.log('오류 발생:', response.message);
                        alert('오류 발생: ' + response.message);
                    }
                },
                error: function(xhr, status, error) {
                    console.log('서버 오류:', status, error); // 오류 메시지를 콘솔에 출력
                    alert('서버 오류가 발생했습니다.');
                }
            });
        });
    });
</script>
	<script>
function loginbtn(){
	if (result == "false"){
		joinCheck();
	}else{
		 alert('다시 입력칸을 한번 확인해주세요.'); 
		   event.preventDefault();
           return ;
		
	}
}
function formatDate(input) {
    // 숫자 외의 문자를 모두 제거
    input.value = input.value.replace(/[^\d]/g, '');

    // YYYYMMDD 형식으로 입력이 되도록 변환
    if (input.value.length > 4 && input.value.length <= 6) {
        input.value = input.value.replace(/(\d{4})(\d{2})/, '$1-$2');
    } else if (input.value.length > 6) {
        input.value = input.value.replace(/(\d{4})(\d{2})(\d{2})/, '$1-$2-$3');
    }
}

function init(){
    var url = location.href;
    var confmKey = "U01TX0FVVEgyMDI0MDYxNjIyNDUwMDExNDg0NTc=";
    var resultType = "4";// 도로명주소 검색결과 화면 출력내용, 1 : 도로명, 2 : 도로명+지번+상세보기(관련지번, 관할주민센터), 3 : 도로명+상세보기(상세건물명), 4 : 도로명+지번+상세보기(관련지번, 관할주민센터, 상세건물명)
	var inputYn= "<%=inputYn%>";
	if(inputYn != "Y"){
		document.form.confmKey.value = confmKey;
		document.form.returnUrl.value = url;
		document.form.resultType.value = resultType;
		document.form.action="https://business.juso.go.kr/addrlink/addrLinkUrl.do"; //인터넷망
		//document.form.action="https://business.juso.go.kr/addrlink/addrMobileLinkUrl.do"; //모바일 웹인 경우, 인터넷망
		document.form.submit();
	}else{
		//완료버튼
	opener.jusoCallBack("<%=roadAddrPart1%>","<%=addrDetail%>");
				// overlay 닫기
				opener.document.getElementById('overlay').style.display = 'none';
				opener.document.getElementById('confirmButton').style.display = 'none';
				// form 열기
				opener.document.getElementById('form').style.display = 'block';
				opener.document.getElementById('nextPage').style.display = 'block';
				window.close();
			}
		}
		function goPopup() {

		var pop = window.open("../popup/jusoPopup2.jsp","pop","width=570,height=420, scrollbars=yes, resizable=yes"); 
		}
	function jusoCallBack2(roadAddrPart1,addrDetail,zipNo){
	  // 디버깅 로그 추가
    console.log("jusoCallBack2 called");
    console.log("roadAddrPart1: " + roadAddrPart1);
    console.log("addrDetail: " + addrDetail);
    console.log("zipNo: " + zipNo);
	
    // 팝업 페이지에서 주소 입력한 정보를 받아서, 현 페이지에 정보를 등록합니다.
    document.getElementById('roadAddrPart1').value = roadAddrPart1;
    document.getElementById('addrDetail').value = addrDetail;
    document.getElementById('zipNo').value = zipNo;

    sessionStorage.setItem('roadAddrPart1', roadAddrPart1);
    sessionStorage.setItem('addrDetail', addrDetail);
    sessionStorage.setItem('zipNo', zipNo);

    // 디버깅 로그
    console.log("roadAddrPart1 set to: " + roadAddrPart1);
    console.log("addrDetail set to: " + addrDetail);
    console.log("zipNo set to: " + zipNo);}

	</script>


</body>
</html>
