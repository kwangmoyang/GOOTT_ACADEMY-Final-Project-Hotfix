<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="../../resources/css/mypageSidebar.css">
	<link rel="icon" href="${Path}/resources/img/HotFavicon.png" type="image/png">
<title>HOTFIX - Easy Solution For You</title>
</head>

<body>
	<!-- 왼쪽 사이드 -->
	<div class="sideLeft">
		<div class="myList">
			<ul>
				<li>
					<div class="userImg"><img src="../resources/img/${photo }"/></div>
				</li>
				<li>
					<p>${sessionScope.User_nickname }</p>
				</li>
				<li class="myli"><a href="/mypage/index">마이페이지</a></li>
				<li class="myli"><a href="/mypage/setUserInfo">개인정보</a></li>
				<li class="myli"><a href="/mypage/writer">나의 작성글</a></li>
				<li class="myli"><a href="/mypage/pay">결제 및 정산</a></li>
				<li class="myli"><a class="DetailModal_QA" >1:1 문의</a></li>
			</ul>
		</div>
	</div>
	
	
	<div class="RmModal_background_QA"></div>
    <div class="RmModal_wrap_QA">
        <div class="RmModal_close_QA"><i class="uil uil-x"></i></div>
        <!-- 모달 내용부분 -->
        <div class="ModalText_QA">
           	<h2>1:1 문의하기</h2><br>
           	<p>안녕하세요 ${sessionScope.User_nickname }님! 무엇을 도와드릴까요?</p><br>
           	<p>답변은 24시간 이내 가입할때 등록한 이메일로 회신될 예정입니다.</p>
				<form method="post" action="/email/send">
				<input type="hidden" name="senderName" value="${sessionScope.User_nickname }"><br>
				<input type="hidden" name="senderMail" value="${sessionScope.Email_address }"><br>
				<input type="hidden" name="receiveMail" value="aba9533@gmail.com"><br>
				<input name="subject" placeholder="문의 제목을 입력해주세요"><br><br>
				<textarea rows="5" cols="80" name="message" placeholder="문의 내용"></textarea><br><br>
				<input type="submit" value="전송">
				</form>
				<span style="color:red">${message}</span>
        </div>
	</div>
	
	<script>
	//1:1 문의 메일 전송 관련
	
	// 모달 열기
    function modalOpen_QA() {
        document.querySelector('.RmModal_wrap_QA').style.display = 'block';
        document.querySelector('.RmModal_background_QA').style.display = 'block';
    }
    // 모달 끄기
    function modalClose_QA() {
        document.querySelector('.RmModal_wrap_QA').style.display = 'none';
        document.querySelector('.RmModal_background_QA').style.display = 'none';
    }
    
  	//버튼 클릭리스너 달기
    let DetailModal_QA = document.querySelector('.DetailModal_QA');    
    DetailModal_QA.addEventListener('click', modalOpen_QA);
    
    document.querySelector('.RmModal_close_QA').addEventListener('click', modalClose_QA);
    
    
	</script>
	
	
	
	
</body>
</html>