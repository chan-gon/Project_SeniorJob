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
    function detail(seq){
    var url ="replyDetailSom?seq="+seq;
    window.open(url,"","width=500,height=600");
    }
</script>
</head>
<body>
<h3>답변확인창</h3>
질문제목 : <input type="text" id="schedule_name" name="schedule_name" value="${vo.schedule_name }"><br/>
질문내용 : <input type="text" id="schedule_con" name="schedule_con" value="${vo.schedule_con }"><br/>
질문일시 : <input type="text" id="schedule_start" name="schedule_start" value="${vo.schedule_start }"><br/>
답변 : <input type="text" id="reply" name="reply" value="${vo.reply }"><br/>
답변자 : <input type="text" id="menName" name="menName" value="${menName }"><br/>
답변날짜 : <input type="text" id="schedule_end" name="schedule_end" value="${vo.schedule_end }"><br/>





</body>
</html>