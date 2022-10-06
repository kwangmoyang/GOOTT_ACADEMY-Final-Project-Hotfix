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
                        <h1>개인 커미션순 랭킹</h1>
                    </div>
                    
                    <div class="ranking_category">
                        <ul>
                         <li><a href="RankingcountTeam">팀 활동점수순 랭킹</a></li>
                         <li><a href="/RankingcommissionTeam">팀 커미션순 랭킹</a></li>
                         <li><a href="/RankingcountUser">개인 활동점수순 랭킹</a></li>
                         <li><a href="/RankingcommissionUser" style="color:red">개인 커미션순 랭킹</a></li>
                        </ul>
                     </div>
                
                   <div class="rankingtopdiv">
                    <c:forEach var="row" items="${RankingcommissionUser}" begin="0" end="0">
	                         <div class="rankingtop">
                                    <i class="fa-solid fa-medal" id="medalgold"></i>
                                    <p><span>${row.rowNum}</span> 위</p>
                                    <div class="teamlogofile">
                                        <div class="rank_teamlogo_image"><img src="" alt=""></div>
                                    </div>
                                    <div class="rank_content">
                                        <span class="rank_title">유저 이름</span>
                                        <c:choose>
                                        	<c:when test="${sessionScope.User_id == null }">
                                        		<a target="_blank" class="ranking_teaminfo" onclick="alert('로그인 후 이용해주세요.')"><span>${row.User_nickname}</span></a> <br>
                                        	</c:when>
                                        	<c:otherwise>
                                        		<a href="/mypage_view?User_nickname=${row.User_nickname}" target="_blank" class="ranking_teaminfo"><span>${row.User_nickname}</span></a> <br>
                                        	</c:otherwise>
                                        </c:choose>
                                        <span class="rank_title">유저 커미션</span><span>${row.commission}</span><br>
                                        <span class="rank_title">유저 활동점수</span><span>${row.User_score}</span>
                                    </div>
                             </div>
                    </c:forEach>
                    <c:forEach var="row" items="${RankingcommissionUser}" begin="1" end="1">
	                         <div class="rankingtop-gray">
                                    <i class="fa-solid fa-medal" id="medalgray"></i>
                                    <p><span>${row.rowNum}</span> 위</p>
                                    <div class="teamlogofile">
                                        <div class="rank_teamlogo_image"><img src="" alt=""></div>
                                    </div>
                                    <div class="rank_content">
                                        <span class="rank_title">유저 이름</span>
                                        <c:choose>
                                        	<c:when test="${sessionScope.User_id == null }">
                                        		<a target="_blank" class="ranking_teaminfo" onclick="alert('로그인 후 이용해주세요.')"><span>${row.User_nickname}</span></a> <br>
                                        	</c:when>
                                        	<c:otherwise>
                                        		<a href="/mypage_view?User_nickname=${row.User_nickname}" target="_blank" class="ranking_teaminfo"><span>${row.User_nickname}</span></a> <br>
                                        	</c:otherwise>
                                        </c:choose>
                                        <span class="rank_title">유저 커미션</span><span>${row.commission}</span><br>
                                        <span class="rank_title">유저 활동점수</span><span>${row.User_score}</span>
                                    </div>
                             </div>
                    </c:forEach>
                    <c:forEach var="row" items="${RankingcommissionUser}" begin="2" end="2">
	                         <div class="rankingtop-dong">
                                    <i class="fa-solid fa-medal" id="medaldong"></i>
                                    <p><span>${row.rowNum}</span> 위</p>
                                    <div class="teamlogofile">
                                        <div class="rank_teamlogo_image"><img src="" alt=""></div>
                                    </div>
                                    <div class="rank_content">
                                        <span class="rank_title">유저 이름</span>
                                        <c:choose>
                                        	<c:when test="${sessionScope.User_id == null }">
                                        		<a target="_blank" class="ranking_teaminfo" onclick="alert('로그인 후 이용해주세요.')"><span>${row.User_nickname}</span></a> <br>
                                        	</c:when>
                                        	<c:otherwise>
                                        		<a href="/mypage_view?User_nickname=${row.User_nickname}" target="_blank" class="ranking_teaminfo"><span>${row.User_nickname}</span></a> <br>
                                        	</c:otherwise>
                                        </c:choose>
                                        <span class="rank_title">유저 커미션</span><span>${row.commission}</span><br>
                                        <span class="rank_title">유저 활동점수</span><span>${row.User_score}</span>
                                    </div>
                             </div>
                    </c:forEach>
                   </div>
                
					<div class="rankingdiv">
	                    <table>
	                       <thead>
							  <td>순위</td>
	                          <td>유저 이름</td>
	                          <td>유저 커미션</td>
	                          <td>유저 활동점수</td>
	                       </thead>
							<c:forEach var="row1" items="${RankingcommissionUser}" begin="3" end="9">
		                       <tbody>
		                           <td>${row1.rowNum} 위</td>
		                           <td>		                           
		                           <c:choose>
                                        	<c:when test="${sessionScope.User_id == null }">
                                        		<a target="_blank" class="ranking_teaminfo" onclick="alert('로그인 후 이용해주세요.')"><span>${row1.User_nickname}</span></a> <br>
                                        	</c:when>
                                        	<c:otherwise>
                                        		<a href="/mypage_view?User_nickname=${row1.User_nickname}" target="_blank" class="ranking_teaminfo"><span>${row1.User_nickname}</span></a> <br>
                                        	</c:otherwise>
                                   </c:choose>
		                           </td>
		                           <td>${row1.commission}</td>
		                           <td>${row1.User_score}</td>
		                       </tbody>
	                        </c:forEach>
	                    </table>
	               </div>
              </div> 
                <!-- ==============작업공간============== -->
            </div>
        </div>
    </div>
    
<!-- 푸터 -->
<div class="common_footer">푸터임다</div>
</body>
<script src="../../resources/js/BasicFrame.js"></script>
</html>