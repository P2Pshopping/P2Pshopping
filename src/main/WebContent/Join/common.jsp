<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<script>
	function login() {
			var url = "/checkId?MEMBER_ID=" + document.Reg_form.id.value;
			var chk = document.Reg_form;
			if (chk.id.value == "") {
				alert("ID를 입력하세요");
				chk.id.focus();
				return false;
			}
			if (chk.id.value.length < 2) {
				alert("최소 2자리 이상 입력해주세요!");
				joinCheck.id.focus();
				return false;
			}
			open(url, "confirm", "toolbar=no,location=no,status=no,menubar=no,"
					+ "scrollbars=no,resizable=no,width=400,height=200");
		}
	

	function back() {
		history.go(-1);
	}

	function joinCheck() {
		var f = userForm;
		f.action = 'joinProcess.jsp';

		if (f.name.value.trim() == "") {

			alert("이름을 다시 한번 확인해주세요.")
			document.join.name.focus();
			return;
		}
		if (f.birth.value.trim() == "") {
			alert("생일을 다시 한번 확인해주세요.")
			document.join.birth.focus();
			return;

		}
		if (f.nickname.value.trim() == "") {
			alert("닉네임을 다시 한번 확인해주세요.")
			document.join.nickname.focus();
			return;

		}
		if (f.id.value.trim() == "") {
			alert("아이디를 다시 한번 확인해주세요.")
			document.join.id.focus();
			return;

		}
		if (f.pw.value.trim() == "") {
			alert("비밀번호를 다시 한번 확인해주세요.")
			document.join.pw.focus();
			return;

		}
		if (f.pwc.value.trim() == "") {

			alert("비밀번호를 다시 한번 확인해주세요.")
			document.join.pwc.focus();
			return;
		}
		if (f.phone.value.trim() == "") {

			alert("전화번호를 다시 한번 확인해주세요.")
			document.join.phone.focus();
			return;
		}
		if (f.address.value.trim() == "") {
			alert("주소를 다시 한번 확인해주세요.")
			document.join.address.focus();
			return;

		}

		if (f.pw.value != f.pwc.value) {
			alert('패스워드확인 오류입니다.');
			f.pwc.value = "";
			f.pwc.focus();
			return;

		}

		f.submit();

	}
</script>


