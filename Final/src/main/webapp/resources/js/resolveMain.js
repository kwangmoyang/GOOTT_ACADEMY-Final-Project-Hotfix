//자동실행함수
$(function() {
	
	
	
	// 검색
	$("#searchBtnI").on("click", function() {
		//내가 검색한 키워드
		
		let cat = searchParam("boardCode");
		let keyword = $("[name=keyword]").val();
			
		let select = $("select[name=search_option]").val()
		
			
		//카테고리를 이미 선택한 후 검색이라면
		if(searchParam("boardCode") !=null){
			
			location.href = "/list?boardCode="+cat+"&keyword="+keyword+"&select="+select;
			return;
		}
		location.href = "/list?keyword="+keyword+"&select="+select;
	});	
	
	
	
	// 카테고리 클릭시 해당메뉴 관련 데이터 리스트 호출
	$(".category").on("click", function() {
		let cat = $(this).attr("name");
		
		location.href = "/list?boardCode=" + cat;
	});
	
	
	
});
//쿼리스트링의 주소를 받아옴
function searchParam(key) {
	return new URLSearchParams(location.search).get(key);
};

