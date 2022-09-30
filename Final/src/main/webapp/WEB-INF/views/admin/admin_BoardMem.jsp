<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
                    <li><a href="/admin/report">신고관리</a></li>
                    <li><a href="/admin/board">게시판관리</a></li>
                    <li><a href="/admin/ask">1:1문의</a></li>
                </div>
            </div>

            <!-- 메인섹션 -->
            <div class="main">
                <!-- 관리자페이지 2022-08-22 bear 
                  여기서부터 작업하고 최종파일에 복붙하기 -->

                <div class="adminTitle">
                    <h2>게시판관리 (회원게시글)</h2>
                    <div class="adminNav">
                        <button class="removeBtn">선택삭제</button>
                    </div>
                </div>
                <div class="adminT">
                    <button class="admin_Boardbtn"><a href="/admin/board_mng">공지사항</a></button>
                    <button class="admin_Boardbtn"><a href="/admin/board_mem">회원 게시글</a></button>
                    <select name="" id="" class="Boardbtn_Slt">
                        <option value="">전체</option>
                        <option value="">일상</option>
                        <option value="">컬럼</option>
                        <option value="">스터디</option>
                        <option value="">커리어</option>
                    </select>
                    <button class="admin_BoardbtnClick">검색</button>
                    <br><br>
                    <h3 class="userBoardCount">${count}개의 게시글</h3>
                    <table border="1" class="admin_Customer">
                        <tr>
                            <td><input type="checkbox" name="" id=""></td>
                            <td class="adminBoard">No.</td>
                            <td class="adminBoard_Sel">구분</td>
                            <td class="adminBoard_Title">제목</td>
                            <td class="adminBoard_Add">등록자</td>
                            <td class="adminBoard_Date">등록일</td>
                            <td class="adminBoard">조회</td>
                        </tr>
                        <c:forEach var="row" items="${map}">
                        <tr>
                            <td class="adminBoard"><input type="checkbox" name="" id=""></td>
                            <td class="adminBoard">${row.Post_num}</td>
                            <td class="adminBoard">${row.Board_code}</td>
                            <td class="adminBoard_Title"><a href="/detail?Post_num=${row.Post_num}">${row.Post_title}</a></td>
                            <td class="adminBoard">${row.Post_writer}</td>
                            <td class="adminBoard">${row.Post_cr_date}</td>
                            <td class="adminBoard">${row.Post_view}</td>
                        </tr>
						</c:forEach>
						
                    </table>
                    <div class="admin_Paging">
                        <a href="#">이전</a>
                        <a href="#">1</a>
                        <a href="#">2</a>
                        <a href="#">3</a>
                        <a href="#">4</a>
                        <a href="#">5</a>
                        <a href="#">다음</a>
                    </div>
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