
function removeValue() {
	 let url = "/myCommentDelete;"; // Controller로 보내고자 하는 URL
	 let valueArr = new Array();
	 let list = $("input[name='del_Abd']");
	 //console.log(list[0].dataset.adminbd);
	 for(let i=0; i<list.length; i++){
		 if(list[i].checked){
			 valueArr.push(list[i].dataset.adminbd);
		 }
	 }
	 if (valueArr.length == 0){
		 alert("선택된 글이 없습니다.");
	 }
	 else{
		 let chk = confirm("정말 삭제하시겠습니까?");
		 $.ajax({
			 url : url,
			 type : 'POST',
			 traditional : true,
			 data : {valueArr : valueArr},
			 success : function(jdata){
				 if(jdata = 1) {
					 alert("삭제되었습니다!");
					 location.href = '/mypage/comments';
				 }
				 else{
					 alert("삭제실패하였습니다!");
				 }
			 }
		 })
	 }
 }





