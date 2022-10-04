<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
	<link rel="stylesheet" href="../../resources/css/global.css">
    <link rel="stylesheet" href="../../resources/css/ranking.css">
     <link rel="stylesheet" href="../resources/css/BasicFrame.css">
    <!-- modal css -->
   <link rel="stylesheet" href="${path}/resources/css/teammodal.css">
   <!-- 유니콘 아이콘 사이트 -->
   <link rel="stylesheet" href="https://unicons.iconscout.com/release/v4.0.0/css/line.css">
   <script type="module" src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.esm.js"></script>
   <!-- 폰트어썸 아이콘 사이트 -->
   <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css">
    <link rel="icon" href="${Path}/resources/img/HotFavicon.png" type="image/png">
    <title>HOTFIX - Easy Solution For You</title>
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
                        <h1>팀 커미션순 랭킹</h1>
                    </div>

                    <div class="ranking_category">
                        <ul>
                         <li><a href="RankingcountTeam">팀 활동점수순 랭킹</a></li>
                         <li><a href="/RankingcommissionTeam" style="color:red">팀 커미션순 랭킹</a></li>
                         <li><a href="/RankingcountUser">개인 활동점수순 랭킹</a></li>
                         <li><a href="/RankingcommissionUser">개인 커미션순 랭킹</a></li>
                        </ul>
                     </div>
                
                  <div class="rankingtopdiv">
                    <c:forEach var="row" items="${teamcommission}" begin="0" end="0">
	                         <div class="rankingtop">
                                    <i class="fa-solid fa-medal" id="medalgold"></i>
                                    <p><span>${row.rowNum}</span> 위</p>
                                    <div class="teamlogofile">
                                        <div class="rank_teamlogo_image"><img src="" alt=""></div>
                                    </div>
                                    <div class="rank_content">
                                        <span class="rank_title">팀 이름</span>
                                        <a onclick="teaminfoFuc('${row.Team_name}')" class="ranking_teaminfo"><span>${row.Team_name}</span></a><br>
                                        <span class="rank_title">팀 커미션</span><span>${row.Team_SUM}</span>
                                        <span class="rank_title">팀 활동점수</span><span>${row.Team_AVG}</span> <br>
                                    </div>
                             </div>
                    </c:forEach>
                    <c:forEach var="row" items="${teamcommission}" begin="1" end="1">
	                         <div class="rankingtop-gray">
                                    <i class="fa-solid fa-medal" id="medalgray"></i>
                                    <p><span>${row.rowNum}</span> 위</p>
                                    <div class="teamlogofile">
                                        <div class="rank_teamlogo_image"><img src="" alt=""></div>
                                    </div>
                                    <div class="rank_content">
                                        <span class="rank_title">팀 이름</span>
                                        <a onclick="teaminfoFuc('${row.Team_name}')" class="ranking_teaminfo"><span>${row.Team_name}</span></a><br>
                                        <span class="rank_title">팀 커미션</span><span>${row.Team_SUM}</span>
                                        <span class="rank_title">팀 활동점수</span><span>${row.Team_AVG}</span> <br>
                                    </div>
                             </div>
                    </c:forEach>
                    <c:forEach var="row" items="${teamcommission}" begin="2" end="2">
	                         <div class="rankingtop-dong">
                                    <i class="fa-solid fa-medal" id="medaldong"></i>
                                    <p><span>${row.rowNum}</span> 위</p>
                                    <div class="teamlogofile">
                                        <div class="rank_teamlogo_image"><img src="" alt=""></div>
                                    </div>
                                    <div class="rank_content">
                                        <span class="rank_title">팀 이름</span>
                                        <a onclick="teaminfoFuc('${row.Team_name}')" class="ranking_teaminfo"><span>${row.Team_name}</span></a><br>
                                        <span class="rank_title">팀 커미션</span><span>${row.Team_SUM}</span>
                                        <span class="rank_title">팀 활동점수</span><span>${row.Team_AVG}</span> <br>
                                    </div>
                             </div>
                    </c:forEach>
                    
                 </div>
                   
                	<div class="rankingdiv">
	                      <table>
	                            <thead>
	                                <td>순위</td>
	                                <td>팀이름</td>
	                                <td>팀 커미션</td>
	                                <td>팀 활동점수</td>
	                            </thead>
	                            <c:forEach var="row1" items="${teamcommission}" begin="3" end="9">
		                            <tbody>
		                                <td>${row1.rowNum} 위</td>
		                                <td>
		                                	<a onclick="teaminfoFuc('${row1.Team_name}')" class="ranking_teaminfo">${row1.Team_name}</a>
		                                </td>
		                                <td>${row1.Team_SUM}</td>
		                                <td>${row1.Team_AVG}</td>
		                            </tbody>
	                            </c:forEach>
	                      </table>
					</div>
                </div>    
                <!-- ==============작업공간============== -->
            </div>
        </div>
    </div>
    
<!-- ===================================================팀정보 모달=====================================================-->

	<div class="modal-div">
	    <div id="teammodal-div">
	        <div id="team-navbar">
	            <div id="teamname"></div>
	            <div id="team-category">		
	            </div>
	        </div>
	        <div id="team-content">
				
	        </div>
	    </div>
	    <ion-icon name="close-outline" id="xicon"></ion-icon>
	</div>    
    
</body>
<script src="../resources/js/BasicFrame.js"></script>
<script src="../resources/js/ranking.js"></script>
</html>