<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
	<link rel="icon" href="${Path}/resources/img/HotFavicon.png" type="image/png">
    <title>HOTFIX - Easy Solution For You</title>
</head>
<script>
	function list(page) {
		location.href="writer_request?curPage="+page;
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
                        <h1>${sessionScope.User_nickname } 님의 해결요청 내역</h1>
                    </div>
                    <%@ include file="/WEB-INF/views/mypage/mypageWriterbar.jsp"%>

                    <div class="board_nav">
                        <button class="cancle">삭제하기</button>
                        <div class="board_nav_search">
                            <div class="search">
                                <div class="search-box">
                                  <%--  <form method="POST" id="test123">
                                      <input class="search-txt" type="text" placeholder="검색어를 입력해 주세요" name="keyword" />
                                      <button type="submit" class="searchbtn"><i class="fa-solid fa-magnifying-glass"></i></button>
                                    </form>--%>
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
                    
						 해결요청내역 : ${count}개 
					
                   	 
                    <!-- 요청한 내역이 없어요 -->
               		<c:set var="name" value="${list}" />
                	<c:if test="${empty name}">   
                		<p class="noPost">
                			해결요청한 내역이 없어요 !<br><br>
                			요청할 돈이 없으신가요?!
                			
                		</p>
                	</c:if>
                    
                    <c:forEach var="row" items="${list}" varStatus="vs">
						<!-- 해결 게시판 -->
						<div class="RmBoard">
							<div class="RmBoardLeft">
							<c:if test="${empty row.Solver}">  
								<p>컨텍을 진행해주세요!</p>
							</c:if>
							<c:if test="${row.Solver != null and row.result == 0}">  
								<p>${row.Solver} 님과 해결중입니다.</p>
							</c:if>	
							<c:if test="${row.result == 1}">  
								<p style="color: blue;">해결 완료된 게시글입니다!</p>
							</c:if>	
			
								<p>제목 : ${row.Request_title}</p>
								
							</div>
							<div class="RmBoardCenter">
							<c:if test="${row.Solver != null and row.result == 0}"> 
								<!-- 해결 완료시 -->
								<form action="/CompletionResolve" id="CompletionResolve" method="POST">
									<input type="hidden"  name=Request_code value="${row.Request_code}">
									<input type="hidden"  name=Requester value="${row.Requester}">
									<input type="hidden"  name="Solver" value="${row.Solver}">
									<input type="hidden"  name="Commission" value="${row.Commission}">
						            <input type="button"  class="ResultOk" value="해결완료!" onclick="CompletionResolve()">
					            </form>
					            <button class="ChatOpenBtn"  onclick="window.open('/chatting','window_name','width=800,height=500,location=center,status=no,scrollbars=yes');">채팅 열기</button>
					        </c:if>
        					</div>
							<div class="RmBoardRight">
								<p>모집인원 : ${row.SolverReady_cnt}명</p>
								<p>커미션: ${row.Commission} 픽스</p>
								<!--  <p>남은 시간 : ${row.Recruiting_time}</p>-->
								
								
							<!-- 해결자가 없을 경우 -->	
							<c:if test="${empty row.Solver}">  	
								<input type="hidden" id="Request_code" name="Request_code" value="${row.Request_code}">
								<button class="DetailModal" id="test">상세보기</button>
							</c:if>	
							<!-- 요청자가 포기를 했을경우 -->	
							<c:if test="${row.Solver != null and row.result == 0}">  
								<form action="/giveUpSolver" id="giveUpSolver" method="POST">
								<input type="hidden"  id="Request_code" name="Request_code" value="${row.Request_code}">
								<input type="button"  class="GiveUpBtn" value="포기하기" onclick="GiveUpBtn()">
								</form> 
							</c:if>
							</div>
							
						</div>
						
					</c:forEach>
   					<table class="boardPaging">
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
    </div>

    
    <!-- 푸터 -->
	 <%@ include file="/WEB-INF/views/footer.jsp" %>

	
    <!-- 모달 -->
    <div class="RmModal_background"></div>
    <div class="RmModal_wrap">
        <div class="RmModal_close"><i class="uil uil-x"></i></div>
        <!-- 모달 내용부분 -->
        <div class="ModalText">
            <h1>신청한 사람들!</h1>
            
			<!--<c:forEach var="row" items="${resolver}" varStatus="vs">-->
            
            <!--</c:forEach>-->
        </div>
	</div>
	
<script>
	
	let Request_code = document.querySelector("#Request_code");

	
	//해결완료 버튼
	function CompletionResolve(){
		let CompletionResolve = document.querySelector("#CompletionResolve");
        if (confirm("해결 완료를 누르시면 채팅은 종료되고 커미션이 해결자에게 지급됩니다!")){
            alert("해결을 축하드려요!");
            CompletionResolve.action = '/CompletionResolve';
            CompletionResolve.submit();
        }
        else {
            return false;
        }
	}
	
    //해결포기 버튼
	function GiveUpBtn(){
	    	let giveUpSolver = document.querySelector("#giveUpSolver");
	        if (confirm("포기 하실건가요? 모니터링으로 패널티를 부여 받을수도 있어요!.")){
	            alert("새로운 해결자를 컨텍해주세요!");
	            giveUpSolver.action = '/giveUpSolver';
	            giveUpSolver.submit();
	        }
	        else {
	        	alert("조금만 더 하면 해결할 수 있을거에요!");
	            return false;
	        }
	}
	
    // 모달 열기 함수
    function modalOpen() {
        document.querySelector('.RmModal_wrap').style.display = 'block';
        document.querySelector('.RmModal_background').style.display = 'block';
    }

    // 모달 닫기 함수
    function modalClose() {
        document.querySelector('.RmModal_wrap').style.display = 'none';
        document.querySelector('.RmModal_background').style.display = 'none';
    }


    //버튼 클릭리스너 달기
    let DetailModal = document.querySelectorAll('.DetailModal');
    let resolveform = document.querySelectorAll('#resolveform');
    
    
    
    //모달 닫는 x버튼 이벤트
    $(document).on('click', '.RmModal_close', function(){
    	console.log("새로불러옴");
    	modalClose();
    });
    
    
    for (let i = 0; i < DetailModal.length; i++) {
    	//Request_codeform.addEventListener('submit', function(e){
        DetailModal[i].addEventListener('click', function(e){

        	$.ajax({
                type:'POST',
                //headers:{"Content-Type":"application/json;charset=UTF-8"},
                //data: JSON.stringify({Request_code:Request_code}),
                data: {Request_code:DetailModal[i].previousSibling.previousSibling.defaultValue},
                url:"/mypage/writer_request2",
                //dataType:"text", 
                success: function(data){
                	console.dir(data);
                   
                    //setTimeout(modalOpen, 1000);
                    modalOpen();
                    
                    const RmModal_close = document.querySelector(".RmModal_close");
                    const ModalText = document.querySelector(".ModalText");
  
                    for(let i=0; i<data.length; i++){
                    	const div = document.createElement('div');
                    	const nick_input = document.createElement('input');
                    	const code_input = document.createElement('input');
                    	const input1 = document.createElement('input');
                    	const input2 = document.createElement('input');
                    	const h1 = document.createElement('h1');
                    	const form1 = document.createElement('form');
                    	
                    	nick_input.setAttribute('name','Solver');
                    	code_input.setAttribute('name','Request_code');
                    	
                    	div.setAttribute('class','list');
                    	input1.setAttribute('type','submit');
                    	input1.setAttribute('value','전적보기');
                    
                    	form1.setAttribute('method','post');
                    	form1.setAttribute('action','/choiceResolve');
                    	
                    	input2.setAttribute('type','submit');
                    	input2.setAttribute('value','컨택하기');
                    	
                    	
                    	//input2.setAttribute('onclick',"submit();");
                    	

                    	nick_input.value = data[i].Solver_member;
                    	code_input.value = data[i].Request_code;
                    	div.append(h1);
                    	div.append(nick_input);
                    	div.append(code_input);
                    	div.append(input1);
                    	div.append(input2);
                    	form1.append(div);
                    	
                    	ModalText.append(form1);
 						
                    	
                    	
                    }
                    RmModal_close.addEventListener('click',function(){
                    	$(".ModalText").empty();
                	})
                	
                	
                		
   
                },
                error:function(request,status,error){
                   console.log(request);
                   console.log(status);
   
                }
             }); 
    	});
    }

</script>
</body>
  




<script src="../../resources/js/BasicFrame.js"></script>
<script src="../../resources/js/mypage_new_real.js"></script>


</html>