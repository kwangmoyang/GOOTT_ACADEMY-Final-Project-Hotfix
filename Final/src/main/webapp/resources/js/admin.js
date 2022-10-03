let adminList_Btn = document.querySelectorAll(".adminList>li>a");
console.log(adminList_Btn);

textHover(adminList_Btn);

// * 22-09-02 HIKARI 텍스트호버 함수
/**
 * 해당 함수를 적용하려면 querySelectorAll로 li 요소를 가져와야함
 * 호버시 진행될 이벤트를 (param)안에 넣어주면 알아서 적용됨
 * transition, textColor 함수를 가져와야 적용됨
 * @example textHover(param)
 */
 function textHover(param){
    for(let i=0; i<param.length; i++){
        param[i].addEventListener('mouseover',function(){
            textColor(param[i],"rgba(248,58,37,1)");
            transition(param[i],".5s");
            console.log("ok");
    
            param[i].addEventListener('mouseout',function(){
            textColor(param[i],"rgba(25, 25, 25, 1)");
            transition(param[i],"1s");
            console.log("ok");
            })
        })
    }
}

// * 22-08-23 HIKARI 트랜지션 함수
/**
 * 효과줄 변수입력 및 시간 설정
 * @example transition(Btn,"1s")
 */
 function transition(param,second){
    param.style.transition=second;
}

// * 22-08-23 HIKARI 백그라운드 컬러 함수
/**
 * 효과줄 변수 및 백그라운드컬러 설정
 * @example backColor(Btn,"red")
 */
function backColor(param,color){
    param.style.background=color;
}

// * 22-08-23 HIKARI 컬러 함수
/**
 * 효과줄 변수 및 컬러 설정
 * @example textColor(Btn,"red")
 */
function textColor(param,textColor){
    param.style.color=textColor;
}

// * 22-08-23 HIKARI 디스플레이 함수
/**
 * 효과줄 변수 및 컬러 설정
 * @example display(sideBar,"none or block")
 */
 function display(param,state){
    param.style.display=state;
}

//===================제이쿼리사용=======================//
//체크박스 전체선택 
// $("#admin_allChBox").click(function(){
//	 let chk = $("#admin_allChBox").prop("checked");
//	 if(chk) {
//		 $(".del_Abd").prop("checked", true);
//	 } else {
//		 $(".del_Abd").prop("checked", false);
//	 }
// });
//체크박스 전체선택된 상태에서 개별 체크 박스 선택시  전체 선책 체크박스 해제
// $(".del_Abd").click(function(){
//	 $("#admin_allChBox").prop("checked", false);
// });
//
// $(".removeBtn").click(function(){
//	 let confirm_val = confirm("정말 삭제하시겠습니까?");
//	 
//	 if(confirm_val) {
//		 let checkArr = new Array();
//		 
//		 $("input[class='del_Abd']:checked").each(function(){
//			 checkArr.push($(this).attr("data-adminBd"));
//			 alert(checkArr);
//		 });
//		 
//		 $.ajax({
//			 url : "/admin/admin_BoardMem",
//			 type : "post",
//			 data : { del_Abd : checkArr },
//			 success : function(){
//				 location.href = "/admin/admin_BoardMem";
//			 }
//		 })
// 
//	 }
// })
 
 $(function(){
	 let chkObj = document.getElementsByName("del_Abd");
	 let delCnt = chkObj.length;
	 
	 $("input[name='admin_allChBox']").click(function(){
		 let chk_listArr = $("input[name='del_Abd']");
		 for (let i=0; i<chk_listArr.length; i++){
			 chk_listArr[i].checked = this.checked;
		 }
	 });
	 
	 $("input[name='del_Abd']").click(function(){
		 console.log($("input[name='del_Abd']:checked").length);
		 if($("input[name='del_Abd']:checked").length == delCnt){
			 $("input[name='admin_allChBox']")[0].checked = true;
		 }
		 else{
			 $("input[name='admin_allChBox']")[0].checked = false;
		 }
	 });
 });
 
 function removeValue() {
	 let url = "/boardMemDelete;"; // Controller로 보내고자 하는 URL
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
					 location.href = '/admin/board_mem';
				 }
				 else{
					 alert("삭제실패하였습니다!");
				 }
			 }
		 })
	 }
 }
 