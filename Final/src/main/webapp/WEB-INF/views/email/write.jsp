<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h2>이메일 보내기</h2>
<form method="post" action="/email/send">
발신자 이름: <input name="senderName" value="${sessionScope.User_nickname }"><br>
발신자 이메일주소: <input name="senderMail" value="${sessionScope.Email_address }"><br>
수신자 이메일주소: <input name="receiveMail" value="zjqtm96@gmail.com"><br>
제목: <input name="subject"><br>
내용: <textarea rows="5" cols="80" name="message"></textarea><br>
<input type="submit" value="전송">
</form>
<span style="color:red">${message}</span>
</body>
</html>