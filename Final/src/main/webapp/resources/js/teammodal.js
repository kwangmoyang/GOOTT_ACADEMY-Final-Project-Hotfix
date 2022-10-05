
// ========================팀정보 모달========================

var teamname = document.querySelectorAll('.teamtitle');
const modaldiv = document.querySelector('.modal-div');
//const teammodaldiv = document.getElementById('teammodal-div');
const xicon = document.getElementById('xicon');
const teambtn = document.querySelectorAll('.join');
//const checked = document.querySelector('#checked');
const teaminfobtn = document.querySelectorAll('.btn');

//팀이름 누르면 모달창 키기
for(let i=0; i<teamname.length; i++){
    teamname[i].addEventListener('click', function(){
        modaldiv.style.display = 'flex';
        xicon.style.display = 'block';
    })
};

//팀정보보기 버튼 누르면 모달창 키기
for(let i=0; i<teambtn.length; i++){
    teambtn[i].addEventListener('click', function(){
        modaldiv.style.display = 'flex';
        xicon.style.display = 'block';
    })
};


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

//팀정보 모달에 표시된 팀이름
const teamnameinfo = document.querySelector('#teamname');
//팀가입 모달에 표시된 팀이름
const teamjoincheck = document.querySelector('.teamjoincheck span');
//팀탈퇴 모달에 표시된 팀이름
const teamsecssioncheck = document.querySelector('.teamsecssioncheck span');

//팀이름 클릭 시
for(let i=0; i<teamname.length; i++){
    teamname[i].addEventListener('click', function(){

        teamnameinfo.innerHTML = teamname[i].textContent;
        teamjoincheck.innerHTML = teamname[i].textContent;
        teamsecssioncheck.innerHTML = teamname[i].textContent;
        

    })
};


//팀 정보 보기 버튼 클릭 시
for(let i=0; i<teaminfobtn.length; i++){
	teaminfobtn[i].addEventListener('click', function(){

        teamnameinfo.innerHTML = teamname[i].textContent;
        teamjoincheck.innerHTML = teamname[i].textContent;
        teamsecssioncheck.innerHTML = teamname[i].textContent;
        

    })
};

//팀정보 ajax
//팀이름 또는 팀정보보기를 클릭하면

