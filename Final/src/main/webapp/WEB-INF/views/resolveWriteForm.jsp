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
        <!-- 유니콘 아이콘 사이트 -->
        <link rel="stylesheet" href="https://unicons.iconscout.com/release/v4.0.0/css/line.css">
        <link rel="stylesheet" href="../resources/css/resolveWriteForm.css">
      
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
            <div class="boardWF_container">
                <div class="boardWF_title">
                    <h1>에러 해결 요청하기</h1>
                    <p>에러해결 요청을 통해 개발자들과 궁금증도 해결하는 시간 되세요</p>
                </div>
                <div class="WF_topic_box">
                    
                </div>
                <div class="WF_input_box">
                    <p>제목</p>
                    <input type="text" placeholder="제목을 입력하세요">
                </div>
                <div class="WF_detail_box">
                    <p>내용</p>
                    <form action="insertStudentInfoForm" method="post">
                        <div id="smarteditor">
                            <textarea name="editorTxt" id="editorTxt" rows="20" cols="100" placeholder="내용을 입력해주세요"
                                style="width: 100%"></textarea>
                        </div>
                </div>
                <div class="WF_input_box">
                    <p>모집 인원</p>
                    <input type="text" placeholder="모집 인원을 입력하세요">
                </div>
                <div class="WF_input_box">
                    <p>해결 커미션</p>
                    <input type="text" placeholder="해결 커미션을 입력하세요">
                </div>
                <div class="WF_input_box">
                    <p>모집 기한</p>
                    <input type="text" placeholder="모집 기한을 입력하세요">
                </div>
                <div class="boardWF_btn">
                    <button>취소</button>
                    <button>등록</button>
                </div>

                </form>
            </div>
        </div>

            
            <!-- ==============작업공간============== -->
        </div>



   
    </div>


    
    </div>
    <!-- 푸터 -->
    <div class="common_footer">푸터임다 d </div>

</body>

<script src="../resources/js/BasicFrame.js"></script>
<!-- <script src="../resource/js/mypage_new_real.js"></script> -->

</html>