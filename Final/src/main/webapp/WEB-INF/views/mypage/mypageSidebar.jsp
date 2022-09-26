<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- 왼쪽 사이드 -->
	<div class="sideLeft">
		<div class="myList">
			<ul>
				<li>
					<div></div>
				</li>
				<li>
					<p>${sessionScope.User_nickname }</p>
					<p>#9877</p>
				</li>
				<li class="myli"><a href="/mypage/index">마이페이지</a></li>
				<li class="myli"><a href="/mypage/setUserInfo">개인정보</a></li>
				<li class="myli"><a href="/mypage/writer">나의 작성글</a></li>
				<li class="myli"><a href="/mypage/pay">결제 및 정산</a></li>
			</ul>
		</div>
	</div>
</body>
</html>