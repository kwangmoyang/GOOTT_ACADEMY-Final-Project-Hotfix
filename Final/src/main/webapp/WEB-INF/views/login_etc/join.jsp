<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="../../resources/css/join.css">
    <title>join</title>
</head>

<body>
    <div class="join_Container">
        <div class="join_Div">
            <div class="joinLogo">
                <img src="/resource/img/HOT.png" alt="" srcset="">
            </div>
            <div class="join_header">
                <h1>핫픽스에 오신것을 환영합니다.</h1>
            </div>
            <div class="join_Login">
                이미 회원이신가요? &nbsp;<a href="/view/login_etc/login.html">로그인 하기</a>
            </div>

            <!-- ========== 회원가입 정보입력 영역 ========== -->
            <form id="join_Form" method="POST" onsubmit="return checkNull();">
                <div class="join_id">
                    <h4>아이디</h4>
                    <input type="text" name="hotID" id="hotID" placeholder="영문, 숫자 조합 7~15자 이내">
                    <p id="hotID_alert"></p>
                </div>
                <div class="join_pw">
                    <h4>비밀번호</h4>
                    <input type="password" name="hotPW" id="hotPW" placeholder="영문, 숫자, 특수문자 조합 9자 이상">
                    <p id="hotPW_alert"></p>
                </div>
                <div class="join_pwcheck">
                    <h4>비밀번호 재확인</h4>
                    <input type="password" name="hotPW_Check" id="hotPW_Check" placeholder="비밀번호 재입력">
                    <p id="hotPWCK_alert"></p>
                </div>
                <div class="join_email">
                    <h4>이메일</h4>
                    <input type="email" name="hotEmail" id="hotEmail" placeholder="admin55@hotfix.kr">
                    <p id="hotEM_alert"></p>
                </div>
                <div class="join_name">
                    <h4>이름</h4>
                    <input type="text" name="hotName" id="hotName" placeholder="이름">
                    <p id="hotNM_alert"></p>
                </div>
                <div class="join_nickname">
                    <h4>닉네임</h4>
                    <input type="text" name="hotNick" id="hotNick" placeholder="특수문자 제외 2~20자 이내">
                    <p id="hotNK_alert"></p>
                </div>
                <div class="join_phone">
                    <h4>핸드폰번호</h4>
                    <input id="phone1" type="text" size="1" maxlength="3" oninput="changePhone1()"> -
                    <input id="phone2" type="text" size="3" maxlength="4" oninput="changePhone2()"> -
                    <input id="phone3" type="text" size="3" maxlength="4" oninput="changePhone3()">
                    <p id="hotPH_alert"></p>
                    <input id="phone_check" type="submit" value="인증번호 받기">
                    <input id="number_Write" type="text" name="" placeholder="인증번호를 입력하세요">
                    <input id="number_Check" type="button" value="확인">
                    <p id="hotPH_alert"></p>
                </div>

                <div class="join_consent">
                    <a href=""><span>&nbsp;서비스이용약관</span></a> |
                    <a href=""><span>개인정보처리방침</span></a>
                </div>

                <div class="join_Btn">
                    <input type="submit" id="join_submit" value="가입하기">
                </div>

            </form>

            <div class="sns_header">
                <h4>SNS 회원가입</h4>
            </div>

            <!-- ========== SNS 회원가입 영역 ========== -->
            <form id="SNSjoin_Form" method="POST">
                <div class="join_sns">
                    <li><a href=""><img src="../../resources/img/네이버 로고.png" alt="" srcset=""></a></li>
                    <li><a href=""><img src="../../resources/img/구글 로고.png" alt="" srcset=""></a></li>
                    <li><a href=""><img src="../../resources/img/카카오톡 로고 라운드.png" alt="" srcset=""></a></li>
                    <li><a href=""><img src="../../resources/img/깃허브 로고.png" alt="" srcset=""></a></li>
                </div>
            </form>
        </div>
    </div>
</body>

<script src="../../resources/js/join.js"></script>

</html>