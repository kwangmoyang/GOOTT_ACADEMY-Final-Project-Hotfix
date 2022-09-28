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
<script src="http://code.jquery.com/jquery-3.6.0.min.js"></script>
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
            
            <div class="teamlistsearch">
                <div class="search">
                    <div class="search-box">
                        <form method="POST" action="/teamlist">
	                        <input class="search-txt" type="text" placeholder="검색어를 입력해 주세요" name="keyword" value=" "/>
	                        <button type="submit" class="searchbtn"><i class="fa-solid fa-magnifying-glass"></i></button>
	                        <select name="search_option">
								<option value="all"<c:out value="${map.search_option == 'all' ? 'selected' : ''}"/> >전체</option>
								<option value="Teamname"<c:out value="${map.search_option == 'Teamname' ? 'selected' : ''}"/> >팀이름</option>
								<option value="tagname"<c:out value="${map.search_option == 'tagname' ? 'selected' : ''}"/> >태그</option>
							</select>	
                        </form>
                    </div>
                    <div class="teammakingbtn">
                        <button id="teammakebtn">팀만들기</button>
                    </div>
                </div>
        	</div>
        	
        		
                <!-- <div class="select-tagsearch">
	                <div class="select-search-div">
	                    <c:forEach var="row1" items="${map.tags}" begin="0" end="4">
	                    	<input type="hidden" id="searchtagbtnone"/>
								<button class="searchtagbtn">
									#${row1.Tag_Name}
								</button>
						</c:forEach>                    
	                </div>
	                <button class="plusbtn">...</button>
            	</div>
	            <div class="plustagdiv">
	               <div class="plustag">
	                    <c:forEach var="row1" items="${map.tags}" begin="5">
	                    	<input type="hidden" id="searchtagbtntwo"/>
								<button class="searchplusbtn">
									#${row1.Tag_Name}
								</button>
						</c:forEach>
	                    <button class="closebtn">접기</button>
	                </div>
	            </div> -->
            
    
			
            	<c:forEach var="row" items="${map.teamlist}" begin="0" end="9">
				  <div class="teamlistbox">
				      <div class="img">
				          <!-- 사진 불러오는 거 -->
				          <img src="/resources/img/pIiRs.jpg" alt="">
				      </div>
				      <div class="teamlistboxleft">
				         <div class="teamtitle" onclick="teaminfoFuc('${row.Team_name}')">${row.Team_name}</div>
				         <div class="teamdescription">${row.Team_intro}</div>
		
							<div class="languagetag">		
									<c:forEach var="row1" items="${map.taglist}">
								        <c:if test="${row.Team_name eq row1.Team_name}">
											<button class="tagbtn">
												${row1.Tags_Tag_Name}
											</button>
										</c:if>
									</c:forEach>
							 </div>
							    
				        <div class="teamcreationdate">
				             <fmt:parseDate value="${row.Team_cr_date}" pattern="yyyy-MM-dd'T'HH:mm:ss" var="date1" type="both" /> 
				              <fmt:formatDate value="${date1}" pattern="yyyy-MM-dd"/>
				        </div>
				     </div>
				     <div class="teamlistboxright">
				       <div class="btndiv">
				            <div class="join btn" onclick="teaminfoFuc2('${row.Team_name}')">팀정보보기</div>
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
	            <div id="teamname"></div>
	            <div id="team-category">
	                <button class="teaminfo-btn" onclick="teaminfoFuc3('${row.Team_name}')">팀정보</button>
	                
	                <button class="teamjoin-btn">팀가입</button>
	                <button class="teamsecession-btn">팀탈퇴</button>
	            </div>
	        </div>
	        <div id="team-content">
				
	        </div>
	    </div>
	    <ion-icon name="close-outline" id="xicon"></ion-icon>
	</div>
	
	
	
