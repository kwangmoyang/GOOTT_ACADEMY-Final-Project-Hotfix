




$(function() {

	$("#searchBtnI").on("click", function() {

		alert("되나?");




	});	


});






let solutionSubmit = document.querySelectorAll('.solutionSubmit');
	let requestform = document.querySelectorAll('#requestform');
	
	
	let DetailModal2 = document.querySelector('#modal${vs.index}');
	let DetailModal3 = document.querySelector('#modalclose${vs.index}');

//해결신청 제출
	
	
	for (let i = 0; i < solutionSubmit.length; i++) {
		solutionSubmit[i].addEventListener('click', function(){
			alert("신청이 완료되었습니다.");
			requestform[i].action = "solutionRequest";
			requestform[i].submit();
		});

	}
	
	
	// 모달 열기
	function modalOpen() {
		document.querySelector('.RmModal_wrap').style.display = 'block';
		document.querySelector('.RmModal_background').style.display = 'block';

// 모달 끄기
	function modalClose() {
		document.querySelector('.RmModal_wrap').style.display = 'none';
		document.querySelector('.RmModal_background').style.display = 'none';
	
	}

//버튼 클릭리스너 달기
	let DetailModal = document.querySelectorAll('.DetailModal');
	
	for (let i = 0; i < DetailModal.length; i++) {
		DetailModal[i].addEventListener('click', modalOpen);
			
	}
	
	document.querySelector('.RmModal_close').addEventListener('click',
			modalClose);
	
	}