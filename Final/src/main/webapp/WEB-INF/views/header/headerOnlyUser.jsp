<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- 헤더 섹션 오른쪽 -->
	<div class="common_header_right">
		<!-- 마이페이지 -->
		<div class="user">
			<div></div>
			<ul>
				<li><a href="/mypage/index">마이페이지</a></li>
				<li><a href="/charge/index">충전하기</a></li>
				<li><a href="/logout/index">로그아웃</a></li>
				<c:choose>
				<c:when test="${sessionScope.admin_auth == 1}">
				<li><a href="/admin/index">관리자 페이지</a></li>			
				</c:when>
				</c:choose>
        <li><a href="/teamleader">팀 관리 페이지</a></li>	
			</ul>
		</div>
		<!-- 알림페이지 -->
		<div class="alarm">

			<div></div>
			<ul>
				<li><span>정산이 완료되었어요!</span><span>방금</span><span><i
						class="uil uil-angle-right-b"></i></span></li>
				<li><span>~님의 댓글이 달렸어요의 댓글이 달렸어요의 댓글이 달렸어요</span><span>어제</span><span><i
						class="uil uil-angle-right-b"></i></span></li>
				<li><span>충전이 완료되었어요!</span><span>1분전</span><span><i
						class="uil uil-angle-right-b"></i></span></li>
				<li><span>커미션지급이 완료되었어요!</span><span>1분전</span><span><i
						class="uil uil-angle-right-b"></i></span></li>
				<li><span>팀장 권한을 위임 받았어요!</span><span>1분전</span><span><i
						class="uil uil-angle-right-b"></i></span></li>
				<li><span>정산이 완료되었어요!</span><span>1분전</span><span><i
						class="uil uil-angle-right-b"></i></span></li>
				<li><span>정산이 완료되었어요!</span><span>1분전</span><span><i
						class="uil uil-angle-right-b"></i></span></li>
				<li><span>정산이 완료되었어요!</span><span>1분전</span><span><i
						class="uil uil-angle-right-b"></i></span></li>

			</ul>
		</div>
	</div>
</body>
</html>