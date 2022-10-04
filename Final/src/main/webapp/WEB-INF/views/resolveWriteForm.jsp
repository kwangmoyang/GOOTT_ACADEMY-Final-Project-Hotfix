<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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

        <script type="text/javascript" src="<c:url value="/resources/ckeditor/ckeditor.js"/>"></script>
        <link rel="icon" href="${Path}/resources/img/HotFavicon.png" type="image/png">
      
        <title>HOTFIX - Easy Solution For You</title>
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
                
                <form method="POST" action="/resolveMainSubmit">
                
                <input type="hidden" name="Requester" value="${sessionScope.User_nickname}">
                <div class="WF_input_box">
                    <p>제목</p>
                    <input type="text" placeholder="제목을 입력하세요" name="Request_title">
                </div>
                <div class="WF_detail_box">
                    <p>내용</p>
                
                        <div id="smarteditor">
                            <textarea id="request" name="Request_contents"></textarea>
                            <script type="text/javascript">	// 글쓰기 editor 및 사진 업로드 기능
                            CKEDITOR.replace('request',
                                {filebrowserUploadUrl:'hotfix/imgUpload.do'
                                });
                            </script>
                        </div>

                </div>
                <div class="WF_input_box">
                    <p>모집 인원</p>
                    <input type="text" placeholder="모집 인원을 입력하세요" name="ReadySolver_cnt">
                </div>
                <div class="WF_input_box">
                    <p>해결 커미션</p>
                    <input type="text" placeholder="해결 커미션을 입력하세요" name="Commission">
                </div>
                <div class="WF_input_box">
                    <p>모집 기한</p>
                   <!--   <input type="text" placeholder="모집 기한을 입력하세요" name="Recruiting_time">-->
      
                </div>
                <div class="boardWF_btn">
                   <!--  <div class="hotfixCancleBtn">취소</div> -->
                    <button class="hotfixSubmitBtn" type="submit">등록</button>
                </div>
				</form>
                	
            </div>
        </div>

            
            <!-- ==============작업공간============== -->
        </div>



   
    </div>


    
   
    <!-- 푸터 -->
    <div class="common_footer">푸터임다 d </div>

</body>

<script>
let hotfixCancleBtn = document.querySelector(".hotfixCancleBtn");
let hotfixSubmitBtn = document.querySelector(".hotfixSubmitBtn");

hotfixCancleBtn.addEventListener('click',function(){
	location.href = "/resolveMain";

})

hotfixSubmitBtn.addEventListener('click',function(){
	hotfixSubmitBtn.submit();
	
})
</script>

<script src="../resources/js/BasicFrame.js"></script>
<!-- <script src="../resource/js/mypage_new_real.js"></script> -->

</html>