<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>시니어잡 / 멘토링 미리보기</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>
	window.onload = function(){
		document.getElementById('mentoring_name').value = opener.document.getElementById('mentoring_name').value;
		document.getElementById('mentoring_begin_date').value = opener.document.getElementById('mentoring_begin_date').value;
		document.getElementById('mentoring_end_date').value = opener.document.getElementById('mentoring_end_date').value;
		document.getElementsByName('mentoring_limit').value = opener.document.getElementsByName('mentoring_limit').value;
		document.getElementsByName('mentoring_photo').value = opener.document.getElementsByName('mentoring_photo').value;
		document.getElementsByName('mentoring_price').value = opener.document.getElementsByName('mentoring_price').value;
		};
</script>
</head>
<body>
  <div class="container">
    <h1>멘토링 등록</h1>
    <p>모든 빈칸을 채워주세요</p>
    <hr>
    
    <input type="hidden" name="mentor_id" id="mentor_id" value="${mentorInfo.mentor_id }">

    <label for="name"><b>멘토링 이름</b></label>
    <input type="text" placeholder="멘토링 이름" name="mentoring_name" id="mentoring_name" required>
	
	<label for="date"><b>멘토링 시작 날짜</b></label>
	<input type="date" placeholder="Enter Date" name="mentoring_begin_date" id="mentoring_begin_date" required>
	    
	<label for="date"><b>멘토링 종료 날짜</b></label>
	<input type="date" placeholder="Enter Date" name="mentoring_end_date" id="mentoring_end_date" required>
	
	<div id="m_numOfDays">
		<label for="date"><b>멘토링 기간</b></label>
		<input type="text" name="m_numOfDays" id="m_numOfDays" required> 일간 진행
	</div>

    <label for="psw-repeat"><b>정원</b></label>
    <input type="text" placeholder="멘토링 정원을 입력하세요" name="mentoring_limit" id="psw-repeat" required>
    <hr>

    <label for="psw"><b>내용</b></label>
    <textarea id="content" name="mentoring_content" rows="10" cols="90" style="height:200px; display:block; margin:15px; width:1345px"></textarea>
    
    <label for="psw"><b>멘토링 코스 이미지</b></label>
    <input type="file" placeholder="이미지를 등록하세요" name="mentoring_photo" id="psw" required>
    
    <label for="psw"><b>멘토링 금액</b></label>
    <input type="text" placeholder="금액을 입력하세요" name="mentoring_price" id="psw" required>
    
    <button type="submit" class="registerbtn">멘토링 등록하기</button>
    <button type="button" class="registerbtn" name="preview" id="preview">미리보기</button>
  </div>
  
  <div class="container signin">
    <p><a href="getMain">Home</a>.</p>
  </div>

	<script src="resources/assets/js/modernizr-2.6.2.min.js"></script>
	<script src="resources/assets/js/jquery-1.10.2.min.js"></script>
	<script src="resources/bootstrap/js/bootstrap.min.js"></script>
	<script src="resources/assets/js/bootstrap-select.min.js"></script>
	<script src="resources/assets/js/bootstrap-hover-dropdown.js"></script>
	<script src="resources/assets/js/easypiechart.min.js"></script>
	<script src="resources/assets/js/jquery.easypiechart.min.js"></script>
	<script src="resources/assets/js/owl.carousel.min.js"></script>
	<script src="resources/assets/js/wow.js"></script>
	<script src="resources/assets/js/icheck.min.js"></script>
	<script src="resources/assets/js/price-range.js"></script>
	<script src="resources/assets/js/main.js"></script>
</body>
</html>