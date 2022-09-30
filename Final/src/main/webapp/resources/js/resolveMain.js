

$(function() {

	$("#searchBtnI").on("click", function() {

		let keyword = $("[name=keyword]").val();
		let select = $("select[name=search_option]").val()
		location.href = "/resolveMain?keyword="+keyword+"&select="+select;
		

	});	


});




