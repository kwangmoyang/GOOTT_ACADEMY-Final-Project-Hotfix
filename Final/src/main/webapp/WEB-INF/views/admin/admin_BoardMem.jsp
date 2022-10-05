<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>    

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="../../resources/css/BasicFrame.css?after">
    <link rel="stylesheet" href="../../resources/css/global.css?after">
    <link rel="stylesheet" href="../../resources/css/admin.css?after">
    <!-- 유니콘 아이콘 사이트 -->
    <link rel="stylesheet" href="https://unicons.iconscout.com/release/v4.0.0/css/line.css">
    <link rel="icon" href="${Path}/resources/img/HotFavicon.png" type="image/png">
    <!-- 제이쿼리  -->
     <script src="http://code.jquery.com/jquery-3.6.0.min.js"></script>
    <title>HOTFIX - Easy Solution For You</title>
</head>

<script>
	function list(page) {
		location.href = "board_mem?select=${search_option}&curPage=" + page;

	}
	$(function() {

		$("#searchBtnI").on("click", function() {
			
			
			 let select = $("select[name=search_option]").val()
			location.href = "board_mem?select="+select; 
			

		});	


	});
	
</script>

<body>

    <%@ include file="/WEB-INF/views/header/header.jsp" %>

    <div class="container">
        <!-- ======================== 작업 섹션 ======================= -->
        <div class="common_section">
            <!-- 왼쪽 사이드 -->
            <div class="sideLeft">
                <div class="adminList">
                    <li><a href="/admin/index">회원관리</a></li>
                   <!-- <li><a href="/admin/report">신고관리</a></li> -->
                    <li><a href="/admin/board">게시판관리</a></li>
                   <!-- <li><a href="/admin/ask">1:1문의</a></li> -->
                </div>
            </div>

            <!-- 메인섹션 -->
            <div class="main">
                <!-- 관리자페이지 2022-08-22 bear 
                  여기서부터 작업하고 최종파일에 복붙하기 -->
                <div class="adminTitle">
                    <h2>게시판관리 (회원게시글)</h2>
                    <div class="adminNav">
                       <!-- <button class="removeBtn">선택삭제</button> -->
                       <input type="button" name="removeBtn" class="removeBtn" value="선택삭제" onclick="removeValue()">
                    </div>
                </div>
                <div class="adminT">
                    <button class="admin_Boardbtn"><a href="/admin/board_mng">공지사항</a></button>
                    <button class="admin_Boardbtn"><a href="/admin/board_mem">회원 게시글</a></button>
                    <select name="search_option" id="search_option" class="Boardbtn_Slt">
								<option value="all"
									<c:out value="${search_option == 'all' ? 'selected' : ''}"/>>전체</option>
								<option value="life"
									<c:out value="${search_option == 'life' ? 'selected' : ''}"/>>일상</option>
								<option value="column"
									<c:out value="${search_option == 'column' ? 'selected' : ''}"/>>컬럼</option>
								<option value="study"
									<c:out value="${search_option == 'study' ? 'selected' : ''}"/>>스터디</option>
								<option value="career"
									<c:out value="${search_option == 'career' ? 'selected' : ''}"/>>커리어</option>
					</select>			
							
                    <button class="admin_BoardbtnClick" id="searchBtnI">검색</button>
                    <br><br>
                    <h3 class="userBoardCount">${count}개의 게시글</h3>
                    <table border="1" class="admin_Customer">
                        <tr>
                            <td><input type="checkbox" name="admin_allChBox" id="admin_allChBox"></td>
                            <td class="adminBoard">No.</td>
                            <td class="adminBoard_Sel">구분</td>
                            <td class="adminBoard_Title">제목</td>
                            <td class="adminBoard_Add">작성자</td>
                            <td class="adminBoard_Date">작성일</td>
                            <td class="adminBoard">조회수</td>
                        </tr>
                        <c:forEach var="row" items="${map}">
                        <tr>
                            <td class="adminBoard"><input type="checkbox" name="del_Abd" class="del_Abd" data-adminBd="${row.Post_num}"></td>
                            <td class="adminBoard">${row.Post_num}</td>
                            <td class="adminBoard">${row.Board_code}</td>
                            <td class="adminBoard_Title"><a href="/detail?Post_num=${row.Post_num}">${row.Post_title}</a></td>
                            <td class="adminBoard">${row.Post_writer}</td>
                            <td class="adminBoard">
                            <fmt:parseDate value="${row.Post_cr_date}" pattern="yyyy-MM-dd'T'HH:mm:ss" var="ad_date" type="both"/>
                            <fmt:formatDate value="${ad_date}" pattern="yyyy-MM-dd HH:mm"/>
                            </td>
                            <td class="adminBoard">${row.Post_view}</td>
                        </tr>
						          </c:forEach>
                    </table>
                    <br>
            <table class = "boardPaging">

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
                    

                    
                  <!--  <div class="admin_Paging">

                        <a href="#">이전</a>
                        <a href="#">1</a>
                        <a href="#">2</a>
                        <a href="#">3</a>
                        <a href="#">4</a>
                        <a href="#">5</a>
                        <a href="#">다음</a>
                    </div> -->
                </div>
                <!-- 여기까지 복붙라인 -->
                <!-- ==============작업공간============== -->
            </div>

        </div>

    </div>

    <!-- 푸터 -->
    <div class="common_footer">푸터임다</div>

</body>

<script src="../../resources/js/BasicFrame.js"></script>
<script src="../../resources/js/admin.js"></script>

</html>