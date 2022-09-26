<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>comment_list</title>
<link href="${path}/resources/css/comment_list.css" rel="stylesheet" >
</head>
<body>
<!-- 	<div class="detailSubTitle">
				<div class="commentCon"> -->
	<table style="width: 800px" class="ComTb">
		
		<%pageContext.setAttribute("newLineChar", "\n");%>
	
		<c:forEach var="row" items="${list}">
			<c:set var="str"
				value="${fn:replace(row.Comment_contents, ' ','&nbsp;')}" />
			<c:set var="str" value="${fn:replace(str, newLineChar, '<br>')}" />
			<tr>
				<td class="ComTd">${row.Comment_writer}
				<br>
				<br>
				<span>${str} </span> 
				<!-- 색션 네임 체크 후 댓글 수정하기 -->
				<c:if test="${sessionScope.User_nickname==row.Comment_writer}">
					<button onclick="showModify('${row.Post_num}')">댓글 수정하기</button>
				</c:if>
				</td>
			</tr>
		
				
			

		</c:forEach>
	</table>
<!-- 	</div>
			</div> -->
</body>
</html>













