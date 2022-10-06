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
<!-- 기본틀 -->
<link rel="stylesheet" href="${path}/resources/css/BasicFrame.css">
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
<link rel="icon" href="${Path}/resources/img/HotFavicon.png" type="image/png">
<title>HOTFIX - Easy Solution For You</title>
</head>
<script src="http://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
	function list(page) {
		location.href = "teamlist?keyword=${map.keyword}&curPage=" + page;

	}
</script>
<body>

<%@ include file="/WEB-INF/views/header/header.jsp" %>

<div class="container">
    <!-- ======================== 작업 섹션 ======================= -->
    <div class="common_section">
        <!-- 메인섹션 -->
        <div class="main">
            <!-- ==============작업공간============== -->
            <div class="RmHeader">
                <h1>TEAM</h1>
            </div>
            
            <div class="teamlistsearch">
                <div class="search">
                    <div class="search-box">
                        <form method="POST" action="/teamlist">
	                        <input class="search-txt" type="text" placeholder="검색어를 입력해 주세요" name="keyword" value=""/>
	                        <button type="submit" class="searchbtn"><i class="fa-solid fa-magnifying-glass" ></i></button>
	                        <select name="search_option" class="search_option">
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
				            <div class="join btn" onclick="teaminfoFuc('${row.Team_name}')">팀정보보기</div>
				       </div>
				     </div>
			       </div>
			  </c:forEach>
			  
			  <table class="boardPaging">
		         <tr>
		            <td colspan="5" align="center" class ="boardPagingTd">
		               <c:if test="${map.page_info.curBlock > 1 }">
		                  <a href="javascript:list('1')">[처음]</a>
		               </c:if> 
		               <c:if test="${map.page_info.curBlock > 1 }">
		                  <a href="javascript:list('${map.page_info.prevPage}')">[이전]</a>
		               </c:if> 
		               
		               <c:forEach var="num" begin="${map.page_info.blockBegin}"
		                  end="${map.page_info.blockEnd}">
		                  <c:choose>
		                     <c:when test="${num==map.page_info.curPage}">
		                        <span style="font-size:25px; color:red"  >${num}</span>                                     
		                     </c:when>
		                        <c:otherwise>
		                            <a href = "javascript:list('${num}')">${num}</a>
		                        </c:otherwise>
		                  </c:choose>
		               </c:forEach>
		               
		               <c:if test="${map.page_info.curBlock <= map.page_info.totBlock}">
		                  <a href="javascript:list('${map.page_info.nextPage}')">[다음]</a>
		               </c:if> 
		               <c:if test="${map.page_info.curPage <= map.page_info.totPage}">
		                  <a href="javascript:list('${map.page_info.totPage}')">[끝]</a>
		               </c:if> 
		            </td>
		         </tr>
   				</table>
            <!-- ==============작업공간============== -->
        </div>
    </div>
</div>
<!-- 푸터 -->
<%@ include file="/WEB-INF/views/footer.jsp" %>

<!-- ===================================================팀정보 모달=====================================================-->
	<div class="modal-div">
	    <div id="teammodal-div">
	        <div id="team-navbar">
	            <div id="teamname"></div>
	            <div id="team-category">
	                <button class="teaminfo-btn">팀정보</button>
	                <button class="teamjoin-btn">팀가입</button>		
	            </div>
	        </div>
	        <div id="team-content"></div>
	    </div>
	    <ion-icon name="close-outline" id="xicon"></ion-icon>
	</div>
