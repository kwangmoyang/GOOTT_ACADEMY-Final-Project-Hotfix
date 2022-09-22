<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="../../resources/css/teamnotice.css">
    <link rel="stylesheet" href="../../resources/css/global.css">
     <!-- 폰트어썸 아이콘 사이트 -->
   <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css">
</head>
<body>
    팀공지사항틀 -> ajax처리할 것
    <div id="team-content">
        <div class="content-team-date">
            <table>
                <thead>
                    <td>번호</td>
                    <td>제목</td>
                    <td>작성자</td>
                    <td>작성일</td>
                </thead>
                <!-- foreach로 수정 -->
                <tbody>
                    <td><i class="fa-solid fa-fire"></i> <a href="">3</a></td>
                    <td><a href="../mypage/mypage.html" target="_blank"><i class="fa-solid fa-user"></i></a> <a href="../mypage/mypage.html" target="_blank">nickname</a></td>
                    <td>
                        <a href="">html</a>
                        <a href="">css</a>
                        <a href="">js</a>
                    </td>
                    <td><i class="fa-solid fa-crown"></i></td>
                </tbody>
                <!-- ... -->
            </table>
        </div>

        <div id="teammember-paging">
            <ul>
                <li>previous</li>
                <li>1</li>
                <li>2</li>
                <li>3</li>
                <li>next</li>
            </ul>
        </div>
    </div>
</body>
<script src="../../resources/js/teamnotice.js"></script>
</html>