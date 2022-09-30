<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<!-- 메인 프레임 연동-->
<link rel="stylesheet" href="../../resources/css/BasicFrame.css">
<link rel="stylesheet" href="../../resources/css/teamleader.css">
<!-- 폰트 불러올라고-->
<link rel="stylesheet" href="../../resources/css/global.css">
<!-- 유니콘 아이콘 사이트 -->
<link rel="stylesheet"
	href="https://unicons.iconscout.com/release/v4.0.0/css/line.css">
<title>HotFix</title>
</head>

<body>
	<%@ include file="/WEB-INF/views/header/header.jsp"%>
	<div class="container">
		<!-- ======================== 작업 섹션 ======================= -->
		<div class="common_section">
		<!-- 왼쪽 사이드 -->
		<%@ include file="/WEB-INF/views/team/teamSidebar.jsp"%>
			<!-- 메인섹션 -->
			<div class="main">
				<!-- 
                *22-08-22 HIKARI
                *** 테스트시  <div class="main"> 하고 테스트 할 것
            -->
				<!-- ==============작업공간============== -->
				<!-- 마이 페이지부분 -->

				<div class="myPage">
					 <input type="hidden" value="${sessionScope.Team_name}" name="session_teamname"/>
					 <div class="teammanagetitle">${sessionScope.Team_name}팀 관리 페이지</div>
					 
					 	<div class="teamcommission-div">
						 	<div class="teamcommission">
							 	현재 팀 총 활동점수 : 	 	
								 <c:if test="${map.teaminfo2.TeamScore ne 0}">
									 	${map.teaminfo2.TeamScore} 
								 </c:if>
								 <c:if test="${map.teaminfo2.TeamScore eq 0}">
									 	0
								 </c:if>	
						 	</div>
						 	<div class="teamcommission">
							 	현재 팀 총 커미션 : 
							 	<c:if test="${map.teaminfo2.Teampoint ne 0}">
							 		${map.teaminfo2.Teampoint} 
							 	</c:if>
							 	<c:if test="${map.teaminfo2.Teampoint eq 0}">
							 		0 
							 	</c:if>
						 	</div>
					 	</div>
					 
					 
					 	<div class="teammanage-twotitle">팀 정보수정</div>
						 	<div class="teammanage-box">
						        <p>공지사항 수정</p>
								 <form action="/teamnotice" method="POST">
								 		 <textarea name="teamnotice_correction" id="teamnotice_correction" cols="80" rows="10">${map.teaminfo.Team_notice}</textarea>
								  		<div>
								  			<input type="submit" value="수정" id="corbtn"/>
								  		</div>
								 </form>
					  		</div>
					  	<div class="teammanage-box">
					        <p>팀 이름 수정</p>
					        <form action="/teamnamecor" method="POST">
					        	<input type="text" value="${sessionScope.Team_name}" name="Team_name">
					        	<div>
					        		<input type="submit" value="수정" id="corbtn"/>
					        	</div>
					        </form>
					  	</div>
					    <div class="teammanage-box">
					        <p>팀 로고 수정</p>
					        <input type="file">
					    </div>
					 
					
					    <div class="teammanage-twotitle">팀 회원관리</div>
					    <div class="teammanage-box">
					        <p>팀 가입신청목록</p>
					        <ul>
					            <li>누구님이 팀가입신청을 보냈습니다. <input type="button" value="수락"><input type="button" value="거절"></li>
					        </ul>
					    </div>
						<div class="teammanage-box">
							<form action="/teammemberdel" method="POST">
						        <p>팀원 목록</p>
						        <ul>
						            <c:forEach var="row" items="${map.team_members}">
								            <input type="hidden" value="${row.User_nickname}" name="User_nickname"/>
								            <li>${row.User_nickname} <input type="submit" value="추방하기"></li>
						            </c:forEach>
						        </ul>
							</form>
						</div>
					    <div class="teammanage-box">
					        <p>팀리더 위임하기</p>
					        <p>현재 팀리더 : <input type="text" value="${sessionScope.User_nickname}"></p>
					    </div>	
				</div>
				<!-- ==============작업공간============== -->
			</div>

		</div>

	</div>
<!-- 푸터 -->
<div class="common_footer">푸터임다</div>

</body>

<script src="../../resources/js/BasicFrame.js"></script>
<script src="../../resources/js/teamleader.js?after"></script>

</html>