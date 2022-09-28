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
    <link rel="stylesheet" href="../../resources/css/myPage_writer_request.css">
    <!-- 폰트 불러올라고-->
    <link rel="stylesheet" href="../../resources/css/global.css">
    <!-- 유니콘 아이콘 사이트 -->
    <link rel="stylesheet" href="https://unicons.iconscout.com/release/v4.0.0/css/line.css">
     <!-- 폰트어썸 사이트 -->
     <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css">
     <script src="http://code.jquery.com/jquery-3.6.0.min.js"></script>
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
                <div class="board_container">
                    <div class="board_title">
                        <h1>나의 작성글</h1>
                    </div>
                    <%@ include file="/WEB-INF/views/mypage/mypageWriterbar.jsp"%>

                    <div class="board_nav">
                        <button class="cancle">삭제하기</button>
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
                    <c:forEach var="row" items="${list}" varStatus="vs">
                    	
						<!-- 해결 게시판 -->
						<div class="RmBoard">
							<div class="RmBoardLeft">
								
								<p>해결요청!</p>
								<p>작성자 :${row.Requester}</p>
								<p>제목 : ${row.Request_title}</p>
							</div>
							<div class="RmBoardRight">
								<p>모집인원 : ${row.SolverReady_cnt}명</p>
								<p>커미션: ${row.Commission} 픽스</p>
								<p>남은 시간 : ${row.Recruiting_time}</p>
								<form id="Request_form" action="/mypage/writer_request" method="POST">
									<input type="hidden" name="Request_code" id="Request_code" value="${row.Request_code}">
									<button class="DetailModal" >상세보기</button>
								</form>
								
								
								 
							</div>
						</div>
						
					</c:forEach>
   

                </div>
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
            <h1>신청한 사람들!</h1>
            
			<c:forEach var="row" items="${resolver}" varStatus="vs">
            <div class="list">
                <p>신청자 ${row.Solver_member}님  전적 43%<input type="submit" value="전적보기">  
                <input type="submit" value="컨택하기">  </p>
            </div>
            </c:forEach>
        </div>
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
    let resolveform = document.querySelectorAll('#resolveform');
    
    //리퀘스트 코드
    let Request_code = document.querySelectorAll('#Request_code');
    let Request_codeform = document.querySelectorAll('#Request_codeform');
    console.log(Request_code);
    
    for (let i = 0; i < DetailModal.length; i++) {
    	//Request_codeform.addEventListener('submit', function(e){
        DetailModal[i].addEventListener('click', function(){

        modalOpen(); 
        
        	
        	
        });
        
       

    }
    

 document.querySelector('.RmModal_close').addEventListener('click', modalClose);

</script>
<script src="../../resources/js/BasicFrame.js"></script>
<script src="../../resources/js/mypage_new_real.js"></script>
<script src="../../resources/js/board.js"></script>

</html></html>