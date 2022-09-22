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

    <!-- 유니콘 아이콘 사이트 -->
    <link rel="stylesheet" href="https://unicons.iconscout.com/release/v4.0.0/css/line.css">
    <!-- 폰트어썸 사이트 -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css">
     <!-- paging -->
   <link rel='stylesheet' href='https://cdn.gitcdn.link/cdn/angular/bower-material/v1.1.0-rc.5/angular-material.css'>
    <link rel="stylesheet" href="../../resources/css/board.css">

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
            
            <div class="board_container">
                <div class="board_title">
                    <h1>일상</h1>
                </div>

                <div class="board_category">
                   <ul>
                    <li><a href="lifeBoard.html">일상</a></li>
                    <li><a href="columnBoard.html">칼럼</a></li>
                    <li><a href="studyBoard.html">스터디</a></li>
                    <li><a href="AnnoBoard.html">공지</a></li>
                   </ul>
                </div>


                <div class="board_nav">
                    <button onclick="location.href='boardWriteForm.html' ">작성하기</button>
                    <div class="board_nav_search">
                            <div class="search-box">
                                <form method="POST">
                                  <input class="search-txt" type="text" placeholder="검색어를 입력해 주세요" name="keyword" />
                                  <button type="submit" class="searchbtn"><i class="fa-solid fa-magnifying-glass"></i></button>
                                </form>
                            </div>
                    </div>
                     <div class="board_nav_btn">
                        <select name="">
                            <option value="">최신순</option>
                            <option value="">조회순</option>
                            <option value="">추천순</option>
                        </select>
                    </div>
                </div> 

                <div class="board_main">
                    <div class="board_header">
                        <div class="board_write">
                            <span><i class="fas fa-feather-alt"></i></span>
                            <span>200<i class="fas fa-bolt"></i></span>
                            <span>나나콘</span>
                            <span>약 5시간전</span>
                        </div>
                        <div class="board_view">
                            <span>0 조회수</span>
                            <span>1 추천수</span>
                        </div>
                    </div>
                    <div class="board_content">
                        <span> <a href="detailBoard.html">Java 개념을 잘 모르겠습니다 알려주세요</a></span>
                    </div>
                    <div class="board_tag">
                        <span>#excel</span>
                        <span>#java</span>
                        <span>#js</span>
                    </div>
                </div>   
                <div class="board_main">
                    <div class="board_header">
                        <div class="board_write">
                            <span><i class="fas fa-feather-alt"></i></span>
                            <span>200<i class="fas fa-bolt"></i></span>
                            <span>나나콘</span>
                            <span>약 5시간전</span>
                        </div>
                        <div class="board_view">
                            <span>0 조회수</span>
                            <span>1 추천수</span>
                        </div>
                    </div>  
                    <div class="board_content">
                        <span> <a href="detailBoard.html">Lorem ipsum dolor sit, amet consectetur adipisicing elit. Reiciendis consequatur sunt excepturi ipsum incidunt deserunt itaque fugiat illo saepe, magnam facere voluptas. Consequatur, debitis! Accusantium mollitia animi eaque quo asperiores.</a> </span>
                    </div>
                    <div class="board_tag">
                        <span>#excel</span>
                        <span>#java</span>
                        <span>#js</span>
                    </div>
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
<!-- <script src="../resources/js/mypage_new_real.js"></script> -->
<script src="../../resources/js/board.js"></script>



</html>