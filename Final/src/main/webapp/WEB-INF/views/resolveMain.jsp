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
<link rel="stylesheet" href="../resources/css/resolveMain.css">
<!-- 유니콘 아이콘 사이트 -->
<link rel="stylesheet"
	href="https://unicons.iconscout.com/release/v4.0.0/css/line.css">
<!-- 폰트어썸 아이콘 사이트 -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css">
<title>HotFix</title>

</head>
<script>

   function list(page) {
    	  location.href="resolveMain?keyword=${keyword}&curPage="+page;
            
   }
   
   
</script>
<body>

	<%@ include file="/WEB-INF/views/header/header.jsp"%>


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
						<p>커미션을 걸고 에러 해결을 요청해보세요!</p>
						
					</div>
					
					<div class="RmSubtitle">
					
						<!-- 요청서 버튼  -->
						<div class="RmWriteRequest">
							<c:choose>
								<c:when test="${sessionScope.User_id == null }">
									<button type="button" onclick="alert('로그인을 진행해주세요'); ">요청하기</button>
								</c:when>

								<c:otherwise>
									<button type="button" onclick="location.href='/resolveWriteForm' ">요청하기</button>
								</c:otherwise>
							</c:choose>
							
						</div>

						<!-- 서치바 -->
						<div class="RmSearchbar">
							<div class="search">
								<div class="search-box">
									<!-- <form method="POST"> -->
										<input class="search-txt" type="text"
											placeholder="검색어를 입력해 주세요" name="keyword" />
										<button type="submit" class="searchbtn">
											<i class="fa-solid fa-magnifying-glass" id = "searchBtnI"></i>
										</button>
									<!-- </form> -->
								</div>
							</div>
						</div>

						<!-- 태그 버튼 -->
						<div class="Rmlist">
							<select name="search_option" id="search_option">
								<option value="new"
									<c:out value="${search_option == 'new' ? 'selected' : ''}"/>>최신순</option>
								<option value="com"
									<c:out value="${search_option == 'com' ? 'selected' : ''}"/>>커미션순</option>
							</select> 
						
					

						</div>
					</div>
					<span>${count}개의 해결 게시글</span>
`					
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
								
								<div class="DetailModal" onclick="document.getElementById('modal${vs.index}').style.display='block'">내용보기</div>
							</div>
						</div>

					</c:forEach>
					  <table>
         <tr>
            <td colspan="5" align="center" class ="boardPagingTd">
               <c:if test="${page_info.curBlock > 1 }">
                  <a href="javascript:list('1')">[처음]</a>
               </c:if> 
               <c:if test="${page_info.curBlock > 1 }">
                  <a href="javascript:list('${page_info.prevPage}')">[이전]</a>
               </c:if> 
               
               <c:forEach var="num" begin="${page_info.blockBegin}"
                  end="${page_info.blockEnd}">
                  <c:choose>
                     <c:when test="${num==page_info.curPage}">
                        <span style="font-size:25px; color:red"  >${num}</span>                                     
                     </c:when>
                        <c:otherwise>
                            <a href = "javascript:list('${num}')">${num}</a>
                        </c:otherwise>
                  </c:choose>
               </c:forEach>
               
               <c:if test="${page_info.curBlock <= page_info.totBlock}">
                  <a href="javascript:list('${page_info.nextPage}')">[다음]</a>
               </c:if> 
               <c:if test="${page_info.curPage <= page_info.totPage}">
                  <a href="javascript:list('${page_info.totPage}')">[끝]</a>
               </c:if> 
            </td>
         </tr>

   </table>
				</div>
				<!-- ==============작업공간============== -->
			</div>
		</div>
	</div>
	<!-- 푸터 -->
	<div class="common_footer">푸터임다</div>
	<!-- 모달 -->
	<div class="RmModal_background"></div>

	<!-- ==============모달공간============== -->
	
	<c:forEach var="row" items="${list}" varStatus="vs">
		<form method="POST" id="requestform">
		<div class="RmModal_wrap" id="modal${vs.index}">
			<div class="RmModal_close"
				onclick="document.getElementById('modal${vs.index}').style.display='none'">
				<i class="uil uil-x"></i>
			</div>
			<!-- 모달 내용부분 -->
			
			<div class="ModalText">
				<h1>해결요청!</h1>
				<div class="ModalHeader">
				
					
					<p>커미션 : ${row.Commission} 픽스</p>
					<p>모집인원 : ${row.SolverReady_cnt}명</p>
				</div>
				<div class="Modaltitle">
					<p>작성자 : ${row.Requester}</p>
					<p>제목 : ${row.Request_title}</p>
					<p>내용 : ${row.Request_contents}</p>
				</div>
				<div class="ModalCon"></div>
				<div class="ModalFooter">
					<p>모집 마감 : 2022. 09.08 목요일</p>
					<input type="text" name="User_nickname" value="${sessionScope.User_nickname}">
					<input type="text" name="Request_code" value="${row.Request_code}" >
                  	
					
					
						<button class="solutionSubmit">해결신청</button>
      				
				</div>
			</div>
			
		</div>
		</form>
	</c:forEach>
	
	<!-- ==============모달공간============== -->

</body>

<script src="../resources/js/BasicFrame.js"></script>
<script src="../resources/js/resolveMain.js"></script>


</html>