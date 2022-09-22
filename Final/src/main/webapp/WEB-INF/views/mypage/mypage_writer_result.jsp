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
    <link rel="stylesheet" href="../../resources/css/myPage_writer_result.css">
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
                    <p class="guide">요청자에게 채택을 받을 경우 해결중인 리스트에 요청내역이 표시됩니다!</p>

                    <div class="board_nav">
                        <button class="cancle">뭐넣지</button>
                        <div class="board_nav_search">
                            <div class="search">
                                <div class="search-box">
                                    <form method="POST">
                                      <input class="search-txt" type="text" placeholder="검색어를 입력해 주세요" name="keyword" />
                                      <button type="submit" class="searchbtn"><i class="fa-solid fa-magnifying-glass"></i></button>
                                    </form>
                                </div>
                            </div>
                        </div>
                        <div class="board_nav_btn">
                            <select name="">
                                <option value="">최신순</option>
                                <option value="">조회순</option>
                            </select>
                        </div>

                    </div>
                    <!-- 해결 게시판 -->
                    <div class="RmBoard">
                        <div class="RmBoardLeft">
                            <p>해결요청!</p>
                            <p>작성자 :peter</p>
                            <p>제목 : Java 컴파일 에러가 떴습니다 해결해주세요</p>
                        </div>
                        <div class="RmBoardRight">
                            <p>모집인원 : 5명</p>
                            <p>커미션: 500 FIx</p>
                            <p>남은 시간 : 3:00:00</p>
                            <button class="DetailModal">해결하러가기</button>
                        </div>
                    </div>
                    <div class="RmBoard">
                        <div class="RmBoardLeft">
                            <p>해결요청!</p>
                            <p>작성자 :peter</p>
                            <p>제목 : Java 컴파일 에러가 떴습니다 해결해주세요</p>
                        </div>
                        <div class="RmBoardRight">
                            <p>모집인원 : 5명</p>
                            <p>커미션: 500 FIx</p>
                            <p>남은 시간 : 3:00:00</p>
                            <button class="DetailModal">해결하러가기</button>
                        </div>
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

    <!-- 모달 -->
    <div class="RmModal_background"></div>
    <div class="RmModal_wrap">
        <div class="RmModal_close"><i class="uil uil-x"></i></div>
        <!-- 모달 내용부분 -->
        <div class="ModalText">
            여기에 채팅 화면 모달 띄우면됨
        </div>

</body>


<script>

    let cancle = document.querySelector(".cancle");
    cancle.addEventListener('click', function () {
        if (confirm("정말 삭제하시겠습니까?") == true) {
            //true는 확인버튼을 눌렀을 때 코드 작성
            console.log("완료되었습니다.");
        } else {
            // false는 취소버튼을 눌렀을 때, 취소됨
            console.log("취소되었습니다");
        }
    })

    // 모달 열기
    function modalOpen() {
        document.querySelector('.RmModal_wrap').style.display = 'block';
        document.querySelector('.RmModal_background').style.display = 'block';
    }

    // 모달 끄기
    function modalClose() {
        document.querySelector('.RmModal_wrap').style.display = 'none';
        document.querySelector('.RmModal_background').style.display = 'none';
    }


    //버튼 클릭리스너 달기
    let DetailModal = document.querySelectorAll('.DetailModal');

    for (let i = 0; i < DetailModal.length; i++) {
        DetailModal[i].addEventListener('click', modalOpen);
    }


    document.querySelector('.RmModal_close').addEventListener('click', modalClose);

</script>
<script src="../../resources/js/BasicFrame.js"></script>
<script src="../../resources/js/mypage_new_real.js"></script>
<script src="../../resources/js/board.js"></script>

</html>