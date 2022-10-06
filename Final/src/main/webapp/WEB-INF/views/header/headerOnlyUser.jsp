<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>HOTFIX - Easy Solution For You</title>
</head>
<style>
/* 내 프로필 및 마이페이지 내역  */

/* 사이드바 리스트 */
.myList{
    width: 100%;
    height: 100%;
    border: solid 2px #ccc;
    border-radius: 10px;
}



.myList>ul{
    margin: 0; padding: 0;
}
.myList>ul>li{
    width: 100%;
    height: 10vh;
    /* border: solid 3px var(--ex-border-color); */

    list-style-type: none;
    text-align: center;
    font-size: 15px;

}
/* 프로필 이미지 부분 사이즈 조정 */
.myList>ul>li:nth-child(1){
    height: 30vh;
    display: flex;
    justify-content: center;
    align-items: center;
   
    /* flex-wrap: nowrap; */
}


/* 사이드바 이미지와 텍스트의 간격 */
.myList>ul>li:nth-child(2){
    margin-bottom: 50px;
}

/* 사이드바 이미지의 사이즈 */
.myList>ul>li:nth-child(1)>div{
   width: 150px;
   height: 150px;
   border-radius: 100%;
}
/* 사이드바 이미지의 사이즈 */
.myList>ul>li:nth-child(1)>div>img{
   width: 100%;
   height: 100%;
   border-radius: 100%;
}
/* 사이드바 이미지와 텍스트의 간격 */
.myList>ul>li:nth-child(2){
    margin-bottom: 50px;
}



.myli>a{
    color: black;
    text-decoration-line: none;
}
/* 이미지 */
.userImg{
    width: 150px;
    height: 150px;
    /* border: var(--new-border-orange); */
    border-radius: 100%;
    box-shadow: rgba(0, 0, 0, 0.24) 0px 0px 3px 0px;

    display: flex;
    
}

.userImg>img{
    width: 100%;
    height: 100%;
    border-radius: 100%;
    border: solid 1px #ccc;
}

/* 글자 간격 */
.mypage_title{
    margin: 15px 0;
}

</style>
<body>
	<!-- 헤더 섹션 오른쪽 -->
	<div class="common_header_right">
		<!-- 마이페이지 -->
		<div class="user">
			<div class="userImg"><img src="../resources/img/${sessionScope.photo2 }"/></div>
		
		
			<ul>
				<li><a href="/mypage/index">마이페이지</a></li>
				<li><a href="/charge/index">충전하기</a></li>
				<li><a href="/logout/index">로그아웃</a></li>
				<c:choose>
				<c:when test="${sessionScope.admin_auth == 1}">
				<li><a href="/admin/index">관리자 페이지</a></li>			
				</c:when>
				</c:choose>
				<c:if test="${sessionScope.Leader_auth == 1}">
        			<li><a href="/teamleader">팀 관리 페이지</a></li>
        		</c:if>	
			</ul>
		</div>
		<!-- 알림페이지 -->
		<div class="alarm">

			<div></div>
			<ul>
				<li><span>정산이 완료되었어요!</span><span>방금</span><span><i
						class="uil uil-angle-right-b"></i></span></li>
				<li><span>~님의 댓글이 달렸어요의 댓글이 달렸어요의 댓글이 달렸어요</span><span>어제</span><span><i
						class="uil uil-angle-right-b"></i></span></li>
				<li><span>충전이 완료되었어요!</span><span>1분전</span><span><i
						class="uil uil-angle-right-b"></i></span></li>
				<li><span>커미션지급이 완료되었어요!</span><span>1분전</span><span><i
						class="uil uil-angle-right-b"></i></span></li>
				<li><span>팀장 권한을 위임 받았어요!</span><span>1분전</span><span><i
						class="uil uil-angle-right-b"></i></span></li>
				<li><span>정산이 완료되었어요!</span><span>1분전</span><span><i
						class="uil uil-angle-right-b"></i></span></li>
				<li><span>정산이 완료되었어요!</span><span>1분전</span><span><i
						class="uil uil-angle-right-b"></i></span></li>
				<li><span>정산이 완료되었어요!</span><span>1분전</span><span><i
						class="uil uil-angle-right-b"></i></span></li>

			</ul>
		</div>
	</div>
</body>
</html>