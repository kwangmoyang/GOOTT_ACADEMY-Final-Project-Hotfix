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
    <link rel="stylesheet" href="../../resources/css/ranking.css">
    <!-- 유니콘 아이콘 사이트 -->
    <link rel="stylesheet" href="https://unicons.iconscout.com/release/v4.0.0/css/line.css">
    <!-- 폰트어썸 아이콘 사이트 -->
   <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css">
    <title>HotFix</title>
</head>
<body>
           <%@ include file="/WEB-INF/views/header/header.jsp" %>
    
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
                <div class="rankingcontanier">

                    <div class="ranking_title">
                        <h1>개인 랭킹</h1>
                    </div>

                    <div class="ranking_category">
                        <ul> 
                         <li><a href="ranking.html">팀 랭킹</a></li>
                         <li><a href="ranking_indi.html">개인 랭킹</a></li>
                        </ul>
                     </div>
                    
                    <div class="ranking_nav">

                        <div class="ranking_nav_search">
                            <div class="search-box">
                                <form method="POST">
                                  <input class="search-txt" type="text" placeholder="검색어를 입력해 주세요" name="keyword" />
                                  <button type="submit" class="searchbtn"><i class="fa-solid fa-magnifying-glass"></i></button>
                                </form>
                            </div>
                        </div>

                        <div class="rankingtypediv">
                            <select name="" id="">
                                <option value="">활동점수순</option>
                                <option value="">해결건수순</option>
                                <option value="">커미션순</option>
                            </select>
                        </div>

                    </div>
                
                    <div class="rankingtopdiv">
                        <div class="rankingtop">1위</div>
                        <div class="rankingtop">2위</div>
                        <div class="rankingtop">3위</div>
                    </div>
                
                    <div class="rankingdiv">
                        <table>
                            <thead>
                                <td>순위</td>
                                <td>팀이름</td>
                                <td>활동점수</td>
                                <td>해결건수</td>
                                <td>누적 커미션</td>
                            </thead>
                            <!-- 50위까지 foreach로 -->
                            <tbody>
                                <td>4</td>
                                <td>구트아카데미</td>
                                <td>1.5k</td>
                                <td>3,200</td>
                                <td>1,000,000</td>
                            </tbody>
                            <tbody>
                                <td>5</td>
                                <td>구트아카데미</td>
                                <td>1.5k</td>
                                <td>3,200</td>
                                <td>1,000,000</td>
                            </tbody>
                            <tbody>
                                <td>6</td>
                                <td>구트아카데미</td>
                                <td>1.5k</td>
                                <td>3,200</td>
                                <td>1,000,000</td>
                            </tbody>
                            <!-- ... -->
                        </table>
                    </div>
                
                    <div class="rankingpaging">
                        페이징처리
                    </div>
                </div>    
                <!-- ==============작업공간============== -->
            </div>
        </div>
    </div>
        <!-- 푸터 -->
        <div class="common_footer">푸터임다 d </div>
    </body>
    <script src="../../resources/js/BasicFrame.js"></script>
    <!-- <script src="../resources/js/mypage_new_real.js"></script> -->
</html>