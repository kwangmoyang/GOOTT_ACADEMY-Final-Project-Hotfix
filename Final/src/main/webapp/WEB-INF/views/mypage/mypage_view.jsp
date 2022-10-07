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
					<p class="myPage_titleText">${mypageUserinfo.User_nickname} 님의 마이페이지 둘러보기</p>
					<!-- 자기소개 -->
					<p class="mypage_title">Introduce</p>
					<div class="introduce">
						<!-- 사진&자기소개&팔로잉 -->
						<div class="userImg"><img alt="미등록" src="../resources/img/${mypageUserinfo.IMG_File_name }"/></div>
						
						
						<div>
						
							<div class="introduce_nickname">
								<div class="name">${mypageUserinfo.User_nickname }</div>
							</div>

							<div class="introduce_text">${mypageUserinfo.User_introduce }</div>
						</div>
					</div>

					<!-- 컨택트 -->
					<p class="mypage_title">CONTACT</p>
					<div class="contact">
						<div>
							<ul>
								<button>
									<a href="${mypageUserinfo.User_contact1 }" target="_blank"><i class="uil uil-home"></i></a>
								</button>
								<button>
									<a href="${mypageUserinfo.User_contact2 }" target="_blank"><i class="uil uil-home"></i></a>
								</button>
								<button>
									<a href="${mypageUserinfo.User_contact3 }" target="_blank"><i class="uil uil-home"></i></a>
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
						<div>${mypageUserinfo.commission } 픽스</div>
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
					<p class="mypage_title">님의 팀정보</p>
					<div class="myTeam">
						
						<c:choose>
					      <c:when test="${mypageUserinfo.Team_name != null }">
					      	<!-- 가입된 팀정보가 있을때 -->
					      	<div class="mypage_teamname">${mypageUserinfo.Team_name }</div>
							<div class="teaminfo_modal"><span onclick="teaminfoFuc('${mypageUserinfo.Team_name}')" class="a_btn">확인<i class="uil uil-angle-right-b"></i></span></div>
					      </c:when>
					      
					      <c:otherwise>
					      	<!-- 가입된 팀정보가 없을때 -->
					      	<div>${mypageUserinfo.User_nickname}님은 가입된 팀이 없습니다.</div>
					      </c:otherwise>
					   </c:choose>
					</div>

					<!-- 나의 활동점수 -->
					<p class="mypage_title">님의 활동점수</p>
					<div class="myScore">
						<div>${mypageUserinfo.User_score } 점</div>
					</div>

				</div>
				<!-- ==============작업공간============== -->
			</div>

		</div>

	</div>
	<!-- 푸터 -->
	<%@ include file="/WEB-INF/views/footer.jsp" %>


<!-- ===================================================팀정보 모달=====================================================-->

	<div class="modal-div">
	    <div id="teammodal-div">
	        <div id="team-navbar">
	            <div id="teamname">${mypageUserinfo.Team_name}</div>
	            <div id="team-category">		
	            </div>
	        </div>
	        <div id="team-content">
				
	        </div>
	    </div>
	    <ion-icon name="close-outline" id="xicon"></ion-icon>
	</div>

</body>

<script src="../../resources/js/BasicFrame.js"></script>
<script src="../../resources/js/mypage_new_real.js"></script>

</html>