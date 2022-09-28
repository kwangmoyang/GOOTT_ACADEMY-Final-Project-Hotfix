<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- 폰트 -->
<link rel="stylesheet" href="${path}/resources/css/global.css">
<!-- modal css -->
<link rel="stylesheet" href="${path}/resources/css/teammodal.css">
<!-- 유니콘 아이콘 사이트 -->
<link rel="stylesheet" href="https://unicons.iconscout.com/release/v4.0.0/css/line.css">
<script type="module" src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.esm.js"></script>
<!-- 폰트어썸 아이콘 사이트 -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css">
<title>Insert title here</title>
</head>
<script src="http://code.jquery.com/jquery-3.6.0.min.js"></script>
<body>
	팀정보창
	<div class="content-team-profile">
	     <div>팀 평균 활동 점수: ${Team_avgScore}</div> 
		 <div>팀 총 커미션 : ${Team_sol_count}</div>
	</div>
	
	<div class="content-team-date">
	    <p>팀 공지사항 : ${Team_notice}</p>
	</div>
	
  
	<div class="content-team-member">
	    <table>
	       <thead>
	          <td>활동점수</td>
	          <td>닉네임</td>
	          <td>커미션</td>
	          <td>이메일</td>
	      </thead>
	      <!-- foreach로 수정 -->
	       <tbody>
	          <td><i class="fa-solid fa-fire"></i> <!-- ${User_score} --></td>
	          <td>
		          <a href="../../mypage/mypage" target="_blank"><i class="fa-solid fa-user"></i></a> 
		          <a href="../../mypage/mypage" target="_blank"><!-- ${User_nickname} --></a>
	          </td>
	          <td>
	             <!-- ${commission} -->
	          </td>
	          <td>
	          	<!-- ${Email_address} -->
	          </td>
	        </tbody>
	     </table>
	 </div>
	
</body>
<!-- modal js -->
<script src="../../resources/js/teammodal.js"></script>
</html>