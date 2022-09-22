<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>채팅방 틀</title>
    <script type="module" src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.esm.js"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css">
    <link rel="stylesheet" href="../resources/css/chatmodal.css">
</head>
<body>
    <div class="modalbackground">
        <div class="modalview">
            <div class="topbar">
                <ion-icon name="close-outline" class="xicon"></ion-icon>
            </div>
            <div class="content">
                <div class="profilediv">
                    <div class="requester">
                        <div class="profile">
                            에러 요청자 프로필 -> 프로필클릭 -> 그사람의 마이페이지로
                            <a href="mypage/myPage.html">프로필클릭!</a>
                        </div>
                        <div class="endcheck">
                            <input type="checkbox">체크하면 해결(채팅종료) <br>
                            <input type="checkbox">미해결 종료하기
                        </div>
                    </div>
                    <div class="solution">
                        <div class="profile">
                            에러 요청자 프로필 -> 프로필클릭 -> 그사람의 마이페이지로
                            <a href="mypage/myPage.html">프로필클릭!</a>
                        </div>
                        <div class="endcheck">
                            <input type="checkbox">체크하면 해결(채팅종료) <br>
                            <input type="checkbox">그만두기 <br> 
                            <input type="checkbox">신고
                        </div>
                    </div>
                </div>
                <!-- 게시글인데 채팅처럼 보이도록 한 것, 실시간 채팅은 아님 -->
                <div class="chating">
                    <div class="chat">
                        <ul class="chatmessage">
                            <!-- 내가 쓴 챗 -->
                            <li class="balloon right">
                                <div class="message-data align-right">
                                    <span class="message-data-time" >10:10 AM, Today</span> &nbsp; &nbsp;
                                    <span class="message-data-name" >Olia</span> <i class="fa fa-circle me"></i>
                                </div>
                                <div class="message other-message float-right">
                                    Hi Vincent, how are you? How is the project coming along?
                                </div>
                            </li>
                            <!-- 상대방이 쓴 챗 -->
                            <li class="balloon left">
                                <div class="message-data align-left">
                                    <span class="message-data-name"><i class="fa fa-circle online"></i> Vincent</span>
                                    <span class="message-data-time">10:12 AM, Today</span>
                                </div>
                                <div class="message my-message">
                                    Are we meeting today? Project has been already finished and I have results to show you.
                                </div>
                            </li>
                        </ul>
                    </div>
                    <div class="chatbar">
                        <input type="text" class="chatinput" placeholder="게시글작성">
                    </div>
                </div>
                <!-- ... -->
            </div>  
        </div>
    </div>
</body>
</html>