<!-- =========================================팀만들기 모달================================================= -->

	
	    <div class="modal2-div">
	        <div class="teammodal2-div">
	            <div class="toptitle"><p>${sessionScope.User_nickname}님의 팀 만들기</p></div>
	            <div class="team profile">
						팀 로고 첨부파일
	                <!-- <div class="teamlogo"><img src="이미지가 들어올 것" alt=""><i class="fa-solid fa-user" id="teamlogoicon"></i></div> -->
	                 <button><input type="file"></button>
	            </div>
	            <div class="team divone">
	                <input type="text" id="teaminput" class="teamname" name="teamname" placeholder="팀이름" >
	            </div>
	            <div class="team divtwo">
	                <input type="text" id="teaminput" class="teamintro" name="teamintro" placeholder="소개글">
	            </div>
	            <div class="team divthr">
	                	태그선택
	                <div class="teamtag">
	                    <c:forEach var="row1" items="${map.tags}">
								<button class="normalbtn" name="teamtag">
									#${row1.Tag_Name}
								</button>
						</c:forEach>
	                </div>
	            </div>
	            <div class="team divfour">
	                <p>약관넣기</p>
	                <input type="checkbox" id="team-checkbox">
	            </div>
	            <div class="team make-btn">
	                <button id="makingbtn" type="button" onclick="teamcheck('${sessionScope.User_nickname}')">팀생성하기</button>
	            </div>
	        </div>
	        <ion-icon name="close-outline" id="xicon2"></ion-icon>
	    </div>
	    
<!-- ====================================팀만들기 알림 ============================================ -->
	    
		<c:if test="${message == '팀이름중복'}">
			<p>중복된 팀이름입니다</p>
		</c:if>
		<c:if test="${message == '유저이미팀있음'}">
			<p>${sessionScope.User_nickname}님은 이미 가입한 팀이 있습니다.</p>
		</c:if>
		<c:if test="${message == '성공'}">
			<p>팀 생성에 성공</p>
		</c:if>
	
<!-- ====================================팀 가입 모달====================================== -->

	<div class="modal3-div">
		<div class="teammodal3-div">
			<div class="toptitle2"><p>팀 가입</p></div>
			<div class="teamjoincheck"> <span></span> 팀에 가입하시겠습니까? </div>
			<div class="team join-btn">
				<button onclick="teamcheck2('${sessionScope.User_nickname}')">가입하기</button>
			</div>
	</div>
		<ion-icon name="close-outline" id="xicon3"></ion-icon>
	</div>
	
<!-- ====================================팀가입하기 알림 ============================================ -->
	    
		<c:if test="${teamjoin == '성공'}">
			<p>팀가입에 성공했습니다.</p>
		</c:if>
		<c:if test="${teamjoin == '실패'}">
			<p>${sessionScope.User_nickname}님은 이미 가입한 팀이 있습니다.</p>
		</c:if>
	
<!-- ====================================팀 탈퇴 모달====================================== -->

	<div class="modal4-div">
	    <div class="teammodal4-div">
	        <div class="toptitle3"><p>팀 탈퇴</p></div>
	        <div class="teamsecssioncheck"> <span></span> 팀을 탈퇴하시겠습니까?ㅠㅠ  
		</div>
	        <div class="team secssion-btn">
	        	<input type="text" value="${sessionScope.Team_name}" name="secession_teamname"/>
	           <button onclick="teamcheck3('${sessionScope.User_nickname}')">탈퇴하기</button>
	        </div>
	    </div>
	<ion-icon name="close-outline" id="xicon4"></ion-icon>
	</div>
	
<!-- ============================================================================================= -->

	
	
<!-- ====================================팀탈퇴하기 알림 ============================================ -->
		<c:if test="${teamsecession == '팀삭제됨'}">
			<div class="modal4-div">
			    <div class="teammodal4-div">
			        <p>팀리더가 탈퇴하여 팀이 삭제되었습니다.</p>
			    </div>
			<ion-icon name="close-outline" id="xicon4"></ion-icon>
			</div>
		</c:if>
		<c:if test="${teamsecession == '팀탈퇴성공'}">
			<p>팀탈퇴에 성공했습니다.</p>
		</c:if>
		<c:if test="${teamsecession == '팀아님'}">
			<p>${sessionScope.User_nickname}님은 이 팀에 속해있지 않습니다.</p>
		</c:if>

</body>

<!-- modal js -->
<script src="../../resources/js/teammodal.js"></script>
<!-- 팀목록 js -->
<script src="../../resources/js/teamlist.js"></script>
<!-- 메인 js -->
<script src="../../resources/js/BasicFrame.js"></script>
</html>