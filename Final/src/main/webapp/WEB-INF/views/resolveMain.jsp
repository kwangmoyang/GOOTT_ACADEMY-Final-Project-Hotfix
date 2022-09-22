<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="../resources/css/BasicFrame.css">
    <link rel="stylesheet" href="../resources/css/myPage.css">
    <link rel="stylesheet" href="../resources/css/global.css">
    <link rel="stylesheet" href="../resources/css/resolveMain.css">
    <!-- 유니콘 아이콘 사이트 -->
    <link rel="stylesheet" href="https://unicons.iconscout.com/release/v4.0.0/css/line.css">
   <!-- 폰트어썸 아이콘 사이트 -->
   <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css">
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
                <!-- 전체컨테이너 -->
                <div class="RmContainer">
                    <!-- HOT FIX 제목 -->
                    <div class="RmHeader">
                        <h1>HOT FIX</h1>
                    </div>

                    <div class="RmSubtitle">
                        <!-- 요청서 버튼  -->
                        <div class="RmWriteRequest">
                            <button type="button" onclick="location.href='resolveWriteForm.html' ">요청서 작성</button>
                        </div>

                        <!-- 서치바 -->
                            <div class="RmSearchbar">
                                <div class="search">
                                    <div class="search-box">
                                        <form method="POST">
                                          <input class="search-txt" type="text" placeholder="검색어를 입력해 주세요" name="keyword" />
                                          <button type="submit" class="searchbtn"><i class="fa-solid fa-magnifying-glass"></i></button>
                                        </form>
                                    </div>
                                </div>
                            </div>

                        <!-- 태그 버튼 -->
                        <div class="Rmlist">
                            <select name="">
                                <option value="">최신순</option>
                                <option value="">커미션순</option>
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
                            <button class="DetailModal">상세보기</button>





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
                            <button class="DetailModal">상세보기</button>
                        </div>
                    </div>

                </div>

            
            
            <!-- ==============작업공간============== -->
        </div>



        </div>



    </div>
    <!-- 푸터 -->
    <div class="common_footer">푸터임다</div>
    <!-- 모달 -->
    <div class="RmModal_background"></div>
    <div class="RmModal_wrap">
        <div class="RmModal_close"><i class="uil uil-x"></i></div>
        <!-- 모달 내용부분 -->
        <div class="ModalText">
            <h1>해결요청!</h1>
            <div class="ModalHeader">
                <p>커미션 : 500Fix</p>
                <p>모집인원 : 5명</p>
            </div>
            <div class="Modaltitle">
                <p>작성자 : peter</p>
                <p>제목 : Java 컴파일 에러가 떴습니다 해결해주세요</p>
                <p>내용 : 아무리 찾아봐도 저 빨간줄 에러가 해결이 안됩니다 해결해주세요</p>
            </div>
            <div class="ModalCon">
                <img src="../resources/img/에러.png" alt="">
            </div>
            <div class="ModalFooter">
                <p>모집 마감 : 2022. 09.08 목요일</p>
                <button>해결신청</button>
            </div>
        </div>


</body>

<script src="../resources/js/BasicFrame.js"></script>
<!-- <script src="../resource/js/mypage_new_real.js"></script> -->
<script>

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
</html>