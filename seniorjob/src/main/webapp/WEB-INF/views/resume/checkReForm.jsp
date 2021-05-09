<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>
function mentor(mentorId) {
	var frm = document.frm;
	var menId = mentorId;
	console.log(menId);
	$('#mentorId').attr("value", menId);
	
	frm.submit();
}
</script>
</head>
<body>
<h2>멘토링 코스 선택</h2>

<form action="ckReUpdateSom" method="post"  name="frm">
<input type="hidden" id="resume_no" name="resume_no" value="${resume_no }" />
<input type="hidden" id="mentorId" name="mentorId">
<c:forEach items="${ck}" var="ck">
<input type="button" onclick="mentor('${ck.mentor_id}')" value="${ck.mentoring_name }">
</c:forEach>

</form>
</body>
</html>