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
    <link rel="stylesheet" href="https://unicons.iconscout.com/release/v4.0.0/css/line.css">
     <!-- 폰트어썸 아이콘 사이트 -->
   <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css">
     <!-- paging -->
   <link rel='stylesheet' href='https://cdn.gitcdn.link/cdn/angular/bower-material/v1.1.0-rc.5/angular-material.css'>

   <link href="${path}/resources/css/board.css?after" rel="stylesheet"/>
    <title>HotFix</title>
</head>

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
            
            <div class="board_container">
                <div class="board_title">
                    <h1 class="tagHeader">${tag.Board_code}</h1>
                    <c:if test="${tag.Board_code == null}">
                    	<h1 class="tagHeader">전체</h1>
                    </c:if>
                    
                </div>
                <div class="board_category">
                	<!-- input hidden으로 li를 누를때 값을 넘길 수 있도록 -->
              		<form id ="submitTag" method="POST">
              			<input type="hidden" value="" name="Board_code" id="Board_code">
              			
              		</form>
                  <ul>
                    <li class="tag">일상</li>
                    <li class="tag">컬럼</li>
                    <li class="tag">스터디</li>
                    <li class="tag">커리어</li>
                  </ul>
                   
               </div>
               <script>
               	let tag = document.querySelectorAll(".tag");
               	let code = document.querySelector("#Board_code");
            	let Submit = document.querySelector("#submitTag");
            	let tagHeader = document.querySelector(".tagHeader");
            	/* 코드의 값이 잘 넘어오는지 확인 */
               	console.log(code.value);
               
               	console.log(tag[0].textContent);
               	for(let i=0; i<tag.length; i++) {
               		tag[i].addEventListener('click', function(){
               		/* this는 반복된 tag */
               		/* 반복된 태그를 code.value값에 넣어준다 */
               		code.value = this.textContent;
               		
               		
               		console.log(code.value);
               		
               		Submit.action = "/TopicList";
               		Submit.submit();
               		})
               		
               	}
               	
               		
               </script>


                <div class="board_nav">
                   <button type="button" onclick="location.href='insert' ">작성하기</button>
                    <div class="board_nav_search">
                        <div class="search">
                            <div class="search-box">
                                <form method="POST" action ="/list">
                                 <input class="search-txt" type="text" placeholder="검색어를 입력해 주세요" name="keyword" />
                                  <button type="submit" class="searchbtn"><i class="fa-solid fa-magnifying-glass"></i></button>
                                </form>
                            </div>
                        </div>
                    </div>
                     <div class="board_nav_btn">
                        <select name="">
                            <option value="">최신순</option>
                            <option value="">조회순</option>
                            <option value="">추천순</option>
                        </select>
                    </div>
                   
                </div> 
				<c:forEach var="row" items="${list}">
                <div class="board_main">
                    <div class="board_header">
                        <div class="board_write">
                            <span><i class="fas fa-feather-alt"></i></span>
                            <span>200<i class="fas fa-bolt"></i></span>
                            <span>${row.Post_writer}</span>	                   
                            <span>${row.Post_cr_date}</span>
                        </div>
                        <div class="board_view">
                            <span>${row.Post_view} 조회수</span>
                            <span>${row.Post_like} 추천수</span>
                        </div>
                    </div>
                    <div class="board_content">
                        <span><a href="/detail?Post_num=${row.Post_num}">${row.Post_title}</a></span>
                    </div>
                    <div class="board_tag">
                        <span>${row.Tags_Board}</span>
                    </div>
                </div>   
                </c:forEach>
                  
                
                  
            </div>

        </div>

            
            <!-- ==============작업공간============== -->
        </div>



   
    </div>


    
    </div>
    <!-- 푸터 -->
    <div class="common_footer">푸터임다 d </div>

</body>

<script src="../../resources/js/BasicFrame.js"></script>
<!-- <script src="..../../resources/js/mypage_new_real.js"></script> -->
<script src="../../resources/js/board.js"></script>



</html>