<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>loginCheckAlert.jsp</title>
</head>
<body>

<!-- 화면 수정 https://codepen.io/DovydasLiniovas/pen/ZmQBzM -->

<h3>로그인 또는 회원가입이 필요합니다.</h3>
<input class="button btn largesearch-btn" value="로그인" type="button" onclick="goLoginForm()">
<input class="button btn largesearch-btn" value="회원가입" type="button" onclick="goJoinForm()">

<div class="notify"><span id="notifyType" class=""></span></div>

<script>

// 임시로 호출된 현재 창을 닫고 메인 창(부모창)에서 페이지 전환을 시키는 함수 설정
// 참고: https://lgzhyu3.tistory.com/51
	function goLoginForm(){
		opener.document.location.href = "login"; // 부모창을 해당 주소로 바꿈
		window.close(); // 현재 창 닫기
	}
	function goJoinForm(){
		opener.document.location.href = "insertUsers"; // 부모창을 해당 주소로 바꿈
		window.close(); // 현재 창 닫기
	}
</script>
</body>
</html>