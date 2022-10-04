<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
 <!-- 폰트어썸 아이콘 사이트 -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css">
<!-- 유니콘 아이콘 사이트 -->
<link rel="stylesheet" href="https://unicons.iconscout.com/release/v4.0.0/css/line.css">
<script type="module" src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.esm.js"></script>
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
						커미션 <i class="uil uil-question-circle"></i>
					</p>
					<div class="comition_1">
						<div>${Userinfolist[0].commission } 픽스</div>
						<div>
							<a href="#" class="a_btn">확인<i class="uil uil-angle-right-b"></i></a>
						</div>

					</div>

					<!-- 나의 해결률 -->
					<p class="mypage_title">해결요청 전적</p> 
					<div class="myHistory">
						<div>
						 총 해결요청수 ${RequesterAll }건 해결요청 수락율${RequesterAvg }%
						</div>
					</div>
					
					<p class="mypage_title">해결내역 전적</p>
          
					<div class="myHistory">
						<div>
						총 해결수 ${SolverAll }건 해결율${SolverAvg }%
						</div>
					</div>
          
					<!-- 나의 팀 -->
					<p class="mypage_title">팀정보</p>
					<div class="myTeam">
						
						<c:choose>
					      <c:when test="${sessionScope.Team_name != null }">
					      	<!-- 가입된 팀정보가 있을때 -->

					      	<div>${Userinfolist[0].Team_name }</div>
							    <div><a href="#">확인<i class="uil uil-angle-right-b"></i></a></div>
					      </c:when>
					      <c:when test="${teamnotmember != null}">
					      	<form action="/mypage/index" method="POST" id="teamnotmemberform" class="teamnotmemberform">
					      		<div>${teamnotmember} 팀 신청 취소하기</div>
					      		<input type="button" value="취소" onclick="teamnotmember()" class="teamnotmember_delete"/>
					      	</form>
					      </c:when>
					      <c:when test="${sessionScope.Team_name == null }">
					      	<!-- 가입된 팀정보가 없을때 -->
					      	<div>가입된 팀이없어요 ㅠ 팀에 속해 활동하면 더 높은 커미션을 받을수 있어요!</div>
							<div><a href="/teamlist">팀 둘러보기<i class="uil uil-angle-right-b"></i></a></div>
					      </c:when>
					   </c:choose>
					</div>

					<!-- 나의 활동점수 -->
					<p class="mypage_title">활동점수</p>
					<div class="myScore">
						<div>${Userinfolist[0].User_score } 점</div>
					</div>

					


				</div>


				<!-- ==============작업공간============== -->
			</div>




		</div>



	</div>
	<!-- 푸터 -->
	<div class="common_footer">푸터임다 d</div>


<!-- ===================================================팀정보 모달=====================================================-->

	<div class="modal-div">
	    <div id="teammodal-div">
	        <div id="team-navbar">
	            <div id="teamname"></div>
	            <div id="team-category">
	            	<c:choose>
	            		<c:when test="${sessionScope.Leader_auth eq 0}">
	            			<button class="teaminfo-btn">팀정보</button>
		            		<button class="teamsecession-btn">팀탈퇴</button>	
	            		</c:when>
	            		<c:when test="${sessionScope.Leader_auth eq 1}">
	            			<button class="teaminfo-btn">팀정보</button>
		            		<button class="teamsecession-btn">팀리더 탈퇴하기(팀리더가 탈퇴할 경우 팀 삭제됨)</button>	
	            		</c:when>
	            	</c:choose>	
	            </div>
	        </div>
	        <div id="team-content">
				
	        </div>
	    </div>
	    <ion-icon name="close-outline" id="xicon"></ion-icon>
	</div>
	
<!-- ====================================팀 탈퇴 모달====================================== -->

	<div class="modal4-div">
	    <div class="teammodal4-div">
	        <div class="toptitle3"><p>팀 탈퇴</p></div>
	        <div class="teamsecssioncheck"> <span></span> 팀을 탈퇴하시겠습니까?ㅠㅠ  </div>
	        <div class="team secssion-btn">
	           <button onclick="teamcheck3('${sessionScope.User_nickname}', '${sessionScope.Team_name}')">탈퇴하기</button>
	        </div>
	    </div>
	<ion-icon name="close-outline" id="xicon4"></ion-icon>
	</div>	

</body>

<script src="../../resources/js/BasicFrame.js"></script>
<script src="../../resources/js/mypage_new_real.js"></script>

</html>