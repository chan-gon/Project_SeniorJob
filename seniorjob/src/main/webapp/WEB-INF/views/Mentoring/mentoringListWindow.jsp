<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
    <link rel="shortcut icon" href=http://www.freshdesignweb.com/wp-content/themes/fv28/images/icon.ico />
    <link rel="stylesheet" type="text/css" href="resources/mtListWindow/fdw-demo.css" media="all" />
    <link href='http://fonts.googleapis.com/css?family=Open+Sans+Condensed:700' rel='stylesheet' type='text/css'>
    <link rel="stylesheet" type="text/css" href="resources/mtListWindow/style.css">
</head>
<body>

<div class="freshdesignweb-top"><h1><a href="http://www.freshdesignweb.com">${mentor.usersVO.name}멘토님의 멘토링 목록</a></h1></div><div class="clr"></div>
<div class="freshdesignweb">    
<div class="clr"></div><br><br>

<!-- 멘토링 출력 -->
<div class="numberlist">
	 <form name="submitFrm" action="getSearchMentoringChanGon">
	 <ol>
	 <c:if test="${not empty mentoring }">
	 <c:forEach var="mt" items="${mentoring }">
	 <input type="hidden" id="mentor_id" name="mentor_id" value="${mt.mentor_id }">
	 <input type="hidden" id="mentoring_number" name="mentoring_number" value="${mt.mentoring_number }">
	 <input type="hidden" id="mentoring_kind" name="mentoring_kind" value="${mt.mentoring_kind }">
	  	<li><a href="#" onclick="getMentoring()">${mt.mentoring_name }</a></li>
	 </c:forEach>
	 </c:if>
	 
	 <c:if test="${empty mentoring }">
	 	<h3 style="text-align:center">- 등록된 멘토링이 없습니다 -</h3>
	 </c:if>
	 </ol>
	 </form>
</div>
<!-- End of 멘토링 출력 -->

</div><br>
<div class="clr"></div>
            <div class="freshdesignweb-buttom">
                <span class="right">
                    <a href="#" onclick="closeWindow()">닫기</a>
                </span>
                <div class="clr"></div>
            </div>
<script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
<script type="text/javascript">
var get_height = window.innerHeight; 
var get_height1 =  get_height - 0;
var get_container = document.getElementById('container');
get_container.style.height =  get_height1 + 'px';

  var _gaq = _gaq || [];
  _gaq.push(["_setAccount", "UA-10146041-18"]);
  _gaq.push(["_trackPageview"]);

  (function() {
    var ga = document.createElement("script"); ga.type = "text/javascript"; ga.async = true;
    ga.src = ("https:" == document.location.protocol ? "https://ssl" : "http://www") + ".google-analytics.com/ga.js";
    var s = document.getElementsByTagName("script")[0]; s.parentNode.insertBefore(ga, s);
  })();
  
function closeWindow(){
	window.close();
}
function getMentoring(){
	var mentor_id = $('input[name=mentor_id]').val();
	var mentoring_number = $('#mentoring_number').val();
	var mentoring_kind = $('#mentoring_kind').val();
	if(confirm("해당 멘토링 페이지로 이동하시겠습니까?")){
		opener.location.href = "getSearchMentoringChanGon?mentor_id="+mentor_id+"&mentoring_number="+mentoring_number+"&mentoring_kind="+mentoring_kind;
		window.close();
	}
}
</script>

</body>
</html>