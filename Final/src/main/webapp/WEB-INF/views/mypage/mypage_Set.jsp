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
    <link rel="stylesheet" href="https://unicons.iconscout.com/release/v4.0.0/css/line.css">
    <title>HotFix</title>
</head>

<body>
  <%@ include file="/WEB-INF/views/header/header.jsp" %>
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
            <p class="myPage_titleText">프로필 정보수정</p>
            <!-- 프로필사진 -->
            <p class="mypage_title">프로필사진 변경 <i class="uil uil-question-circle"></i></p>
            <div class="comition_1">
                <div><input type="file"></div>
                <div><a href="">수정<i class="uil uil-angle-right-b"></i></a></div>
            </div>
            <!-- 닉네임 -->
            <p class="mypage_title">닉네임 변경 <i class="uil uil-question-circle"></i></p>
            <div class="comition_1">
                <div><input type="text" name="" id="" value="양광모모"></div>
                <div><a href="">수정<i class="uil uil-angle-right-b"></i></a></div>
            </div>

            <!-- 폰번호 수정 -->
            <p class="mypage_title">핸드폰번호 변경 <i class="uil uil-question-circle"></i></p>
            <div class="comition_1">
                <div><input type="text" name="" id="" value="양광모모"></div>
                <div><a href="">수정<i class="uil uil-angle-right-b"></i></a></div>
            </div>
            <!-- 이메일 수정 -->
            <p class="mypage_title">이메일 변경 <i class="uil uil-question-circle"></i></p>
            <div class="comition_1">
                <div><input type="text" name="" id="" value="양광모모"></div>
                <div><a href="">수정<i class="uil uil-angle-right-b"></i></a></div>
            </div>
            
			<!-- 비번 수정 -->
            <p class="mypage_title">비밀번호 변경 <i class="uil uil-question-circle"></i></p>
            <div class="comition_1">
                <div><input type="text" name="" id="" value="ㄴㅁㅇㄴㅇ"></div>
                <div><a href="">수정<i class="uil uil-angle-right-b"></i></a></div>
            </div>


            <!-- 자기소개 -->
            <p class="mypage_title">자기소개 수정 <i class="uil uil-question-circle"></i></p>
            <div class="comition_1">
                <div><input type="text" name="" id="" value="학원댕깁니다"></div>
                <div><a href="">수정<i class="uil uil-angle-right-b"></i></a></div>
            </div>


            
            <!-- 컨택트 -->
            <p class="mypage_title">소셜정보</p>
            <div class="contact">
                <div>
                    <p>github <input type="text" name="" id=""></p>
                    <p>home <input type="text" name="" id=""></p>
                    <p>velog <input type="text" name="" id=""></p>
                </div>
                <div><a href="">수정<i class="uil uil-angle-right-b"></i></a></div>
            </div>
            <!-- 계좌정보 -->
            <p class="mypage_title">계좌정보 변경 <i class="uil uil-question-circle"></i></p>
            <div class="comition_1">
                <div>신한은행 110-427-341899</div>
                <div><a href="">수정<i class="uil uil-angle-right-b"></i></a></div>
            </div>
            <!-- 알림설정 -->
            <p class="mypage_title">알림 설정 <i class="uil uil-question-circle"></i></p>
            <div class="comition_1">
                <div>모든 알림끄기</div>
                <div><a href="">수정<i class="uil uil-angle-right-b"></i></a></div>
            </div>
            <!-- 탈퇴 -->
            <p class="mypage_title">탈퇴하기 <i class="uil uil-question-circle"></i></p>
            <div class="comition_1">
                <div>탈퇴시 회원의 모든정보가 삭제되며, 출금 처리를 끝내주셔아합니다</div>
                <div><a href="">탈퇴<i class="uil uil-angle-right-b"></i></a></div>
            </div>


        </div>
            
            <!-- ==============작업공간============== -->
        </div>



   
    </div>


    
    </div>
    <!-- 푸터 -->
    <div class="common_footer">푸터임다 d </div>

</body>

<script src="../../resources/js/BasicFrame.js"></script>
<script src="../../resources/js/mypage_new_real.js"></script>

</html>