function teaminfoFuc(a){

	let teaminfo_teamname = a; //팀이름
	
	console.log(teaminfo_teamname);
	
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
	





// ========================팀만들기 모달========================

const teammakebtn = document.querySelectorAll('#teammakebtn');
const modaldiv2 = document.querySelector('.modal2-div');
const xicon2 = document.querySelector('#xicon2');

const teamtag = document.querySelector('.teamtag'); //div
const tagbtn = document.querySelectorAll('.teamtag button');

const teamcheckbox = document.querySelector('#team-checkbox');
var maketeamname = document.querySelector(".teamname");
const maketeamintro = document.querySelector(".teamintro");

//팀만들기버튼 누르면 모달창 키기
for(let i=0; i<teammakebtn.length; i++){
    teammakebtn[i].addEventListener('click', function(){
        modaldiv2.style.display = 'flex';
        xicon2.style.display = 'block';
    })
};

// 모달창 끄기
xicon2.addEventListener('click', function(){
    modaldiv2.style.display = 'none';
    xicon2.style.display = 'none';
    
    teamcheckbox.value = null;
    maketeamname.value = null;
    maketeamintro.value = null;
    for(let i=0; i<tagbtn.length; i++){
    	if(tagbtn[i].className == 'clickbtn'){
            tagbtn[i].style.backgroundColor = 'rgb(255, 232, 205)';
        }
    }
});

var tagarray = [];

//태그
for(let i=0 ; i<tagbtn.length ; i++){
    tagbtn[i].addEventListener('click', function(e){

        if(e.target.className == 'normalbtn'){
            tagbtn[i].style.backgroundColor = 'rgb(251, 171, 79)';
            tagbtn[i].className = 'clickbtn';
            
            //태그들 배열에 넣어주기
            tagarray.push(tagbtn[i].value);

        }

        else if(tagbtn[i].className = 'clickbtn'){
            tagbtn[i].style.backgroundColor = 'rgb(255, 232, 205)';
            tagbtn[i].className = 'normalbtn';
            
            //취소하면 배열에서 제거
            for(let j = 0; j < tagarray.length; j++) {
            	if(tagarray[j] == tagbtn[i].value){
            	    tagarray.splice(j, 1);
            	    j--;
            	}
            }
            
        }
    })
};



//체크가되어야 팀만들어지게
function teamcheck(usernickname,TeamName){
	
	//만들팀이름, 팀소개글, 태그들, 팀만드는유저
	var objParams = {
			"maketeamname": maketeamname.value,
			"teamintro" : maketeamintro.value,
			"tagarray" : tagarray,
			"usernickname": usernickname
	}
	

	if(usernickname === null || usernickname === ""){
		alert("로그인이 필요합니다.");
		//로그인페이지로 이동하도록
		location.href = "/login";
	}
	else if(usernickname != null || usernickname != "")
	{
		
	    if(maketeamname.value == ''){
	        alert("팀이름을 입력해주세요.");
	        return false;
	    }
	    if(maketeamname.value.length >= 20){
	    	alert("20자 이내로 입력해주세요.");
	    }
	    if(maketeamintro.value == ''){
	        alert("소개글을 입력해주세요.");
	        return false;
	    }
	    if(teamcheckbox.checked == false){
	        alert("약관에 동의해주세요.");
	        return false;
	    }
	    if(TeamName != ''){
	    	alert("이미 속해있는 팀이 있습니다.")
	    }
	    if(maketeamname.value != ''
	    	&& maketeamname.value.length < 20
	    	&& maketeamintro.value !='' 
	    	&& teamcheckbox.checked == true 
	    	&& TeamName == ''){
	    	
	    	$.ajax({
	    		url:"/teammake",
	    		type:'POST',
	    		data: objParams,
	    		success: function(data){
	    			alert(data);
	    			location.href = "/teamlist";
	    		},
	    		error:function(request, HttpStatus, jqXHR){
	    			
	    			alert(request.responseText);
	    		}
	    	});
	    	
	    }
    
	}
};
//==========================팀가입 모달========================

const teamjoinbtn = document.querySelector('.teamjoin-btn');
const modaldiv3 = document.querySelector('.modal3-div');
const xicon3 = document.querySelector('#xicon3');


//팀가입버튼 누르면 모달창 키기
teamjoinbtn.addEventListener('click', function(){
    modaldiv3.style.display = 'flex';
    xicon3.style.display = 'block';
});

// 모달창 끄기
xicon3.addEventListener('click', function(){
    modaldiv3.style.display = 'none';
    xicon3.style.display = 'none';
});

//모달창 배경 눌러도 꺼질 수 있도록
modaldiv3.addEventListener('click', function(e){    
    if(e.target.className == 'modal3-div'){
        modaldiv3.style.display = 'none';
        xicon3.style.display = 'none';
    }
});

function teamcheck2(a){

	if(a === null || a === ""){
		alert("로그인이 필요합니다.");
		//로그인페이지로 이동하도록
		location.href = "/login";
	}
	else if(a != null || a != "")
	{
		let jointeamname = teamnameinfo.textContent; //팀이름
		let User_nickname = a; //유저 닉네임
		
		
		$.ajax({
			type:'POST',
			data: {jointeamname: jointeamname, User_nickname: User_nickname},
			url:"/teamjoin",
			dataType:"text",
			success: function(data){
				alert("팀신청이 완료되었습니다.(팀신청이 완료되면 알림이 갑니다.) ")
				location.href = "/teamlist";
			},
			error: function(){
				alert("이미 속한 팀이 있습니다.")
			}
		});
	}

};
// ==========================팀탈퇴 모달========================

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
		if(!confirm("정말 탈퇴하시겠습니까?(팀리더 탈퇴 시 팀원이 있는 경우 후임 후 탈퇴 / 팀원없을 시 팀자체가 삭제)")){
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