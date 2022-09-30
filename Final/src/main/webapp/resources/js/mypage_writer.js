
$(function() {

	$("#searchBtnI").on("click", function() {
		
		let keyword = $("[name=keyword]").val();
		location.href = "/mypage/writer?keyword="+keyword;
		

	});	


});



let cancle = document.querySelector(".cancle");
cancle.addEventListener('click',function(){
    if (confirm("정말 삭제하시겠습니까?") == true){ 
    //true는 확인버튼을 눌렀을 때 코드 작성
    console.log("완료되었습니다.");
    }else{
    // false는 취소버튼을 눌렀을 때, 취소됨
    console.log("취소되었습니다");
}
})
