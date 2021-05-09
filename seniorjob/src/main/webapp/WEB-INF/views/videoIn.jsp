<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0">
<title>Insert title here</title>
<link rel="stylesheet" href="resources/webrtc/main.css" />
</head>
<body>
<div>테스트중입니다.</div>

 <h1>Realtime communication with WebRTC</h1>

  <div id="videos">
    <video id="localVideo" autoplay muted></video>
    <video id="remoteVideo" autoplay></video>
  </div>

  <script src="/socket.io/socket.io.js"></script>
  <script src="https://webrtc.github.io/adapter/adapter-latest.js"></script>
  <script src="resources/webrtc/videoMain.js" type="module"></script>
  <hr>
  <a href="mypageHome">돌아가기</a>
</body>
</html>