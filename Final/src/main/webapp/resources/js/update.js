
	let boardCode = document.querySelector("#boardCode");
	let Post_title = document.querySelector("#Post_title");
	let Updatebtn =  document.querySelector("#Updatebtn");
	
	

	Updatebtn.addEventListener('click', function(){
		//카테고리 유효성 검사
		if(boardCode.value === "") {
			alert("카테고리를 선택하세요")
			boardCode.focus();
			return false;
		};	
		
		//제목 유효성 검사 
		if(Post_title.value === "") {
			alert("제목을 입력하세요")
			Post_title.focus();
			return false;
		}
		//제목 유효성 검사 
		if(Post_title.value.length > 70 ) {
			alert("제목은 70글자 이하로 제한합니다")
			Post_title.focus();
			return false;
		}
		
		
		alert("글이 수정됬습니다")
		document.form1.submit(); 
		
	});
	
