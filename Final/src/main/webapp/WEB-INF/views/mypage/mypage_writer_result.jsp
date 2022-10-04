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
    <link rel="icon" href="${Path}/resources/img/HotFavicon.png" type="image/png">
    <title>HOTFIX - Easy Solution For You</title>
</head>
<script>
	function list(page) {
		location.href="result?curPage="+page;
	}
</script>

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
                        <h1>${sessionScope.User_nickname } 님의 해결내역</h1>
                    </div>
                    
                    <%@ include file="/WEB-INF/views/mypage/mypageWriterbar.jsp"%>
                    
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
                    
                    <!-- 컨텍받지  못함 없어요 -->
               		<c:set var="name" value="${resolver2}" />
                	<c:if test="${empty name}">   
                		<p class="noPost">
                			해결중인 게시글이 없어요!<br><br>
                			활동점수를 높여보는건 어떨까요?
                		</p>
                	</c:if>
                    
                  	  해결내역 :${count}개
                    <!-- 해결 게시판 -->
                    <c:forEach var="row" items="${resolver2}" varStatus="vs">
                    <div class="RmBoard">
                        <div class="RmBoardLeft">   	
                        	<c:if test="${row.result == 0}">
                            <p class="ing">진행중</p>
                            </c:if>
                            <c:if test="${row.result == 1}">
                            <p class="okok">해결완료! 커미션을 확인해보세요</p>
                            </c:if>
                            
                            <p>요청자 :${row.Requester }</p>
                            <p>요청 내용 : ${row.Request_title }</p>
                        </div>
                        <div class="RmBoardRight">
                        	<c:if test="${row.result == 0}">
                            	<p>커미션: ${row.Commission } FIx</p>
                            	<button class="DetailModal">해결 포기(미구현)</button>
                            	<button class="DetailModal">채팅창 열기</button>
                            </c:if>
                            <c:if test="${row.result == 1}">
                            	<p>지급  커미션: ${row.Commission } FIx</p>
                            	<button class="DetailModal">해결한 내용 보기</button>
                            </c:if>
                        </div>
                    </div>
                    </c:forEach>
					<table>
						<tr>
							<td colspan="5" align="center" class="boardPagingTd"><c:if
									test="${page_info.curBlock > 1 }">
									<a href="javascript:list('1')">[처음]</a>
								</c:if> <c:if test="${page_info.curBlock > 1 }">
									<a href="javascript:list('${page_info.prevPage}')">[이전]</a>
								</c:if> <c:forEach var="num" begin="${page_info.blockBegin}"
									end="${page_info.blockEnd}">
									<c:choose>
										<c:when test="${num==page_info.curPage}">
											<span style="font-size: 25px; color: red">${num}</span>
										</c:when>
										<c:otherwise>
											<a href="javascript:list('${num}')">${num}</a>
										</c:otherwise>
									</c:choose>
								</c:forEach> <c:if test="${page_info.curBlock <= page_info.totBlock}">
									<a href="javascript:list('${page_info.nextPage}')">[다음]</a>
								</c:if> <c:if test="${page_info.curPage <= page_info.totPage}">
									<a href="javascript:list('${page_info.totPage}')">[끝]</a>
								</c:if></td>
						</tr>

					</table>




                </div>



            </div>


        </div>

        <!-- ==============작업공간============== -->
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