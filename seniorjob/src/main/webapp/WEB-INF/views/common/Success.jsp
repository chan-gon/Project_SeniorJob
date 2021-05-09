<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>followDeleteSuccess</title>
</head>
<body>

<script>

	// Controller애서 설정된 Attribute값 받아서 출력

	var url = '${url}';
	var msg = '${msg}';
	alert(msg);
	location.href = url;
</script>

</body>
</html>