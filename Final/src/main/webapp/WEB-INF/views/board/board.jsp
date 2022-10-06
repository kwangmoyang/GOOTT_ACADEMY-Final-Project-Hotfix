<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="../../resources/css/BasicFrame.css">
<link rel="stylesheet" href="../../resources/css/global.css">
<!-- 유니콘 아이콘 사이트 -->
<link rel="stylesheet"
   href="https://unicons.iconscout.com/release/v4.0.0/css/line.css">
   <link rel="icon" href="${Path}/resources/img/HotFavicon.png" type="image/png">
    <script type="module" src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.esm.js"></script>
<!-- 폰트어썸 아이콘 사이트 -->
<link rel="stylesheet"
   href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css">

<link href="${path}/resources/css/board.css?after" rel="stylesheet" />
<title>HOTFIX - Easy Solution For You</title>
</head>
<script>

    function list(page) {
  	 
  	   if(searchParam("boardCode") != null){
  		   location.href="list?boardCode=${map.boardCode}&keyword=${map.keyword}&curPage="+page;
  	    	
  	
  	   } else if(searchParam("boardCode") == null){
  		   
      	  if(searchParam("keyword") != null) {
      		  location.href="list?keyword=${map.keyword}&curPage="+page;
      		  return true
      	 }
           location.href="list?curPage="+page;
        }else{       
         
           location.href="list?boardCode=${map.boardCode}&keyword=${map.keyword}&curPage="+page;
        }   
        
     }   
    
   
   
   
     
   
</script>

<body>
   
   <%@ include file="/WEB-INF/views/header/header.jsp"%>

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

            <div class="board_container">
               <div class="board_title">
                  <h1 class="tagHeader"></h1>

               </div>
               <div class="board_category">
                  <!-- input hidden으로 li를 누를때 값을 넘길 수 있도록 -->
                  <!-- <form id="submitTag" method="POST">
                     <input type="hidden" value="" name="Board_code" id="Board_code">

                  </form> -->
                  <ul>
                     <li class="category" name="일상">일상</li>
                     <li class="category" name="컬럼">컬럼</li>
                     <li class="category" name="스터디">스터디</li>
                     <li class="category" name="커리어">커리어</li>
                  </ul>

               </div>
               


               <div class="board_nav">
                  <c:choose>
                     <c:when test="${sessionScope.User_id != null }">
                        <button type="button" onclick="location.href='insert'" id="">작성하기</button>
                     </c:when>

                     <c:otherwise>
                        <button type="button" class="BackTologin" >작성하기</button>

                     </c:otherwise>
                  </c:choose>

                  <div class="board_nav_search">
                     <div class="search">
                        <div class="search-box">
                              <input class="search-txt" type="text"
                                 placeholder="검색어를 입력해 주세요" name="keyword" />
                              <button class="searchbtn">
                                 <i class="fa-solid fa-magnifying-glass" id = "searchBtnI"></i>
                              </button>
                        </div>
                     </div>
                  </div>
                  <div class="board_nav_btn">
                 <select name="search_option" id="search_option">
					<option value="new"
						<c:out value="${map.search_option == 'new' ? 'selected' : ''}"/>>최신순</option>
					<option value="view"
						<c:out value="${map.search_option == 'view' ? 'selected' : ''}"/>>조회순</option>
					<option value="like"
						<c:out value="${map.search_option == 'like' ? 'selected' : ''}"/>>추천순</option>
				</select> 
                  
                  </div>

               </div>
               <h3>${map.count}<span>개의 게시글</span></h3> <br>
               
               <c:forEach var="row" items="${map.list}">
                  <div class="board_main">
                     <div class="board_header">
                        <div class="board_write">
                            <span><strong>
                            <c:choose>
								<c:when test="${sessionScope.User_id == null}">
								  <a target="_blank" class="board_info" onclick="alert('로그인 후 이용해주세요.')">${row.Post_writer}</a>				
								</c:when>
								<c:otherwise>
								  <a href="/mypage_view?User_nickname=${row.Post_writer}" target="_blank" class="board_info">${row.Post_writer}</a>
								</c:otherwise>
							</c:choose>
                          </strong></span>

                      <span class="Board_list_info">
					             <fmt:parseDate value="${row.Post_cr_date}" pattern="yyyy-MM-dd'T'HH:mm:ss" var="date1" type="both" /> 
					             <fmt:formatDate value="${date1}" pattern="MM-dd  HH:mm"/>
					            </span>
                               
                        </div>
                        
                        <div class="board_view">
                           <span><ion-icon name="eye-sharp"></ion-icon>&nbsp;${row.Post_view}</span> <span><ion-icon name="swap-vertical-sharp"></ion-icon>&nbsp;${row.Post_like}
                              </span>
                        </div>
                     </div>
                     <div class="board_content">
                        <span><a href="/detail?Post_num=${row.Post_num}">${row.Post_title}</a></span>
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


            </div>

         </div>


         <!-- ==============작업공간============== -->
      </div>




   </div>



   </div>
   <!-- 푸터 -->
   <%@ include file="/WEB-INF/views/footer.jsp" %>

</body>

<script src="../../resources/js/BasicFrame.js"></script>
<!-- <script src="..../../resources/js/mypage_new_real.js"></script> -->
<script src="../../resources/js/board.js"></script>
<script>

let BackTologin = document.querySelector(".BackTologin");
BackTologin.addEventListener('click', function(){
   alert("로그인 후 이용해주세요");
});

</script>


</html>