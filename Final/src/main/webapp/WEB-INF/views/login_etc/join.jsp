<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<!DOCTYPE html>
<html lang="UTF-8">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="resources/css/join.css?after">
    <!-- 유니콘 아이콘 사이트 -->
    <link rel="stylesheet" href="https://unicons.iconscout.com/release/v4.0.0/css/line.css">
    <script type="module" src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.esm.js"></script>
    <link rel="icon" href="${Path}/resources/img/HotFavicon.png" type="image/png">
    <title>HOTFIX - Easy Solution For You</title>
</head>

<body>
    <div class="join_Container">
        <div class="join_Div">
            <div class="joinLogo">
                <img src="resources/img/HOT.png" alt="" srcset="" onclick="location.href='MainPage'">
            </div>
            <div class="join_header">
                <h1>핫픽스에 오신것을 환영합니다.</h1>
            </div>
            <div class="join_Login">
                이미 회원이신가요? &nbsp;<a href="/login">로그인 하기</a>
            </div>

            <!-- ========== 회원가입 정보입력 영역 ========== -->
            <form id="joinForm" name="join_Form" method="POST" >
                <div class="join_id">
                    <h4>아이디</h4>
                    <input type="text" name="User_id" id="hotID" placeholder="영문 또는 영문,숫자 조합 7~15자 이내">
                    <p id="hotID_alert">${idfalse }</p>
                </div>
                <div class="join_pw">
                    <h4>비밀번호</h4>
                    <input type="password" name="User_pw" id="hotPW" placeholder="영문, 숫자, 특수문자 조합 9자 이상">
                    <p id="hotPW_alert"></p>
                </div>
                <div class="join_pwcheck">
                    <h4>비밀번호 재확인</h4>
                    <input type="password" name="hotPW_Check" id="hotPW_Check" placeholder="비밀번호 재입력">
                    <p id="hotPWCK_alert"></p>
                </div>
                <div class="join_email">
                    <h4>이메일</h4>
                    <input type="text" name="Email_address" id="hotEmail_ID">@<input type="text" name="hotEmail_Add" id="hotEmail_Add">
                    <select name="email_sel" id="email_sel" onchange="hotDomain();">
                        <option value="">선택</option>
                        <option value="">직접입력</option>
                        <option value="naver.com">naver.com</option>
                        <option value="gmail.com">gmail.com</option>
                        <option value="daum.net">daum.net</option>
                    </select>
                    <p id="hotEM_alert"></p>
                </div>
                <div class="join_name">
                    <h4>이름</h4>
                    <input type="text" name="User_name" id="hotName" placeholder="이름">
                    <p id="hotNM_alert"></p>
                </div>
                <div class="join_nickname">
                    <h4>닉네임</h4>
                    <input type="text" name="User_nickname" id="hotNick" placeholder="특수문자 제외 2~12자 이내">
                    <p id="hotNK_alert">${nickfalse }</p>
                </div>
                <div class="join_phone">
                    <h4>핸드폰번호</h4>
                    <select name="phone1" id="phone1">
                        <option value="010">010</option>
                        <option value="011">011</option>
                    </select>
                    <input id="phone2" name="phone2" type="text" placeholder="- 빼고 입력하세요">
                    <!-- <p id="hotPH_alert"></p>
                    <input id="phone_check" type="submit" value="인증번호 받기">
                    <input id="number_Write" type="text" name="" placeholder="인증번호를 입력하세요">
                    <input id="number_Check" type="button" value="확인">
                    <p id="hotPH_alert"></p> -->
                </div>

                <div class="join_consent">
                    <input type="checkbox" id="clause">
                    <span id="agree">&nbsp;서비스이용약관</span>| 
                    <span>개인정보처리방침</span>
                    <p id="agreeRead"></p>
                    <!-- <a href=""><span id="agree">&nbsp;서비스이용약관</span></a> |
                    <a href=""><span>개인정보처리방침</span></a> -->
                </div>
                
                <div>
                <p id="agreeRead"></p>
                </div>

                <div class="join_Btn">
                    <input type="button" id="join_submit" onclick="joinForm_check();" value="가입하기">
                </div>

            </form>

	           <!-- <h4 class="sns_header">SNS 회원가입</h4>

             ========== SNS 회원가입 영역 ========== 
            <form id="SNSjoin_Form" method="POST">
                <div class="join_sns">
                    <li><a href=""><img src="resources/img/네이버 로고.png" alt="" srcset=""></a></li>
                    <li><a href=""><img src="resources/img/구글 로고.png" alt="" srcset=""></a></li>
                    <li><a href=""><img src="resources/img/카카오톡 로고 라운드.png" alt="" srcset=""></a></li>
                    <li><a href=""><img src="resources/img/깃허브 로고.png" alt="" srcset=""></a></li>
                </div>
            </form> -->
        </div>
    </div>


<!-- ====================== 서비스이용약관 모달창 ====================== -->
<div class="join_modal">
    <div class="join_modal2">
    	<div><ion-icon name="close-outline" id="join_xicon"></ion-icon></div>
        <div class="agreetitle"><p>서비스이용약관</p></div>
        <div class="agreecheck"><p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Optio doloribus ut beatae doloremque, perspiciatis quia quis fuga. Eveniet, libero similique. Laboriosam facilis dolor provident aperiam natus voluptatibus nesciunt quisquam perferendis?</p></div>
        <div class="agree_btn">
                <button>모두 동의합니다.</button>
        </div>
    </div>
</div>


</body>

<script src="resources/js/join.js"></script>

</html>