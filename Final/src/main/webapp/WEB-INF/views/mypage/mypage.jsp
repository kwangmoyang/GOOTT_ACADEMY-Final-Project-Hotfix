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
    <link rel="stylesheet" href="../../resources/css/myPage_real.css">
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
                <!-- 자기소개 -->
                <p class="mypage_title">Introduce</p>
                <div class="introduce">
                    <!-- 사진&자기소개&팔로잉 -->
                    <div>img</div>
                    <div>
                        <div class="introduce_nickname">
                            <div class="name">
                                양광모 123
                            </div>
                            <div class="follow">
                                dd
                            </div>
                        </div>

                        <div class="introduce_text">
                            Lorem ipsum dolor sit amet consectetur adipisicing elit.
                            Odit dolorum odio praesentium explicabo nam in quidem possimus
                            sed impedit esse, nulla expedita dolore ipsa, distinctio architecto
                            maxime minima cumque tenetur?
                        </div>
                    </div>
                </div>

                <!-- 컨택트 -->
                <p class="mypage_title">CONTACT</p>
                <div class="contact">
                    <div>
                        <ul>
                            <li><i class="uil uil-home"></i></li>
                            <li><i class="uil uil-github"></i></li>
                            <li><i class="uil uil-blogger"></i></li>
                        </ul>
                    </div>
                    <div></div>
                </div>
                <!-- 커미션 -->
                <p class="mypage_title">님의 커미션 <i class="uil uil-question-circle"></i></p>
                <div class="comition_1">
                    <div>5000 포인트</div>
                    <div><a href="#">상세확인<i class="uil uil-angle-right-b"></i></a></div>
                </div>

                <!-- 나의 해결률 -->
                <p class="mypage_title">님의 전적</p>
                <div class="myHistory">
                    <div>해결 : 50 건 요청 : 100 건</div>
                    <div><a href="#">상세확인<i class="uil uil-angle-right-b"></i></a></div>
                </div>

                <!-- 나의 팀 -->
                <p class="mypage_title">님의 팀정보</p>
                <div class="myTeam">
                    <div>구트팀</div>
                    <div><a href="#">상세확인<i class="uil uil-angle-right-b"></i></a></div>
                </div>

                <!-- 나의 활동점수 -->
                <p class="mypage_title">님의 활동점수</p>
                <div class="myScore">
                    <div>현재활동점수</div>
                    <div><a href="#">상세확인<i class="uil uil-angle-right-b"></i></a></div>
                </div>

                <!-- 나의 주 언어 -->
                <p class="mypage_title">님의 주 언어</p>
                <div class="myLanguage">
                    ㅇㅇ
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