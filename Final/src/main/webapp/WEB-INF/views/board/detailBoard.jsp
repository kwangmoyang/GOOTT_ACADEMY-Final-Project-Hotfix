<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="../../resources/css/BasicFrame.css">
        <link rel="stylesheet" href="../../resources/css/myPage.css">
        <link rel="stylesheet" href="../../resources/css/global.css">
        <link rel="stylesheet" href="../../resources/css/detailBoard.css">
        <!-- 유니콘 아이콘 사이트 -->
        <link rel="stylesheet" href="https://unicons.iconscout.com/release/v4.0.0/css/line.css">
        <title>HotFix</title>
    </head>

<body>
  <%@ include file="/WEB-INF/views/header/header.jsp" %>

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
            
            <div class="detailBoard_container">
                <div class="detailSubTitle">
                    <span><i class="fas fa-feather-alt"></i></span>
                    <span>200<i class="fas fa-bolt"></i></span>
                    <span>나나콘</span>
                    <span>약 5시간전</span>
                </div>
                <div class="detailContent">
                    <h1>서로 다른 API 요청에 대한 java 전역변수 공유 여부</h1>
                    <p>회사 업무 중 php -> java 전환에 관련하여 고민중에 있는데요.</p>
                    <p>php 는 API 한개 요청당 한개의 프로세스를 사용하기 때문에 전역변수에 대한 걱정이 없었습니다.</p>
                    <p>제가 궁금한 점은 java 는 서로 다른 API 요청에 대해서 전역변수를 공유하나요? (멀티 스레드 환경이라?)</p>
                </div>
                <div class="detailTag">
                    <span>#excel</span>
                    <span>#java</span>
                    <span>#js</span>
                    <div class="detailLike">
                        <span class="Likedown"><i class="uil uil-angle-down"></i></span>
                        <span class="LikeCnt">0</span>
                        <span class="Likeup"><i class="uil uil-angle-up"></i></span>

                    </div>
                </div>

                <div class="detailCommentBox">
                    <span>9개의 댓글</span>
                    <textarea name="editorTxt" id="editorTxt" rows="10" cols="10" placeholder="내용을 입력해주세요"
                        style="width: 100%; height: 100%;"></textarea>
                    <button>댓글 쓰기</button>
                </div>
                <div class="detailSubTitle">
                    <span><i class="fas fa-feather-alt"></i></span>
                    <span>200<i class="fas fa-bolt"></i></span>
                    <span>나나콘</span>
                    <span>약 5시간전</span>
                    <div class="commentCon">
                        <p>세상에.. 요즘 프론트로 전향하고 싶어서 여기저기 알아보고 있었는데 좋은 글을 만났네요.. </p>
                        <p>감사합니다^^</p>
                    </div>
                </div>
                <div class="detailSubTitle">
                    <span><i class="fas fa-feather-alt"></i></span>
                    <span>200<i class="fas fa-bolt"></i></span>
                    <span>나나콘</span>
                    <span>약 5시간전</span>
                    <div class="commentCon">
                        <p>세상에.. 요즘 프론트로 전향하고 싶어서 여기저기 알아보고 있었는데 좋은 글을 만났네요.. </p>
                        <p>감사합니다^^</p>
                    </div>
                </div>
                <div class="detailSubTitle">
                    <span><i class="fas fa-feather-alt"></i></span>
                    <span>200<i class="fas fa-bolt"></i></span>
                    <span>나나콘</span>
                    <span>약 5시간전</span>
                    <div class="commentCon">
                        <p>세상에.. 요즘 프론트로 전향하고 싶어서 여기저기 알아보고 있었는데 좋은 글을 만났네요.. </p>
                        <p>감사합니다^^</p>
                    </div>
                </div>
                <div class="detail_btn">
                    <button onclick="location.href='/update?Post_num=${data.Post_num}'">수정</button>
                    <form method="POST" action="/delete">
                        <input type="hidden" name="Post_num" value="${data.Post_num}" />
                        <input type="submit" value="삭제" />
                    </form>
                </div>
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
<!-- <script src="..../../resources/js/mypage_new_real.js"></script> -->

</html>