<!-- ===================================================팀만들기 모달================================================= -->
	  <div class="modal2-div">
	        <div class="teammodal2-div">
	            <div class="toptitle"><p>${sessionScope.User_nickname}님의 팀 만들기</p></div>
	            <div class="team profile">
					
	                <!-- <div class="teamlogo"><img src="이미지가 들어올 것" alt=""><i class="fa-solid fa-user" id="teamlogoicon"></i></div> -->
						<div>
							<p>팀 로고는 팀관리 페이지에서 등록해주세요</p>
						</div>
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
								<button class="normalbtn" name="teamtag"value="${row1.Tag_Name}">${row1.Tag_Name}</button>
						</c:forEach>
	                </div>
	            </div>
	            <div class="team divfour">
	            	약관 동의(필수)
	            	<div>
	                    <p>동의 시 팀 생성</p>
	                    <br>
	                    <p>1. 팀 생성 시 생성한 유저가 팀 리더가 된다.</p>
	                    <p>2. 팀리더가 팀 탈퇴 시 팀멤버가 있는 경우 첫번째로 들어온 팀원에게 후임 후 팀 탈퇴된다. </p>
	                    <p>3. 팀리더가 팀 탈퇴 시 팀멤버가 없는 경우 팀자체가 삭제된다. </p>
	                    <p>4. 팀리더는 팀원의 가입 신청을 수락 또는 거절할 수 있고, </p>
	                    <p>	     팀원을 추방시킬 수도 있다.</p>
	                    <br>
	                    <br>
	                    <p>개인정보처리방침</p>
	                    <br>
	                    <br>
	                    <p>[차례]</p>
	                    <p>1. 총칙</p>                    
	                    <p>2. 개인정보 수집에 대한 동의</p>
	                    <p>3. 개인정보의 수집 및 이용목적</p>
	                    <p>4. 수집하는 개인정보 항목</p>
	                    <p>5. 개인정보 자동수집 장치의 설치, 운영 및 그 거부에 관한 사항</p>
	                    <p>6. 목적 외 사용 및 제3자에 대한 제공</p>
	                    <p>7. 개인정보의 열람 및 정정</p>
	                    <p>8. 개인정보 수집, 이용, 제공에 대한 동의철회</p>
	                    <p>9. 개인정보의 보유 및 이용기간</p>
	                    <p>10. 개인정보의 파기절차 및 방법</p>
	                    <p>11. 아동의 개인정보 보호</p>
	                    <p>12. 개인정보 보호를 위한 기술적 대책</p>
	                    <p>13. 개인정보의 위탁처리</p>
	                    <p>14. 의겸수렴 및 불만처리</p>
	                    <p>15. 부 칙(시행일)</p> 
	                    <br>
	                    <p>1. 총칙</p>
	                    <br>
	                    <p>본 업체 사이트는 회원의 개인정보보호를 소중하게 생각하고, 회원의 개인정보를 보호하기 위하여 항상 최선을 다해 노력하고 있습니다. </p>
	                    <p>1) 회사는 「정보통신망 이용촉진 및 정보보호 등에 관한 법률」을 비롯한 모든 개인정보보호 관련 법률규정을 준수하고 있으며, 관련 법령에 의거한 개인정보처리방침을 정하여 이용자 권익 보호에 최선을 다하고 있습니다.</p>
	                    <p>2) 회사는 「개인정보처리방침」을 제정하여 이를 준수하고 있으며, 이를 인터넷사이트 및 모바일 어플리케이션에 공개하여 이용자가 언제나 용이하게 열람할 수 있도록 하고 있습니다.</p>
	                    <p>3) 회사는 「개인정보처리방침」을 통하여 귀하께서 제공하시는 개인정보가 어떠한 용도와 방식으로 이용되고 있으며 개인정보보호를 위해 어떠한 조치가 취해지고 있는지 알려드립니다.</p>
	                    <p>4) 회사는 「개인정보처리방침」을 홈페이지 첫 화면 하단에 공개함으로써 귀하께서 언제나 용이하게 보실 수 있도록 조치하고 있습니다.</p>
	                    <p>5) 회사는  「개인정보처리방침」을 개정하는 경우 웹사이트 공지사항(또는 개별공지)을 통하여 공지할 것입니다.</p>
	                    <br>
	                    <p>2. 개인정보 수집에 대한 동의</p>
	                    <br>
	                    <p>귀하께서 본 사이트의 개인정보보호방침 또는 이용약관의 내용에 대해 「동의 한다」버튼 또는 「동의하지 않는다」버튼을 클릭할 수 있는 절차를 마련하여, 「동의 한다」...</p>
                	</div>
	               	 동의 <input type="checkbox" id="team-checkbox">
	            </div>
	            <div class="team make-btn">
	                <button id="makingbtn" type="button" onclick="teamcheck('${sessionScope.User_nickname}','${sessionScope.Team_name}')">팀생성하기</button>
	            </div>
	        </div>
	        <ion-icon name="close-outline" id="xicon2"></ion-icon>
	    </div>
<!-- =========================================================팀 가입 모달=================================================== -->

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
	
<!-- =========================================================팀 탈퇴 모달======================================================= -->

	<div class="modal4-div">
	    <div class="teammodal4-div">
	        <div class="toptitle3"><p>팀 탈퇴</p></div>
	        <div class="teamsecssioncheck"> <span></span> 팀을 탈퇴하시겠습니까?ㅠㅠ  </div>
	        <div class="team secssion-btn">
	           <button onclick="teamcheck3('${sessionScope.User_nickname}', '${sessionScope.Team_name}')">탈퇴하기</button>
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