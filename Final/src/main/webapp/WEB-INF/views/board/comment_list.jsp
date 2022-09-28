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
<script src="http://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>



<body>

	<span style = "margin-left: 20px">${count}개의 댓글 </span>
	<table style="width: 800px" class="ComTb">
		
		<%pageContext.setAttribute("newLineChar", "\n");%>
	
		<c:forEach var="row" items="${list}">
			<c:set var="str"
				value="${fn:replace(row.Comment_contents, ' ','&nbsp;')}" />
			<c:set var="str" value="${fn:replace(str, newLineChar, '<br>')}" />
			<tr>
			
				<td class="ComTd">${row.Comment_writer}
				<br>
				
				<span>${str} </span> 
				<!-- 색션 네임 체크 후 댓글 삭제하기 -->
				<c:if test="${sessionScope.User_nickname==row.Comment_writer}">
				<button type="button" class="btnDelete">삭제</button>
					<!--  <button onclick="btnReplyDelete'${row.Post_num}')">삭제</button>-->

				</c:if>
				<input type="hidden" name="Comment_code" id="Comment_code" value="${row.Comment_code}" />
				</td>
			</tr>
		
				
			

		</c:forEach>
	</table>
<script>
	
	
</script>
</body>
</html>













