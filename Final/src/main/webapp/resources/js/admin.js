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

    
            param[i].addEventListener('mouseout',function(){
            textColor(param[i],"rgba(25, 25, 25, 1)");
            transition(param[i],"1s");

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
 
// 회원게시글 선택 및 삭제 
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
 
// 공지사항 선택 및 삭제
 $(function(){
	 let Bdlist_Ck = document.getElementsByName("Bdlist_Ck");
	 let BdlistdelCnt = Bdlist_Ck.length;
	 
	 $("input[name='Bdlist_allChBox']").click(function(){
		 let chkTwo_listArr = $("input[name='Bdlist_Ck']");
		 for (let i=0; i<chkTwo_listArr.length; i++){
			 chkTwo_listArr[i].checked = this.checked;
		 }
	 });
	 
	 $("input[name='Bdlist_Ck']").click(function(){
		 if($("input[name='Bdlist_Ck']:checked").length == BdlistdelCnt){
			 $("input[name='Bdlist_allChBox']")[0].checked = true;
		 }
		 else{
			 $("input[name='Bdlist_allChBox']")[0].checked = false;
		 }
	 });
 }); 
 
 function Bdlistremove() {
	 let URL = "/NoticeDelete"; // Controller로 보내고자 하는 URL
	 let VALUEArr = new Array();
	 let List = $("input[name='Bdlist_Ck']");
	 for(let i=0; i<List.length; i++){
		 if(List[i].checked){
			 VALUEArr.push(List[i].dataset.adminnt);
		 }
	 }

	 if (VALUEArr.length == 0){
		 alert("선택된 글이 없습니다.");
	 }
	 else{
		 let check = confirm("정말 삭제하시겠습니까?");
		 $.ajax({
			 url : URL,
			 type : 'POST',
			 traditional : true,
			 data : {VALUEArr : VALUEArr},
			 success : function(ndata){
				 if(ndata = 1) {
					 alert("삭제되었습니다!");
					 location.href = '/admin/board_mng';
				 }
				 else{
					 alert("삭제실패하였습니다!");
				 }
			 }
		 })
	 }
 }
 
 
//========== 공지사항보기 ========== // 

 let noticeCk = document.querySelectorAll('.noticeCk');
 let Notice_xicon = document.getElementById('Notice_xicon');
 let Notice_modal = document.querySelector('.Notice_modal');
 let close_btn = document.querySelector('.close_btn');

 for(let i=0; i<noticeCk.length; i++){
	 noticeCk[i].addEventListener('click', function(){
		 Notice_modal.style.display = 'flex';
		 Notice_xicon.style.display = 'block'; 
	 })
 };


 Notice_xicon.addEventListener('click',function(){
	 Notice_modal.style.display = 'none';
	 Notice_xicon.style.display = 'none';
 })


 Notice_modal.addEventListener('click',function(){
	 Notice_modal.style.display = 'none';
	 Notice_xicon.style.display = 'none';
 })


 close_btn.addEventListener('click',function(){
	 Notice_modal.style.display = 'none';
	 Notice_xicon.style.display = 'none';
 }) 

 
 
 let noticeCont = document.querySelector('.noticeCont');
 function NoticeOn(a) {
	 let notice_Con = a; // 공지사항 내용보기	 
	 noticeCont.innerHTML = notice_Con;

 }
 