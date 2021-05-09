<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html class="no-js">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>businessPlanInsert.jsp</title>
<meta name="description" content="company is a real-estate template">
<meta name="author" content="Kimarotec">
<meta name="keyword"
	content="html5, css, bootstrap, property, real-estate theme , bootstrap template">
<meta name="viewport" content="width=device-width, initial-scale=1">

<link
	href='http://fonts.googleapis.com/css?family=Open+Sans:400,300,700,800'
	rel='stylesheet' type='text/css'>

<!-- Place favicon.ico and apple-touch-icon.png in the root directory -->
<link rel="shortcut icon" href="favicon.ico" type="image/x-icon">
<link rel="icon" href="favicon.ico" type="image/x-icon">

<link rel="stylesheet" href="resources/assets/css/normalize.css">
<link rel="stylesheet" href="resources/assets/css/font-awesome.min.css">
<link rel="stylesheet" href="resources/assets/css/fontello.css">
<link
	href="resources/assets/fonts/icon-7-stroke/css/pe-icon-7-stroke.css"
	rel="stylesheet">
<link href="resources/assets/fonts/icon-7-stroke/css/helper.css"
	rel="stylesheet">
<link href="resources/assets/css/animate.css" rel="stylesheet"
	media="screen">
<link rel="stylesheet"
	href="resources/assets/css/bootstrap-select.min.css">
<link rel="stylesheet" href="resources/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" href="resources/assets/css/icheck.min_all.css">
<link rel="stylesheet" href="resources/assets/css/price-range.css">
<link rel="stylesheet" href="resources/assets/css/owl.carousel.css">
<link rel="stylesheet" href="resources/assets/css/owl.theme.css">
<link rel="stylesheet" href="resources/assets/css/owl.transitions.css">
<link rel="stylesheet" href="resources/assets/css/style.css">
<link rel="stylesheet" href="resources/assets/css/responsive.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>
function mentor(mentorId) {
	var frm = document.frm;
	var menId = mentorId;
	$('#mentorId').attr("value", menId);
	
	frm.submit();
	alert("첨삭요청이 완료되었습니다.");
}
</script>
<style>
th {
    text-align: center;
  }
  td {
    text-align: center;
  }
</style>
    </head>
<body>

					<h2>멘토링 코스 선택</h2>
					<hr>
					<br>
					
<form action="ckUpdate" method="post"  name="frm">
<input type="hidden" id="seq" name="seq" value="${seq }" />
<input type="hidden" id="mentorId" name="mentorId">
					
  <table border="1" align="center">
		<thead>
		<tr>
			<th width="250px">멘토링 코스명</th>
			<th width="120px">멘토</th>
			<th width="50px">선택</th>
		</tr>
		</thead>
		<tbody>
            <c:forEach items="${ck}" var="ck">
			<tr>
                <td>${ck.mentoring_name }</td>
				<td>${ck.mentor_id} </td>
				<td><a><button type="button" onclick="mentor('${ck.mentor_id}')">선택</button></a></td>
			</tr>
			</c:forEach>
		</tbody>
	</table>  
</form>


</body>
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

	<script
		src="https://maps.googleapis.com/maps/api/js?v=3.exp&amp;sensor=false"></script>
	<script src="resources/assets/js/gmaps.js"></script>
	<script src="resources/assets/js/gmaps.init.js"></script>

	<script src="resources/assets/js/main.js"></script>


</html>
