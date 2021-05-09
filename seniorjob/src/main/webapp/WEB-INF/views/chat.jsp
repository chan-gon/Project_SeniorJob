<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="resources/chat/chat.css">
<style>
button {
	    background: papayawhip;
	    cursor: pointer;
	    box-sizing: border-box;
	    border: 2px solid #34495e;
	    position: relative;
	    overflow: hidden;
	}
</style>
</head>
<body>
	<div id="frm">
		<button type="button" onclick="openSocket()">대화방 참여</button>
		<button type="button" onclick="closeSocket()">대화방 나가기</button>
		<button type="button" onclick="clearText()">대화내용 지우기</button>	
		<br/><br/>
			
		<input type="text" id="sender" value="${sessionScope.id }" style="display: none">
		
		<!-- socket closed 됨 -->
	</div>
	<br><br>
	<div id="messages">
		<div id="realM">
			<!-- 메세지가 보이는 곳 -->
		</div>
	</div>
	<br>
		메세지 입력 :  <input type="text" id="messageinput">
		<button type="button" onclick="send()">메세지 전송</button>
			
	<script>
		//ws > websocket
		var ws;
		var message = document.getElementById("message");
		
		/* 소켓이 열려 있으면(대화 종료 x) 해당 내용 나옴 */
		function openSocket(){
			if(ws != undefined && ws.readyState !== WebSocket.CLOSED){
				writeResponse("WebSocket is already opened");
				return;
			}
			
			
			//웹소켓 객체 만드는 코드
			ws = new WebSocket("ws://192.168.0.56/echo");
			
			ws.onopen = function(event){
				if(event.data === undefined){
					return;
				}
				writeResponse(event.data);
			};
			
			ws.onmessage = function(event){
				console.log('writeResponse');
				console.log(event.data)
				writeResponse(event.data);
			};
			
			ws.onclose = function(event){
				writeResponse("대화 종료");
			}
		}
		/* 메세지 전송 */
		function send(){
			var text = document.getElementById("messageinput").value + "," + document.getElementById("sender").value;
			ws.send(text);
			text = "";
		}
		
		/* 대화 종료 */
		function closeSocket(){
			ws.close();
		}
		
		/* 대화 입력 */
		function writeResponse(text){
			realM.innerHTML += "<hr/>" + text;
		}
		
		/* 대화내용 지우기 */
		function clearText(){
			console.log(messages.parentNode);
			realM.innerHTML = '';
// 			messages.parentNode.removeChild(messages);
		}
	</script>
</body>
</html>