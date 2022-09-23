<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>comment_list</title>

</head>
<body>
<table style="width:1000px">
<% pageContext.setAttribute("newLineChar", "\n"); %>
<c:forEach var="row" items="${list}">
	<c:set var ="str" value="${fn:replace(row.Comment_contents,' ','&nbsp;')}"/>
	<c:set var ="str" value="${fn:replace(str, newLineChar, '<br>')}"/>
<tr>
	<td>${row.Comment_writer} 
		<br>${str}
		<!-- <c:if test="${sessionScope.name==row.Comment_writer}">
		<button onclick="showModify('${row.Comment_code}')">댓글 수정하기</button>
		</c:if> -->
	</td>
</tr>
	
</c:forEach>
</table>

</body>
</html>













