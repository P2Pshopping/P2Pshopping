<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<link href="text.css" rel="stylesheet" type="text/css">

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js" integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF" crossorigin="anonymous"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous"><meta name="viewport" content="width=device-width, initial-scale=1">
 <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<head>
<meta charset="UTF-8">
<title>비밀번호 찾기 </title>
</head>
<body>
<%@include file="../layout/Header.jsp"%>
    <div class= "find_form">
 <div class="row">
    <div class="col">
<a class="icon-link" href="FindId.jsp">
  아이디 찾기
  <svg class="bi" aria-hidden="true"></svg>
</a>
<a class="icon-link" href="FindPw.jsp">
  비밀번호 찾기
  <svg class="bi" aria-hidden="true"><use xlink:href="#arrow-right"></use></svg>
</a>
  </div>
  </div>
 </div>
 

	<div class="join_wrapper2">
		<div class="join_form2">
		<form action="<c:url value='/PwFind.do' />" method="post">
		<div class="row g-3">
	
    <div style = "magin-bottom:100px;">
    <h2 style ="magin-top:10px; font-size: 25px; ">  비밀번호 찾기  </h2>
    </div>
    <div class="mb-3 row">
   
    <div class="input-group mb-3" style="width: 600px;  margin-top:20px;">
    <label for="username" class="input-group-text fixed-width-label">아이디</label>
  
      <input type="text" class="form-control" name = "username" id="username" placeholder="아이디를 입력해주세요." maxlength="10">
     
      </div>
      </div>
   
      <div class="mb-3 row">
						<div class="input-group mb-3"style="width: 600px; ">
							<label for="name"class="input-group-text fixed-width-label">이름</label> 
								<input 	type="text" class="form-control" id="inputName" name="name"
								placeholder="성명을 입력해주세요." maxlength="5">
						</div>
					</div>
					
					<div class="mb-3 row" style="margin-bottom:10px;">
						<div class="input-group mb-3" style="width: 600px;margin-bottom:10px;">
							<label for="phone" class="input-group-text fixed-width-label">휴대전화</label>
							<!-- <div class="col-sm-10"> -->
								<input type="text" name="phone" class="form-control"
									id="phone" placeholder="전화 번호를 입력해주세요." maxlength="11"  oninput="formatDate(this)">
							<!-- </div> -->
						</div>
						
					</div>


</div>

   
  <div class="col align-self-center"
					style="margin-left: 440px; , margin-bottom: 5000px;">

					<button type="submit" class="btn btn-success" id="btn">비밀번호 찾기</button>

				</div>
</form>
  </div>
  </div>
 

	


<div style = "margin-top:25%;">
<%@include file="../layout/Footer.jsp"%>
</div>
<script>
$('#btn1').on('click', function() {
$.ajax({
    url: '/PwFind.do',  // 서블릿 URL
    method: 'POST',         // HTTP 메서드 (GET 또는 POST)
    data: {
        // 서블릿에 전달할 데이터
        password : password
    },
    dataType: 'text',       // 서블릿에서 반환되는 데이터 타입 (text, json 등)
    success: function(response) {
  
    	
    	/*      // 팝업 창 열기
        var popup = window.open('', 'Popup', 'width=300,height=200');

        // 팝업 창에 결과 출력
     
        popup.document.write('회원님의 비밀번호는');
        popup.document.write('<p>' + response + '</p>' +' 입니다.');  // 서블릿에서 받은 메시지 출력
        popup.document.write('<button onclick="window.close()">닫기</button>'); */
       
    },
    error: function() {
        // AJAX 호출 실패 시
        alert('서버 요청 실패');
    }
});
</script>
</body>
</html>














