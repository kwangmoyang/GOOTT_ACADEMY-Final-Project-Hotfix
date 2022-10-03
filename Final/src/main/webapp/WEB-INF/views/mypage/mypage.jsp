<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<!-- 메인 프레임 연동-->
<link rel="stylesheet" href="../../resources/css/BasicFrame.css?after">
<link rel="stylesheet" href="../../resources/css/myPage_real.css?after">
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
			<%@ include file="/WEB-INF/views/mypage/mypageSidebar.jsp"%>

			<!-- 메인섹션 -->
			<div class="main">
				<!-- 
                *22-08-22 HIKARI
                *** 테스트시  <div class="main"> 하고 테스트 할 것
            -->
				<!-- ==============작업공간============== -->
				<!-- 마이 페이지부분 -->
				<!-- 마이 페이지부분 -->
				<div class="myPage">
					<p class="myPage_titleText">마이페이지</p>
					<!-- 자기소개 -->
					<p class="mypage_title">Introduce</p>
					<div class="introduce">
						<!-- 사진&자기소개&팔로잉 -->
						
						<img src="<%= request.getContextPath() + "C:\\Users/광트북/img/399f5015.png" %>"/>
						<div>
						
							<div class="introduce_nickname">
								<div class="name">${sessionScope.User_nickname }</div>
							</div>

							<div class="introduce_text">${sessionScope.User_introduce }</div>
						</div>
					</div>

					<!-- 컨택트 -->
					<p class="mypage_title">CONTACT</p>
					<div class="contact">
						<div>
							<ul>
								<button>
									<a href="${sessionScope.User_contact1 }" target="_blank"><i class="uil uil-home"></i></a>
								</button>
								<button>
									<a href="${sessionScope.User_contact2 }" target="_blank"><i class="uil uil-home"></i></a>
								</button>
								<button>
									<a href="${sessionScope.User_contact3 }" target="_blank"><i class="uil uil-home"></i></a>
								</button>
							</ul>
						</div>
						<div></div>
					</div>
					<!-- 커미션 -->
					<p class="mypage_title">
						님의 커미션 <i class="uil uil-question-circle"></i>
					</p>
					<div class="comition_1">
						<div>${sessionScope.commission } 픽스</div>
						<div>
							<a href="#">확인<i class="uil uil-angle-right-b"></i></a>
						</div>
					</div>

					<!-- 나의 해결률 -->
					<p class="mypage_title">님의 전적</p>
					<div class="myHistory">
						<div>해결 : 50 건 요청 : 100 건</div>
						<div>
							<a href="#">확인<i class="uil uil-angle-right-b"></i></a>
						</div>
					</div>

					<!-- 나의 팀 -->
					<p class="mypage_title">님의 팀정보</p>
					<div class="myTeam">
						
						<c:choose>
					      <c:when test="${sessionScope.Team_name != null }">
					      	<!-- 가입된 팀정보가 있을때 -->
					      	<div>${sessionScope.Team_name }</div>
							<div><a href="#">확인<i class="uil uil-angle-right-b"></i></a></div>
					      </c:when>
					      
					      <c:otherwise>
					      	<!-- 가입된 팀정보가 없을때 -->
					      	<div>가입된 팀이없어요 ㅠ 팀에 속해 활동하면 더 높은 커미션을 받을수 있어요!</div>
							<div><a href="/teamlist">팀 둘러보기<i class="uil uil-angle-right-b"></i></a></div>
					      </c:otherwise>
					   </c:choose>
					</div>

					<!-- 나의 활동점수 -->
					<p class="mypage_title">님의 활동점수</p>
					<div class="myScore">
						<div>현재활동점수</div>
						<div>
							<a href="#">확인<i class="uil uil-angle-right-b"></i></a>
						</div>
					</div>

					


				</div>


				<!-- ==============작업공간============== -->
			</div>




		</div>



	</div>
	<!-- 푸터 -->
	<div class="common_footer">푸터임다 d</div>

</body>

<script src="../../resources/js/BasicFrame.js"></script>
<script src="../../resources/js/mypage_new_real.js"></script>

</html>