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
    <link rel="stylesheet" href="../../resources/css/BasicFrame.css">
    <link rel="stylesheet" href="../../resources/css/global.css">
    <link rel="stylesheet" href="../../resources/css/admin.css?after">
    <!-- 유니콘 아이콘 사이트 -->
    <link rel="stylesheet" href="https://unicons.iconscout.com/release/v4.0.0/css/line.css">
    <link rel="icon" href="${Path}/resources/img/HotFavicon.png" type="image/png">
    <title>HOTFIX - Easy Solution For You</title>
    <script type="module" src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.esm.js"></script>
    <!-- 제이쿼리  -->
     <script src="http://code.jquery.com/jquery-3.6.0.min.js"></script>
    <title>HotFix_admin</title>
</head>

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
                    <h2>게시판관리 (공지사항)</h2>
                    <div class="adminNav">
                       <!-- <button class="removeBtn">선택삭제</button> -->
                        <input type="button" name="removeBtn" class="removeBtn" value="선택삭제" onclick="Bdlistremove()">
                        <button class="setBtn" onclick="location.href='/admin/write'">공지등록</button>
                    </div>
                </div>
                <div class="adminT">
                    <button class="admin_Boardbtn"><a href="/admin/board_mng">공지사항</a></button>
                    <button class="admin_Boardbtn"><a href="/admin/board_mem">회원 게시글</a></button>
                    <br>
                    <br>
                    <table border="1" class="admin_Customer">
                        <tr class="admin_Bdlist">
                            <th style="width: 3vw; height: 5vh; margin: 0 auto;"><input type="checkbox" name="Bdlist_allChBox" id="Bdlist_allChBox"></th>
                            <th>No.</th>
                            <th>제목</th>
                            <th>작성글</th>
                            <th>작성자</th>
                            <th>작성일</th>
                            <th>조회수</th>
                        </tr>
                        <c:forEach var="mng" items="${data}">
                        <tr class="notice_consent">
                            <td style="height: 40px;"><input type="checkbox" name="Bdlist_Ck" id="Bdlist_Ck" data-adminNt="${mng.Notice_num}"></td>
                            <td>${mng.Notice_num}</td>
                            <td style="text-align: left;" class="noticeCk" onclick="NoticeOn('${mng.Notice_contents}')">&nbsp;${mng.Notice_title}</td>
                            <td>${mng.Notice_contents}</td>
                            <td>${mng.Notice_writer}</td>
                            <td>
                            <fmt:parseDate value="${mng.Notice_cr_date}" pattern="yyyy-MM-dd'T'HH:mm:ss" var="ad_date" type="both"/>
                            <fmt:formatDate value="${ad_date}" pattern="yyyy-MM-dd HH:mm"/>
                            </td>
                            <td>${mng.Notice_status}</td>
                        </tr>
						</c:forEach>
                    </table>
                   <!-- <div class="admin_Paging">
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
    
<!-- ====================== 공지사항 모달창 ====================== -->
<div class="Notice_modal">
    <div class="Notice_modal2">
    	<div><ion-icon name="close-outline" id="Notice_xicon"></ion-icon></div>
        <div class="noticeTitle"><p>공지사항</p></div>
        <div class="noticeCont"><p></p></div>
        <div class="close_btn">
                <button>닫기</button>
        </div>
    </div>
</div>    
    
    
    

    <!-- 푸터 -->
    <div class="common_footer">푸터임다</div>

</body>

<script src="../../resources/js/BasicFrame.js"></script>
<script src="../../resources/js/admin.js"></script>

</html>