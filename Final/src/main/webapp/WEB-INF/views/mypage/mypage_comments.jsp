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
    <link rel="stylesheet" href="../../resources/css/myPage_comments.css">
    <!-- 폰트 불러올라고-->
    <link rel="stylesheet" href="../../resources/css/global.css">
    <!-- 유니콘 아이콘 사이트 -->
    <link rel="stylesheet" href="https://unicons.iconscout.com/release/v4.0.0/css/line.css">
    <!-- 폰트어썸 사이트 -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css">
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
            <div class="board_container">
                <div class="board_title">
                    <h1>나의 작성글</h1>
                </div>
                <div class="board_category">
                    <ul>
                        <li><a href="mypage_writer.html">작성글</a></li>
                        <li><a href="mypage_comments.html">댓글</a></li>
                        <li><a href="mypage_writer_request.html">해결요청 내역</a></li>
                        <li><a href="mypage_writer_result.html">해결중인</a></li>
                    </ul>
                 </div>

                <div class="board_nav">
                    <button class="cancle">댓글 삭제하기</button>
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
                        </select>
                    </div>
                   
                </div> 
                <!-- 게시글 삭제 박스 -->
                <p><input type="checkbox"></p>
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
                        <span> <a href="../board/detailBoard.html">Java 개념을 잘 모르겠습니다 알려주세요</a></span>
                    </div>
                    <div class="board_tag">
                        <span>#excel</span>
                        <span>#java</span>
                        <span>#js</span>
                    </div>
                </div> 
                <!-- 게시글 삭제 박스 -->
                <p><input type="checkbox"></p>
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
                        <span> <a href="../board/detailBoard.html">Lorem ipsum dolor sit, amet consectetur adipisicing elit. Reiciendis consequatur sunt excepturi ipsum incidunt deserunt itaque fugiat illo saepe, magnam facere voluptas. Consequatur, debitis! Accusantium mollitia animi eaque quo asperiores.</a> </span>
                    </div>
                    <div class="board_tag">
                        <span>#excel</span>
                        <span>#java</span>
                        <span>#js</span>
                    </div>
                </div> 
              
                  
                
                  
            </div>

            <div class="pageWrap">
                <!-- 페이지 넘기기 -->
                <div ng-app="DemoApp" flex layout="column">
                    <div flex ng-controller="MainController" layout="column">
                      <section layout="row" layout-padding="">
                        <cl-paging flex cl-pages="paging.total" , cl-steps="6" , cl-page-changed="paging.onPageChanged()" , cl-align="center center" , cl-current-page="paging.current"></cl-paging>
                      </section>
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
<script>

    let cancle = document.querySelector(".cancle");
    cancle.addEventListener('click',function(){
        if (confirm("정말 삭제하시겠습니까?") == true){ 
        //true는 확인버튼을 눌렀을 때 코드 작성
        console.log("완료되었습니다.");
        }else{
        // false는 취소버튼을 눌렀을 때, 취소됨
        console.log("취소되었습니다");
 }
    })
</script>
<script src="../../resources/js/BasicFrame.js"></script>
<script src="../../resources/js/mypage_new_real.js"></script>
<script src="../../resources/js/board.js"></script>

</html>