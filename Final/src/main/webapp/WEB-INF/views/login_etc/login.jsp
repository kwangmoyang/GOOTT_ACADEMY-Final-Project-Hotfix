<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- 유니콘 아이콘 사이트 -->
    <link rel="stylesheet" href="https://unicons.iconscout.com/release/v4.0.0/css/line.css">
    <title>login</title>
     <link rel="stylesheet" href="resources/css/login.css?after">
</head>

<body>
    <div class="login_Container">
        <div class="loginDiv">
            <div class="loginLogo">
                <img src="/resources/img/HOT.png" alt="" srcset="">
            </div>

            <div class="login_header">
                <h1>핫픽스에 오신것을 환영합니다.</h1>
            </div>

            <div class="login_Join">
                회원이 아니신가요? &nbsp;<a href="/view/login_etc/join.html">회원가입 하기</a>
            </div>
            <!-- ========== 로그인영역 ========== -->
            <form id="login_Form" method="POST" action="">

                <!-- 아이디 입력란 -->
                <div class="login_id">
                    <h4>아이디</h4>
                    <input type="text" name="hotID" id="hotID" placeholder="아이디를 입력해주세요" value="">
                    <p id="idalert"></p>
                </div>

                <!-- 비밀번호 입력란 -->
                <div class="login_pw">
                    <h4>비밀번호</h4>
                    <input type="password" name="hotPW" id="hotPW" placeholder="비밀번호를 입력해주세요" value="" autocomplete="on">
                    <p id="pwalert"></p>
                </div>

                <!-- 아이디 저장 및 찾기영역 -->
                <div class="login_Forgot">
                    <label><input type="checkbox" name="rememberId" ${empty cookie.id.value ? "" :"checked" }> 아이디
                        저장</label>
                    <a href="/view/login_etc/find_id.html">아이디 / 비밀번호 찾기</a>
                </div>

                <!-- 로그인 제출 영역 -->
                <div class="login_Btn">
                    <input type="button" id="login_submit" value="로그인">
                </div>
            </form>

            <div class="sns_header">
                <h4>SNS 간편 로그인</h4>
            </div>

            <!-- ========== SNS 로그인영역 ========== -->
            <form id="SNSlogin_Form" method="POST" action="">
                <div class="login_sns">
                    <li><a href=""><img src="resources/img/네이버 로고.png" alt="" srcset=""></a></li>
                    <li><a href=""><img src="resources/img/구글 로고.png" alt="" srcset=""></a></li>
                    <li><a href=""><img src="resources/img/카카오톡 로고 라운드.png" alt="" srcset=""></a></li>
                    <li><a href=""><img src="resources/img/깃허브 로고.png" alt="" srcset=""></a></li>
                </div>
            </form>
        </div>
    </div>
</body>

<script src="../../resources/js/login.js"></script>


</html>