
// 22-07-17 HIKARI
// side bar 마이페이지 텍스트 호버 함수
// 해당 함수는 mypage 폴더내의 모든 파일들과 연관있음
let myPage_side_text = document.querySelectorAll(".myli>a");
textHover(myPage_side_text);


let info_before = document.querySelectorAll(".info_before");
let update_before = document.querySelectorAll(".update_before");

let info_after = document.querySelectorAll(".info_after");
let update_after = document.querySelectorAll(".update_after");

let update_submit = document.querySelectorAll(".update_submit");


let formsection = document.querySelectorAll(".formsection");

for(let i=0; i<update_before.length; i++){
    update_before[i].addEventListener('click', function(){
    	console.log("gd");
        display(info_after[i],"block");
        display(update_after[i],"block");
        display(formsection[i],"block");

        display(info_before[i],"none");
        display(update_before[i],"none");
    })
}

for(let i=0; i<update_after.length; i++){
    update_after[i].addEventListener('click', function(){
        display(info_after[i],"none");
        display(update_after[i],"none");
        display(formsection[i],"none");

        display(info_before[i],"block");
        display(update_before[i],"block");

        update_submit.action = "/loginChk";
    	update_submit.submit();

    })
}


// * 22-09-02 HIKARI 텍스트호버 함수
/**
 * 해당 함수를 적용하려면 querySelectorAll로 li 요소를 가져와야함
 * 호버시 진행될 이벤트를 (param)안에 넣어주면 알아서 적용됨
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

 
 
//10-04 김양희 팀관리 페이지 추가 
function acceptbtn(a,b){
		if(!confirm("팀가입신청을 수락하시겠습니까?")){
			return false;
			
		}else{
			
			$.ajax({
				method:"POST",
				url:"/teamjoinaccept",
				data: {Team_unaccept_member: b, Team_name: a},
				dataType:"text",
				success:function(result){
					location.href = "/teamleader"
				},
				error:function(request,status,error){
					 alert("실패");
				}
			})
		
	  }

}

function refusebtn(a){
	if(!confirm("팀가입신청을 거절하시겠습니까?")){
		return false;
		
	}else{
		
		$.ajax({
			method:"POST",
			url:"/teamjoinrefuse",
			data: {Team_unaccept_member: a},
			dataType:"text",
			success:function(result){
				location.href = "/teamleader"
			},
			error:function(request,status,error){
				 alert("실패");
			}
		})
	
  }
}

const teammemberdelForm = document.querySelector('#teammemberdelForm');

function teammemberdel(){
	if(!confirm("팀원을 추방하시겠습니까?")){
		return false;
		
	}else{
		teammemberdelForm.submit();
  }
}
 
 
 