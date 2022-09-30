
// ========================팀정보 모달========================

var teamname = document.querySelectorAll('.teamtitle');
const modaldiv = document.querySelector('.modal-div');
const teammodaldiv = document.getElementById('teammodal-div');
const xicon = document.getElementById('xicon');
const teambtn = document.querySelectorAll('.join');
const checked = document.querySelector('#checked');

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

for(let i=0; i<teamname.length; i++){
    teamname[i].addEventListener('click', function(){

        teamnameinfo.innerHTML = teamname[i].textContent;
        teamjoincheck.innerHTML = teamname[i].textContent;
        teamsecssioncheck.innerHTML = teamname[i].textContent;
        

    })
};

//팀정보 ajax
//팀이름 또는 팀정보보기를 클릭하면
const teaminfobtn = document.querySelectorAll('.btn');
const inteaminfobtn = document.querySelector('.teaminfo-btn');

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


//태그
for(let i=0 ; i<tagbtn.length ; i++){
    tagbtn[i].addEventListener('click', function(e){

        if(e.target.className == 'normalbtn'){
            tagbtn[i].style.backgroundColor = 'rgb(251, 171, 79)';
            tagbtn[i].className = 'clickbtn';
        }

        else if(tagbtn[i].className = 'clickbtn'){
            tagbtn[i].style.backgroundColor = 'rgb(255, 232, 205)';
            tagbtn[i].className = 'normalbtn';
        }
    })
};


//체크가되어야 팀만들어지게
function teamcheck(usernickname){
	
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
	    if(maketeamintro.value == ''){
	        alert("소개글을 입력해주세요.");
	        return false;
	    }
	    //tagbtn추가할 것
	//    if()
	    if(teamcheckbox.checked == false){
	        alert("약관에 동의해주세요.");
	        return false;
	    }
	    if(maketeamname.value != '' && maketeamintro.value !='' && teamcheckbox.checked == true){
	    	
	    	console.log(maketeamname.value.length);
	    	
	    	$.ajax({
	    		type:'POST',
	    		data: {maketeamname: maketeamname.value, usernickname: usernickname, teamintro : maketeamintro.value},
	    		url:"/teammake",
	    		dataType:"text",
	    		success: function(data){
	    			alert("팀생성이 완료되었습니다!")
	    			location.href = "/teamlist";
	    		},
	    		error:function(request,status,error){
	    			if(maketeamname.value.length >= 20){
	    		    	alert("20자 이내로 입력해주세요.");
	    		    }
	    			else{
	    				 alert("팀이름이 중복됐거나 ,유저가 속해있는 팀이 이미 있습니다.");
	    			}
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
				alert("팀가입이 완료되었습니다.");
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

//let secession_teamname = document.getElementByName('secession_teamname');

//console.log("sss",secession_teamname);

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
					alert("유저가 속한 팀이 아닙니다.");
				}

		}
	}
};