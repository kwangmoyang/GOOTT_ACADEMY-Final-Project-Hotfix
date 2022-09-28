<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<!-- 메인 프레임 연동-->
<link rel="stylesheet" href="../../resources/css/BasicFrame.css">
<link rel="stylesheet" href="../../resources/css/myPage_Set.css">
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

				<div class="myPage">
					<p class="myPage_titleText">${sessionScope.User_nickname } 님의 정보</p>
					<!-- 프로필사진 -->
					<p class="mypage_title">
						프로필사진 변경 <i class="uil uil-question-circle"></i>
					</p>
					<div class="comition_1">
						<div>
							<input type="file">
						</div>
						<div>
							<a href="">수정<i class="uil uil-angle-right-b"></i></a>
						</div>
					</div>
					<!-- 닉네임 -->

					<p class="mypage_title">
						닉네임 변경 <i class="uil uil-question-circle"></i>
					</p>
					<div class="comition_1">
						<div class="info_before">${sessionScope.User_nickname }</div>
						<div class="update_before">
							<button>수정</button>
						</div>

						<div class="formsection">
						
							<form action="/mypage/setok" class="form1" method="POST">
								<div class="info_after">
									<input type="hidden" name="User_id" id="" value="${sessionScope.User_id }">	
									<input type="text" name="User_nickname" id="" value="${sessionScope.User_nickname }">
								</div>
								<div class="update_after">
									<button class="update_submit">수정하기</button>
								</div>
							</form>
						</div>
					</div>

					<!-- 폰번호 수정 -->
					<p class="mypage_title">
						핸드폰번호 변경 <i class="uil uil-question-circle"></i>
					</p>
					<div class="comition_1">
						<div class="info_before">${sessionScope.Phone_num }</div>
						<div class="update_before">
							<button>수정</button>
						</div>

						<div class="formsection">
							<form action="/mypage/UserSetPhone_num" class="form1" method="POST">
								<div class="info_after">
								<input type="hidden" name="User_id" id="" value="${sessionScope.User_id }">	
									<input type="text" name="Phone_num" id="" value="${sessionScope.Phone_num }">
								</div>
								<div class="update_after">
									<button class="update_submit">수정하기</button>
								</div>
							</form>
						</div>
					</div>
					<!-- 이메일 수정 -->
					<p class="mypage_title">
						이메일 변경 <i class="uil uil-question-circle"></i>
					</p>
					<div class="comition_1">
						<div class="info_before">${sessionScope.Email_address }</div>
						<div class="update_before">
							<button>수정</button>
						</div>

						<div class="formsection">
							<form action="/mypage/UserSetEmail_address" class="form1" method="POST">
								<div class="info_after">
									<input type="hidden" name="User_id" id="" value="${sessionScope.User_id }">	
									<input type="text" name="Email_address" id="" value="${sessionScope.Email_address }">
								</div>
								<div class="update_after">
									<button class="update_submit">수정하기</button>
								</div>
							</form>
						</div>
					</div>
					<!-- 비번 수정 -->
					<p class="mypage_title">
						비밀번호 변경 <i class="uil uil-question-circle"></i>
					</p>
					<div class="comition_1">
						<div class="info_before">${sessionScope.User_pw }</div>
						<div class="update_before">
							<button>수정</button>
						</div>

						<div class="formsection">
							<form action="/mypage/setok" class="form1" method="POST">
								<div class="info_after">
									<input type="hidden" name="User_id" id="" value="${sessionScope.User_id }">	
									<input type="text" name="User_pw" id="" value="${sessionScope.User_pw }">
								</div>
								<div class="update_after">
									<button class="update_submit">수정하기</button>
								</div>
							</form>
						</div>
					</div>


					<!-- 자기소개 -->
					<p class="mypage_title">
						자기소개 수정 <i class="uil uil-question-circle"></i>
					</p>
					<div class="comition_1">
						<div class="info_before">${sessionScope.User_introduce }</div>
						<div class="update_before">
							<button>수정</button>
						</div>

						<div class="formsection">
							<form action="/mypage/UserSetUser_introduce" class="form1" method="POST">
								<div class="info_after">
									<input type="hidden" name="User_id" id="" value="${sessionScope.User_id }">	
									<input type="text" name="User_introduce" id="" value="${sessionScope.User_introduce }">
								</div>
								<div class="update_after">
									<button class="update_submit">수정하기</button>
								</div>
							</form>
						</div>
					</div>



					<!-- 컨택트 -->
					<p class="mypage_title">소셜정보</p>
					<div class="contact">
						<div class="info_before">
							<p>
								github : <span>ddd</span>
							</p>
							<p>
								home : <span>ddd</span>
							</p>
							<p>
								blog : <span>ddd</span>
							</p>
						</div>
						<div class="update_before">
							<button>수정</button>
						</div>

						<div class="formsection">
							<form action="/mypage/setok" class="form1" method="POST">
								<div class="info_after">
									<p>
										github : <span><input type="text" name="" id=""
											value="양광모1모"></span>
									</p>
									<p>
										home : <span><input type="text" name="" id=""
											value="양광모2모"></span>
									</p>
									<p>
										blog : <span><input type="text" name="" id=""
											value="양광모3모"></span>
									</p>
								</div>

								<div class="update_after">
									<button class="update_submit">수정하기</button>
								</div>
							</form>
						</div>

					</div>
					<!-- 계좌정보 -->
					<p class="mypage_title">
						계좌정보 변경 <i class="uil uil-question-circle"></i>
					</p>
					<div class="comition_1">
						<div class="info_before">dd</div>
						<div class="update_before">
							<button>수정</button>
						</div>

						<div class="formsection">
							<form action="" class="form1">
								<div class="info_after">
									<input type="text" name="" id="" value="양광모모">
								</div>
								<div class="update_after">
									<button class="update_submit">수정하기</button>
								</div>
							</form>
						</div>
					</div>
					<!-- 알림설정 -->
					<p class="mypage_title">
						알림 설정 <i class="uil uil-question-circle"></i>
					</p>
					<div class="comition_1">
						<div class="info_before">dd</div>
						<div class="update_before">
							<button>수정</button>
						</div>

						<div class="formsection">
							<form action="" class="form1">
								<div class="info_after">
									<input type="text" name="" id="" value="양광모모">
								</div>
								<div class="update_after">
									<button class="update_submit">수정하기</button>
								</div>
							</form>
						</div>
					</div>
					<!-- 탈퇴기능 -->
					<p class="mypage_title">
						탈퇴하기 <i class="uil uil-question-circle"></i>
					</p>
					<form method="POST" action="/UserDelete" id="UserOut">
					<div class="comition_1">
						<div class="bye_before">모든 정보삭제하고 탈퇴하기</div>
						<div class="btebtn_before">
							<input type="button" value="탈퇴하기" onclick="MemDeleteBtn()">
						</div>
					</div>
					</form>

				</div>

				<!-- ==============작업공간============== -->
			</div>




		</div>



	</div>
	<!-- 푸터 -->
	<div class="common_footer">푸터임다 d</div>

</body>

<script src="../../resources/js/BasicFrame.js"></script>
<script src="../../resources/js/mypage_new_real.js?after"></script>

</html>