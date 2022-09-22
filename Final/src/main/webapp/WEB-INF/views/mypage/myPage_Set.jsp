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
    <link rel="stylesheet" href="../../resources/css/myPage_set.css">
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
        <div class="sideLeft">
            <div class="myList">
                <ul>
                    <li>
                        <div>

                        </div>
                    </li>
                    <li>
                        <p>잉잉잉의</p>
                        <p>#9877</p>
                    </li>
                    <li class="myli"><a href="mypage.html">마이페이지</a></li>
                    <li class="myli"><a href="mypage_set.html">정보 수정</a></li>
                    <li class="myli"><a href="mypage_writer.html">나의 작성글</a></li>
                    <li class="myli"><a href="mypage_pay.html">결제 및 정산</a></li>
                </ul>
            </div>
        </div>
        <!-- 메인섹션 -->
        <div class="main">
            <!-- 
                *22-08-22 HIKARI
                *** 테스트시  <div class="main"> 하고 테스트 할 것
            -->
            <!-- ==============작업공간============== -->
           <!-- 마이 페이지부분 -->

           <div class="myPage">
                
            <!-- 프로필사진 -->
            <p class="mypage_title">프로필사진 변경 <i class="uil uil-question-circle"></i></p>
            <div class="comition_1">
                <div><input type="file"></div>
                <div>수정하기 <i class="uil uil-angle-right-b"></i></div>
            </div>
            <!-- 닉네임 -->
            <p class="mypage_title">닉네임 변경 <i class="uil uil-question-circle"></i></p>
            <div class="comition_1">
                <div><input type="text" name="" id="" value="양광모모"></div>
                <div>수정하기 <i class="uil uil-angle-right-b"></i></div>
            </div>
            <!-- 자기소개 -->
            <p class="mypage_title">자기소개 수정 <i class="uil uil-question-circle"></i></p>
            <div class="comition_1">
                <div><input type="text" name="" id="" value="학원댕깁니다"></div>
                <div>수정하기 <i class="uil uil-angle-right-b"></i></div>
            </div>


            
            <!-- 컨택트 -->
            <p class="mypage_title">소셜정보</p>
            <div class="contact">
                <div>
                    <p>github <input type="text" name="" id=""></p>
                    <p>home <input type="text" name="" id=""></p>
                    <p>velog <input type="text" name="" id=""></p>
                </div>
                <div>수정하기 <i class="uil uil-angle-right-b"></i></div>
            </div>
            <!-- 계좌정보 -->
            <p class="mypage_title">계좌정보 변경 <i class="uil uil-question-circle"></i></p>
            <div class="comition_1">
                <div>신한은행 110-427-341899</div>
                <div>수정하기 <i class="uil uil-angle-right-b"></i></div>
            </div>
            <!-- 알림설정 -->
            <p class="mypage_title">알림 설정 <i class="uil uil-question-circle"></i></p>
            <div class="comition_1">
                <div>모든 알림끄기</div>
                <div>수정하기 <i class="uil uil-angle-right-b"></i></div>
            </div>
            <!-- 탈퇴 -->
            <p class="mypage_title">탈퇴하기 <i class="uil uil-question-circle"></i></p>
            <div class="comition_1">
                <div>탈퇴시 회원의 모든정보가 삭제되며, 출금 처리를 끝내주셔아합니다</div>
                <div>기부하고 탈퇴하기 <i class="uil uil-angle-right-b"></i></div>
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