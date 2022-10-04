<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>  
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
	<link rel="icon" type="image/png"  href="resources/images/svnicon.png"/> <!-- favicon fix -->
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<!-- jQuery, bootstrap CDN -->
	<script src="http://code.jquery.com/jquery-latest.min.js"></script>
	<script src="http://code.jquery.com/jquery-migrate-1.2.1.js"></script> <!-- msie 문제 해결 -->
	<script src="http://code.jquery.com/ui/1.11.4/jquery-ui.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/latest/js/bootstrap.min.js"></script>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/latest/css/bootstrap.min.css">
	<link rel="stylesheet" href="http://code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
	<!-- Zebra-Dialog CDN -->
	<script src="resources/js/dialog/zebra_dialog.src.js"></script>
	<link rel="stylesheet" href="resources/css/dialog/zebra_dialog.css" type="text/css"/>
	<!-- SocketJS CDN -->
	<script src="https://cdn.jsdelivr.net/npm/sockjs-client@1/dist/sockjs.min.js"></script>
	
	<title>HOTFIX</title>
</head>
<style>

.test{
    border: 1px solid #aaa;
    box-shadow: rgba(0, 0, 0, 0.24) 0px 0px 3px 0px;
    border-radius: 10px;
    width: 100%;
    height: 300px;
    overflow-y: auto;
}
.textdesign{
    width: 80%;
    height: 30px;
}
.sendBtndesign{
    background-color: crimson;
    border: 1px solid #aaa;
    box-shadow: rgba(0, 0, 0, 0.24) 0px 0px 3px 0px;
    border-radius: 10px;
    width: 15%;
    height: 40px;
    overflow:hidden;
}
</style>
<body>
	<div class="container">
		<h1>${User_nickname} 님과 해결중입니다.</h1>
		<p>채팅방을 닫게 되면 채팅내역이 사라지니 주의해주세요!</p>
		
		<br>
		<div>
			<div class="test">
			<div class="well" id="chatdata">
	    		<!-- User Session Info Hidden -->
	    		<input type="hidden" value='${User_nickname}' id="sessionuserid">
	    	</div>
	    	</div>
	    	<br>
	    	<div>
				<input type="text" class="textdesign" id="message"/>
	    		<input type="button" class="sendBtndesign" id="sendBtn" value="전송"/>
	    	</div>
		</div>
	</div>
</body>
<script type="text/javascript">
$(function(){
	$("#chattinglistbtn").click(function(){
	
		var infodialog = new $.Zebra_Dialog('<strong>Message:</strong><br><br><p>채팅방 참여자 리스트</p>',{
			title: 'Chatting List',
			type: 'confirmation',
			print: true,
			width: 260,
			buttons: ['닫기'],
			onClose: function(caption){
				console.dir(infodialog);
				if(caption == '닫기'){
					//alert('yes click');
				}
			}
		});
    });
});
</script>
<script type="text/javascript">
//websocket을 지정한 URL로 연결
//var sock= new SockJS("ws://localhost:8081/echo");
var sock= new SockJS("<c:url value="/echo"/>");
//websocket 서버에서 메시지를 보내면 자동으로 실행된다.
sock.onmessage = onMessage;
//websocket 과 연결을 끊고 싶을때 실행하는 메소드
//sock.onclose = onClose;

$(function(){
	$("#sendBtn").click(function(){
		console.log('send message...');
        sendMessage();
    });
});

$(function(){
	$("#message").keydown(function(key) {
		if( key.keyCode == 13 ){
			sendMessage();
			console.log('Enter');
		}
	});
});

	
function sendMessage(){      
	//websocket으로 메시지를 보내겠다.
	
  	sock.send($("#message").val());     
  
}
            
//evt 파라미터는 websocket이 보내준 데이터다.
function onMessage(evt){  //변수 안에 function자체를 넣음.

	var data = evt.data;
	var sessionid = null;
	var message = null;
	
	console.log("데이터에는?" + evt);
	//문자열을 splite//
	var strArray = data.split('');
	console.log("배열에는?11111111111111111111" + strArray);
	for(var i=0; i<strArray.length; i++){
		console.log(strArray[i]);
		console.log('str['+i+']: ' + strArray[i]);
	}
	
	//current session id//
	var currentuser_session = $('#sessionuserid').val();
	console.log('current session id: ' + currentuser_session);
	
	sessionid = strArray[0]; //현재 메세지를 보낸 사람의 세션 등록//
	message = strArray[1]; //현재 메세지를 저장//
	console.log("메세지 확인"+ message);
	console.log("메세지 확인"+ sessionid);
	//나와 상대방이 보낸 메세지를 구분하여 영역을 나눈다.//
	if(sessionid == currentuser_session){
		alert("????");
		let printHTML = "<div class='well'>";
		printHTML += "<div class='alert alert-info'>";
		printHTML += "<strong>["+currentuser_session+"] -> "+data+"</strong>";
		printHTML += "</div>";
		printHTML += "</div>";
		$("#chatdata").append(printHTML);
	} else{
		var printHTML = "<div class='well'>";
		printHTML += "<div class='alert alert-warning'>";
		printHTML += "<strong>["+currentuser_session+"] -> "+data+"</strong>";
		printHTML += "</div>";
		printHTML += "</div>";		
		$("#chatdata").append(printHTML);
	}
	
	console.log('chatting data: ' + data);
	
  	/* sock.close(); */
}
 /*   
function onClose(evt){
	alert("시펄");
	console.log(evt);
	$("#data").append("연결 끊김");
	sock.onerror = function(evt){

		  console.log(evt);


		}
}    */
</script>
</html>