<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="../../resources/css/BasicFrame.css">
    <link rel="stylesheet" href="../../resources/css/global.css">
    <link rel="stylesheet" href="../../resources/css/admin.css">
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
                    <li><a href="admin.html">회원관리</a></li>
                    <li><a href="admin_Report.html">신고관리</a></li>
                    <li><a href="admin_Board.html">게시판관리</a></li>
                    <li><a href="admin_Ask.html">1:1문의</a></li>
                </div>
            </div>

            <!-- 메인섹션 -->
            <div class="main">
                <!-- 관리자페이지 2022-08-22 bear 
                  여기서부터 작업하고 최종파일에 복붙하기 -->

                <div class="adminTitle">
                    <h2>게시판관리</h2>
                    <div class="adminNav">
                        <button class="removeBtn">선택삭제</button>
                        <button class="setBtn">공지등록</button>
                    </div>
                </div>
                <div class="adminT">
                    <button class="admin_Boardbtn"><a href="admin_BoardMng.html">공지사항</a></button>
                    <!-- <button class="admin_Boardbtn"><a href="/view/admin/admin_BoardCus.html">회원 게시글</a></button> -->
                    <br>
                    <br>
                    <table border="1" class="admin_Customer">
                        <tr>
                            <td><input type="checkbox" name="" id=""></td>
                            <td>No.</td>
                            <td>구분</td>
                            <td>제목</td>
                            <td>등록자</td>
                            <td>등록일</td>
                            <td>조회</td>
                        </tr>
                        <tr>
                            <td><input type="checkbox" name="" id=""></td>
                            <td>10</td>
                            <td>긴급</td>
                            <td><a href="">서버점검안내</a></td>
                            <td>운영자1</td>
                            <td>2022-09-04</td>
                            <td>20</td>
                        </tr>
                        <tr>
                            <td><input type="checkbox" name="" id=""></td>
                            <td>9</td>
                            <td></td>
                            <td><a href=""></a></td>
                            <td></td>
                            <td></td>
                            <td></td>
                        </tr>
                        <tr>
                            <td><input type="checkbox" name="" id=""></td>
                            <td>8</td>
                            <td></td>
                            <td><a href=""></a></td>
                            <td></td>
                            <td></td>
                            <td></td>
                        </tr>
                        <tr>
                            <td><input type="checkbox" name="" id=""></td>
                            <td>7</td>
                            <td></td>
                            <td><a href=""></a></td>
                            <td></td>
                            <td></td>
                            <td></td>
                        </tr>
                        <tr>
                            <td><input type="checkbox" name="" id=""></td>
                            <td>6</td>
                            <td></td>
                            <td><a href=""></a></td>
                            <td></td>
                            <td></td>
                            <td></td>
                        </tr>
                        <tr>
                            <td><input type="checkbox" name="" id=""></td>
                            <td>5</td>
                            <td></td>
                            <td><a href=""></a></td>
                            <td></td>
                            <td></td>
                            <td></td>
                        </tr>
                        <tr>
                            <td><input type="checkbox" name="" id=""></td>
                            <td>4</td>
                            <td></td>
                            <td><a href=""></a></td>
                            <td></td>
                            <td></td>
                            <td></td>
                        </tr>
                        <tr>
                            <td><input type="checkbox" name="" id=""></td>
                            <td>3</td>
                            <td></td>
                            <td><a href=""></a></td>
                            <td></td>
                            <td></td>
                            <td></td>
                        </tr>
                        <tr>
                            <td><input type="checkbox" name="" id=""></td>
                            <td>2</td>
                            <td></td>
                            <td><a href=""></a></td>
                            <td></td>
                            <td></td>
                            <td></td>
                        </tr>
                        <tr>
                            <td><input type="checkbox" name="" id=""></td>
                            <td>1</td>
                            <td></td>
                            <td><a href=""></a></td>
                            <td></td>
                            <td></td>
                            <td></td>
                        </tr>

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