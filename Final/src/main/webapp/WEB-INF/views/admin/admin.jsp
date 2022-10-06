<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
    <title>HOTFIX - Easy Solution For You</title>
</head>

<script>
	function list(page) {
		location.href = "index?curPage=" + page;

	}
	
	
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
                    <li><a href="/admin/board_mng">게시판관리</a></li>
                   <!-- <li><a href="/admin/ask">1:1문의</a></li> -->
                </div>
            </div>

            <!-- 메인섹션 -->
            <div class="main">
                <!-- 관리자페이지 2022-08-22 bear 
                  여기서부터 작업하고 최종파일에 복붙하기 -->

                <div class="adminTitle">
                    <h2>회원관리</h2>
                   <!-- <button class="setBtn">선택삭제</button> -->
                </div>
                <div class="adminT">
                    <!-- <button class="admin_Membtn">전체목록</button> -->
                    <button class="admin_Membtn">총회원수</button><button class="Figure"> ${count}명</button>
                    <!-- <button class="admin_Membtn">차단</button><button class="Figure"> 3명</button> -->
                    <!-- <button class="admin_Membtn">탈퇴</button><button class="Figure"> 5명</button> -->
                    <br>
                    <br>
                    <table border="1" class="admin_Customer">
                        <tr class=admin_CustomerList>
                           <!-- <td><input type="checkbox" name="" id=""></td> -->
                            <td>이름</td>
                            <td>아이디</td>
                            <td>닉네임</td>
                            <td>이메일</td>
                            <td>핸드폰번호</td>
                            <td>가입일</td>
                            <td>활동점수</td>
                        </tr>
                        <c:forEach var="row" items="${map}">
                        <tr>
                           <!-- <td style="height: 40px;"><input type="checkbox" name="" id=""></td> -->
                            <td style="height: 40px;">${row.User_name}</td>
                            <td>${row.User_id}</td>
                            <td>${row.User_nickname}</td>
                            <td>${row.Email_address}</td>
                            <td>${row.Phone_num}</td>
                            <td>
                            <fmt:parseDate value="${row.SignDate}" pattern="yyyy-MM-dd'T'HH:mm:ss" var="ad_date" type="both"/>
                            <fmt:formatDate value="${ad_date}" pattern="yyyy-MM-dd"/>
                            </td>                          
                            <td><fmt:formatNumber value="${row.User_score}" pattern="#,###"/></td>
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
                    </div>
                </div>
                <!-- 여기까지 복붙라인 -->
                <!-- ==============작업공간============== -->
            </div>

        </div>

    </div>

    <!-- 푸터 -->
    <%@ include file="/WEB-INF/views/footer.jsp" %>

</body>

<script src="../../resources/js/BasicFrame.js"></script>
<script src="../../resources/js/admin.js"></script>

</html>