<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="http://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
	
</script>

</head>
<body>
	<textarea id="detail_replytext">${dto.Comment_contents}</textarea>
	<div style="text-align: center">
		<!-- 색션에 등록된 닉네임과 댓글 쓴 사람과 동일 할때 -->
		<c:if test="${sessionScope.User_nickname == dto.Comment_writer }">
			<button id="btnReplyUpdate">수정</button>
		</c:if>
		<button id="btnReplyClose">닫기</button>
	</div>
</body>
</html>