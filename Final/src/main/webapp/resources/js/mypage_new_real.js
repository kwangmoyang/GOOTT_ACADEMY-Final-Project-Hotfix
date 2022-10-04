
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






// ! =====================함수존=======================
// 22-09-28 SLEEP 탈퇴시 확인 알림창
function MemDeleteBtn() {
	let UserOut = document.querySelector("#UserOut");
    if (confirm("정말 탈퇴하시겠습니까? 탈퇴시 기존 정보는 복구불가입니다.")){
        alert("탈퇴완료되었습니다.");
        UserOut.action = '/UserDelete';
        UserOut.submit();
    }
    else {
        return false;
    }
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
    
            param[i].addEventListener('mouseout',function(){
            textColor(param[i],"rgba(25, 25, 25, 1)");
            transition(param[i],"1s");
            })
        })
    }
}



// * 22-09-02 HIKARI 드롭다운 함수
/**
 * 이벤트 발생시? 어떤 요소가? 어떤 스위치가?
 * @example dropDown(myAlarm,myAlarm_drop,flagMyAlarm);
 */
function dropDown(param,ele,flag){
    param.addEventListener('click',function(){
        if(flag == false){
            //본인 코드 알아서 들감
            display(ele,"block");
            flag =! flag;
        }
        else if(flag == true){
            //본인 코드 알아서 들감
            display(ele,"none");
            flag =! flag;
        }
    })
}


// * 22-08-23 HIKARI 컬러 함수
/**
 * 효과줄 변수 및 컬러 설정
 * @example backColor(Btn,"red")
 */
 function textColor(param,textColor){
    param.style.color=textColor;
}

// * 22-08-23 HIKARI 트랜지션 함수
/**
 * 효과줄 변수입력 및 시간 설정
 * @example transition(Btn,"1s")
 */
 function transition(param,second){
    param.style.transition=second;
    
}

// * 22-08-23 HIKARI 디스플레이 함수
/**
 * 효과줄 변수 및 컬러 설정
 * @example display(sideBar,"none or block")
 */
 function display(param,state){
    param.style.display=state;
}
 

//* 22-10-04 김양희  팀정보 모달창 추가
 
//========================팀정보 모달========================

 var teamname = document.querySelector('.mypage_teamname');
 const modaldiv = document.querySelector('.modal-div');
 const xicon = document.getElementById('xicon');
 const teaminfobtn = document.querySelector('.teaminfo_modal');
 //팀정보 모달에 표시된 팀이름
 const teamnameinfo = document.querySelector('#teamname');
 //팀탈퇴 모달에 표시된 팀이름
 const teamsecssioncheck = document.querySelector('.teamsecssioncheck span');

teaminfobtn.addEventListener('click', function(){

	teamnameinfo.innerHTML = teamname.textContent;
 	teamsecssioncheck.innerHTML = teamname.textContent;


})


 //팀보기 누르면 모달창 키기
teaminfobtn.addEventListener('click', function(){
     modaldiv.style.display = 'flex';
     xicon.style.display = 'block';
})

 // 모달창 끄기
 xicon.addEventListener('click', function(){
     modaldiv.style.display = 'none';
     xicon.style.display = 'none';
 });

 //모달창 배경 눌러도 꺼질 수 있도록
 modaldiv.addEventListener('click', function(e){    
     if(e.target.className == 'modal-div'){
         modaldiv.style.display = 'none';
         xicon.style.display = 'none';
     }
 });


//팀정보 ajax
//팀이름 또는 팀정보보기를 클릭하면

 function teaminfoFuc(a){

 	let teaminfo_teamname = a; //팀이름
 	
 	console.log("마이페이지"+teaminfo_teamname);
 	
 	$.ajax({
 		method:"POST",
 		url:"/teaminfo",
 		data: {teaminfo_teamname: teaminfo_teamname},
 		dataType:"text",
 		success:function(result){
 			$("#team-content").html(result);
 		},
 		error:function(request,status,error){
 			 alert("실패");
 		}
 	})

 }

 
 
//==========================팀탈퇴 모달========================

 const teamsecssionbtn = document.querySelector('.teamsecession-btn');
 const modaldiv4 = document.querySelector('.modal4-div');
 const xicon4 = document.querySelector('#xicon4');

 //팀탈퇴버튼 누르면 모달창 키기
 teamsecssionbtn.addEventListener('click', function(){
     modaldiv4.style.display = 'flex';
     xicon4.style.display = 'block';
 });

 // 모달창 끄기
 xicon4.addEventListener('click', function(){
     modaldiv4.style.display = 'none';
     xicon4.style.display = 'none';
 });

 //모달창 배경 눌러도 꺼질 수 있도록
 modaldiv4.addEventListener('click', function(e){    
     if(e.target.className == 'modal4-div'){
         modaldiv4.style.display = 'none';
         xicon4.style.display = 'none';
     }
 });

 function teamcheck3(a,b){
 	
 	if(a === null || a === ""){
 		alert("로그인이 필요합니다.");
 		//로그인페이지로 이동하도록
 		location.href = "/login";
 	}
 	else if(a != null || a != "")
 	{
 		if(!confirm("정말 탈퇴하시겠습니까?(팀리더가 탈퇴할 경우 팀이 삭제됩니다.)")){
 			return false;
 		}else{
 				let ssteamname = teamnameinfo.textContent; //클릭한 팀이름
 				let secessionteamname = b; //팀이름
 				let Usernickname = a; //유저 닉네임
 				
 				console.log("dddddd");
 				
 				if(ssteamname == secessionteamname){
 					console.log("dssdas");
 					$.ajax({
 						type:'POST',
 						data: {Usernickname: Usernickname, secessionteamname: secessionteamname},
 						url:"/teamsecession",
 						dataType:"text",
 						success: function(data){
 						alert("팀탈퇴가 완료되었습니다.");
 							location.href = "/teamlist";
 						}
 					});
 				}else if(secessionteamname == null || ssteamname != secessionteamname){
 					console.log(secessionteamname);
 					console.log(ssteamname);
 					alert("유저가 속한 팀이 아닙니다.");
 				}

 		}
 	}
 };
 

 var teamnotmemberform = document.querySelector('#teamnotmemberform');  
 function teamnotmember(){
 	alert('팀신청 취소가 완료되었습니다.'); 
 	teamnotmemberform.submit();
 	
 }
 