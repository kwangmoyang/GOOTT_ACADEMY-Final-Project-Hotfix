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
<link rel="stylesheet" href="../../resources/css/myPage.css">
<link rel="stylesheet" href="../../resources/css/global.css">
<link rel="stylesheet" href="../../resources/css/detailBoard.css">
<!-- 유니콘 아이콘 사이트 -->
<link rel="stylesheet"
	href="https://unicons.iconscout.com/release/v4.0.0/css/line.css">

<title>HotFix</title>

<!-- 제이쿼리 -->
<script src="http://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
// 댓글 작성하기 
window.onload = function(){
	let btnReply = document.querySelector('#btnReply');
		  listReply();
	  btnReply.addEventListener('click', function(){
		  let Post_num = "${data.Post_num}";
			let Comment_contents = document.querySelector("#Comment_contents").value;
			let Comment_writer = document.querySelector("#Comment_writer").value;	
			let params={"Comment_contents":Comment_contents, "Post_num":Post_num,
					"Comment_writer":Comment_writer};	
			$.ajax({
				type:"post", 
				url: "/comment/insert",
				data: params,
				dataType: "text",
				success:function(data){
					  $("#listReply").html(data); 
				},
				error:function(error){
					console.log(error);
				}
			
			});
		});  
}
// 댓글 삭제 버튼 
$(document).on('click', '.btnDelete', function(e){
	let Comment_code = this.nextElementSibling.value;
	let Comment_contents = document.querySelector(".ComTd").value;
	let Post_num = "${data.Post_num}";
	//let Comment_contents = document.querySelector("#Comment_contents").value;
	let Comment_writer = document.querySelector("#Comment_writer").value;	
	let params={"Comment_contents":Comment_contents, "Post_num":Post_num,
			"Comment_writer":Comment_writer, "Comment_code":Comment_code};
	 $.ajax({
		type:"post", 
		url: "/comment/delete",
		contentType : "application/json;charset=UTF-8",
		data : JSON.stringify(params),
		success:function(){
			alert("삭제완료")
			window.location.href = "detail?Post_num="+ Post_num; 
		},
		error:function(error){
			console.log(error);
		}
	
	}); 
	
});
// 댓글 리스트 ajax
function listReply(){
	$.ajax({
		url: "comment/list?Post_num=${data.Post_num}",
		success:function(result){
			$("#listReply").html(result);
			
		},
		error:function(error){
			console.log(error);
		}
	});
	
}

//추천수 증가
function updateLikeUp(){ 
	$(document).on('click', '.Likeup', function(e){
		let Post_num = "${data.Post_num}";
		let Post_writer = "${data.Post_writer}";
		let params={"Post_num":Post_num};
		
		
		 $.ajax({
				type:"post", 
				url: "/board/Likeup",
				data :(params),
				success : function() {
					window.location.href = "detail?Post_num="+ Post_num;
				    
				},
				error:function(error){
					console.log(error);
				}
			
		}); 
		
	});
}
//추천수 감소
function updateLikeDown(){ 
	$(document).on('click', '.Likedown', function(e){
		let Post_num = "${data.Post_num}";
		let Post_writer = "${data.Post_writer}";
		let params={"Post_num":Post_num};
		
		
		 $.ajax({
				type:"post", 
				url: "/board/Likedown",
				data :(params),
				success : function() {
					window.location.href = "detail?Post_num="+ Post_num;
				    
				},
				error:function(error){
					console.log(error);
				}
			
		}); 
		
	});
}

</script>

</head>

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

				<div class="detailBoard_container">
					<div class="detailSubTitle">
						<span><i class="fas fa-feather-alt"></i></span> <span>200<i
							class="fas fa-bolt"></i></span> <span>${data.Post_writer}</span> 
							 <span>
					             <fmt:parseDate value="${data.Post_cr_date}" pattern="yyyy-MM-dd'T'HH:mm:ss" var="date1" type="both" /> 
					             <fmt:formatDate value="${date1}" pattern="MM-dd  HH:mm"/>
					          </span>
					</div>
					<div class="detailContent">
						<h1>${data.Post_title}</h1>
						<p>${data.Post_contents}</p>

					</div>
					<div class="detailTag">
						<span>${data.Tags_Board}</span>
					
					<c:choose>
							<c:when test="${sessionScope.User_id != null }">
								<div class="detailLike">
							<span class="Likedown" onclick="updateLikeDown();"><i class="uil uil-angle-down"></i></span>
							<span class="LikeCnt">${data.Post_like}</span> 
							<span class="Likeup" onclick="updateLikeUp();" ><i class="uil uil-angle-up"></i></span>
								</div>
							</c:when>

							<c:otherwise>
								<div class="detailLike">
							<span class="BackTologin" ><i class="uil uil-angle-down" ></i></span>
							<span class="LikeCnt">${data.Post_like}</span> 
							<span class="BackTologin" ><i class="uil uil-angle-up" ></i></span>
								</div>
			
							</c:otherwise>
					</c:choose>
					
					
						
					</div>



					<div class="detailCommentBox">
						<c:choose>
							<c:when test="${sessionScope.User_id != null and sessionScope.User_nickname == data.Post_writer}">
								<div class="detail_btn">
									<button
										onclick="location.href='/update?Post_num=${data.Post_num}'">수정</button>
									<form method="POST" action="/delete">
										<input type="hidden" name="Post_num" value="${data.Post_num}" />
										<input type="submit" value="삭제" />
									</form>
								</div>
							</c:when>

							<c:otherwise>

							</c:otherwise>
						</c:choose>

				
						<textarea name="Comment_contents" id="Comment_contents" rows="10"
							cols="10" placeholder="댓글을 작성해주세요"
							style="width: 100%; height: 100%;"></textarea>
						<input type="hidden" value="${sessionScope.User_nickname}"
							name="Comment_writer" id="Comment_writer">
						<c:choose>
							<c:when test="${sessionScope.User_id != null }">
									<button type="button" id="btnReply" >댓글쓰기</button>
							</c:when>

							<c:otherwise>
									<button type="button" class="BackTologin" >댓글쓰기</button>
							</c:otherwise>
						</c:choose>
									
						
						
						
					</div>
						<!-- 댓글 리스트 -->
						<div id="listReply" ></div>
				
				</div>
			</div>

			<!-- ==============작업공간============== -->
		</div>




	</div>



	</div>
	<!-- 푸터 -->
	<div class="common_footer">푸터임다 d</div>

</body>

<script src="../../resources/js/BasicFrame.js"></script>
<script src="/resources/js/detailBoard.js"></script>

</html>