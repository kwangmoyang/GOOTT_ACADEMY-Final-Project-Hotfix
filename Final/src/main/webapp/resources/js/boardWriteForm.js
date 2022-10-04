
	let boardCode = document.querySelector("#boardCode");
	let Post_title = document.querySelector("#Post_title");
	let Submitbtn =  document.querySelector("#Submitbtn");
	
	

	Submitbtn.addEventListener('click', function(){
		//카테고리 유효성 검사
		if(boardCode.value === "") {
			alert("토픽을 선택하세요")
			boardCode.focus();
			return false;
		};	
		
		//제목 유효성 검사 
		if(Post_title.value === "") {
			alert("제목을 입력하세요")
			Post_title.focus();
			return false;
		}
		
		alert("글이 등록됬습니다")
		document.form1.submit(); 
		
	});
	
