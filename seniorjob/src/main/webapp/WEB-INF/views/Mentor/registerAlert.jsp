<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>���� ��� ���� ������</title>
</head>
<body>

<!-- topHeader -->
<jsp:include page="${pageContext.request.contextPath}/WEB-INF/views/common/topHeader.jsp" />
<!-- topHeader -->

<script>
	var url = '${url}';
	var msg = '${msg}';
	alert(msg);
	location.href = url;
</script>

<!-- Footer area-->
<jsp:include page="${pageContext.request.contextPath}/WEB-INF/views/common/footer.jsp" />
<!-- Footer area-->

</body>
</html>