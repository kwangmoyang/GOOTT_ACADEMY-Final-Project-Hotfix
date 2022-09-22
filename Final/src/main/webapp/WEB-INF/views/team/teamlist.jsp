<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="${path}/resources/css/BasicFrame.css?after">
    <!-- 폰트 -->
    <link rel="stylesheet" href="${path}/resources/css/global.css">
   <!-- 팀목록 css -->
   <link rel="stylesheet" href="${path}/resources/css/teamlist.css">
   <!-- modal css -->
   <link rel="stylesheet" href="${path}/resources/css/teammodal.css">
   <!-- 유니콘 아이콘 사이트 -->
   <link rel="stylesheet" href="https://unicons.iconscout.com/release/v4.0.0/css/line.css">
   <script type="module" src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.esm.js"></script>
   <!-- 폰트어썸 아이콘 사이트 -->
   <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css">
    <title>HotFix</title>
</head>
<!-- ㅎㅇ -->
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
            <div class="RmHeader">
                <h1>TEAM</h1>
            </div>
            <!-- <div class="type">
                select-box로 변경할 것
                <div><a href="">전체</a></div>
                <div><a href="">팀이름</a></div>
            </div> -->
            <div class="teamlistsearch">
                <div class="search">
                    <div class="search-box">
                        <form method="POST">
                          <input class="search-txt" type="text" placeholder="검색어를 입력해 주세요" name="keyword" />
                          <button type="submit" class="searchbtn"><i class="fa-solid fa-magnifying-glass"></i></button>
                        </form>
                    </div>
                    <div class="teammakingbtn">
                        <a href="#"><button id="teammakebtn">팀만들기</button></a>
                    </div>
                </div>
        	</div>
    
            <c:forEach var="row" items="${list}" begin="0" end="9">
		       <div class="teamlistbox">
		            <div class="img">
		            <!-- 사진 불러오는 거 -->
		                <img src="/resources/img/pIiRs.jpg" alt="">
		            </div>
		            <div class="teamlistboxleft">
		                <div class="teamtitle">${row.Team_name}</div>
		                <div class="teamdescription">${row.Team_intro}</div>
		   
					    <div class="languagetag">
			                <c:forEach var="row1" items="${taglist}">
			                	  <c:if test="${row.Team_name eq row1.Team_name}">
								          <button type="button" class="tagbtn">
								            ${row1.Skill_name}
								          </button>
								   </c:if>
							</c:forEach>
					    </div>
						      
		                <div class="teamcreationdate">
		                <fmt:timeZone value="UTC">
		                	<fmt:formatDate value="${row.Team_cr_date}" pattern="yyyy년 MM월 dd일" />
		                </fmt:timeZone>
		                </div>
		           </div>
		           <div class="teamlistboxright">
		                <div class="btndiv">
		                    <button class="join btn">팀정보보기</button>
		                </div>
		           </div>
	        	</div>
	         </c:forEach>
    
            <div class="teamlistpaging">
                <!-- 페이지 넘기기 -->
               페이징처리
            </div>    
            <!-- ==============작업공간============== -->
        </div>


    </div>


    
</div>
<!-- 푸터 -->
<div class="common_footer">푸터임다</div>



<!-- ===================================================팀정보 모달=====================================================-->
	<div class="modal-div">
	    <div id="teammodal-div">
	        <div id="team-navbar">
	            <div id="teamname">
	                <a href="">팀이름</a>
	            </div>
	            <div id="team-category">
	                <button>팀정보</button>
	                <!-- ajax처리 -->
	                <button><a href="teamnotice.html">공지사항</a></button>
	                <button class="teamjoin-btn">팀가입</button>
	                <button class="teamsecession-btn">팀탈퇴</button>
	            </div>
	        </div>
	        <!-- ajax? -->
	        <div id="team-content">
	
	            <div class="content-team-profile">
	                <div>팀순위 : <a href="">1</a> 위</div>
	                <div>에러 해결 누적 건수 : <a href="">1</a> 회</div> 
	                <div>팀 총 커미션 : <a href="">100,000</a> </div> 
	            </div>
	
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
	                </table>
	                <!-- ... -->
	            </div>
	
	            <div class="team-content-date-detail">
	                 <a href="teamnotice.html">공지사항 더보기</a>
	            </div>
	
	            
	            <div class="content-team-member">
	                <table>
	                    <thead>
	                        <td>활동점수</td>
	                        <td>닉네임</td>
	                        <td>활동언어</td>
	                        <td>직책</td>
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
	
	            <div class="teamicons">
	                <div class="linkcopy icons">
	                    <ion-icon name="link-outline" class="md hydrated"></ion-icon>
	                    <span class="tooltip">Copy</span>
	                    <span class="tooltiptwo">Copied</span>
	                </div>
	            </div>
	
	        </div>
	    </div>
	    <ion-icon name="close-outline" id="xicon"></ion-icon>
	</div>
	
	
	
	<!-- =========================================팀만들기 모달================================================= -->
	
	<div class="modal2-div">
	        <div class="teammodal2-div">
	            <div class="toptitle"><p>팀 만들기</p></div>
	            <div class="team profile">
	                <form action="">
	                    팀 로고 첨부파일
	                    <div><img src="이미지가 들어올 것" alt=""><i class="fa-solid fa-user" id="teamlogoicon"></i></div>
	                    <button><input type="file"></button>
	                </form>
	            </div>
	            <div class="team divone">
	                <input type="text" id="teaminput" placeholder="팀이름">
	            </div>
	            <div class="team divtwo">
	                약관넣기
	            </div>
	            <div class="team divthr">
	                <input type="text" id="teaminput" placeholder="소개글">
	            </div>
	            <div class="team make-btn">
	                <form action="">
	                    <button>팀생성하기</button>
	                </form>
	            </div>
	        </div>
	    <ion-icon name="close-outline" id="xicon2"></ion-icon>
	</div>
	
	<!-- ====================================팀 가입 모달====================================== -->
	<div class="modal3-div">
	    <div class="teammodal3-div">
	        <div class="toptitle2"><p>팀 가입</p></div>
	        <div class="teamjoincheck"><p>${teamname} 팀에 가입하시겠습니까?</p></div>
	        <div class="team join-btn">
	            <form action="">
	                <button>가입하기</button>
	            </form>
	        </div>
	    </div>
	<ion-icon name="close-outline" id="xicon3"></ion-icon>
	</div>
	
	<!-- ====================================팀 탈퇴 모달====================================== -->
	<div class="modal4-div">
	    <div class="teammodal4-div">
	        <div class="toptitle3"><p>팀 탈퇴</p></div>
	        <div class="teamsecssioncheck"><p>${teamname} 팀을 탈퇴하시겠습니까?ㅠㅠ</p></div>
	        <div class="team secssion-btn">
	            <form action="">
	                <button>탈퇴하기</button>
	            </form>
	        </div>
	    </div>
	<ion-icon name="close-outline" id="xicon4"></ion-icon>
	</div>

</body>

<!-- modal js -->
<script src="../../resources/js/teammodal.js"></script>
<!-- 팀목록 js -->
<script src="../../resources/js/teamlist.js"></script>
<!-- 메인 js -->
<script src="../../resources/js/BasicFrame.js"></script>
</html>