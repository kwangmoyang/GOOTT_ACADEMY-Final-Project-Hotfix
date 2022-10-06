// 10-04 김양희 추가
// ========================팀정보 모달========================

var teamname = document.querySelectorAll('.ranking_teaminfo');
const modaldiv = document.querySelector('.modal-div');
const xicon = document.getElementById('xicon');


//팀이름 누르면 모달창 키기
for(let i=0; i<teamname.length; i++){
    teamname[i].addEventListener('click', function(){
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

//팀이름 클릭 시
for(let i=0; i<teamname.length; i++){
    teamname[i].addEventListener('click', function(){

        teamnameinfo.innerHTML = teamname[i].textContent;        

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