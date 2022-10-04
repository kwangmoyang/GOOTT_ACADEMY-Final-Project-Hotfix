<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- ======================== 헤더 ======================= -->
    <script src="http://code.jquery.com/jquery-3.6.0.min.js"></script>
    <div class="common_header">
        <!-- 헤더 섹션 왼쪽 -->
        <div class="common_header_left">
            <a href="/MainPage"><img src="../../resources/img/hoxfix_1.png" alt=""></a>
        </div>
        <!-- 헤더 섹션 가운데 -->
        <div class="common_header_center">
            <!-- 카테고리 -->
            <ul class="header_menu">
                <li><a href="/resolveMain">HOTFIX</a></li>
                <li><a href="/teamlist">TEAM</a></li>
                <li><a href="/RankingcountTeam">RANK</a></li>
                <li><a href="/list">COMMUNITY</a></li>
            </ul>
            
        </div>
        
	<c:choose>
      <c:when test="${sessionScope.User_id == null }">
         <%@ include file="/WEB-INF/views/header/headerNotUser.jsp" %>
      </c:when>
      
      <c:otherwise>
      	<%@ include file="/WEB-INF/views/header/headerOnlyUser.jsp" %>
      </c:otherwise>
   </c:choose>
       
    </div>
