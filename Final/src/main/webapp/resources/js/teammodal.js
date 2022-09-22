
// ========================팀정보 모달========================

const teamname = document.querySelectorAll('.teamtitle');
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
}

//팀정보보기 버튼 누르면 모달창 키기
for(let i=0; i<teambtn.length; i++){
    teambtn[i].addEventListener('click', function(){
        modaldiv.style.display = 'flex';
        xicon.style.display = 'block';
    })
}


// 모달창 끄기
xicon.addEventListener('click', function(){
    modaldiv.style.display = 'none';
    xicon.style.display = 'none';
})

//모달창 배경 눌러도 꺼질 수 있도록
modaldiv.addEventListener('click', function(e){    
    if(e.target.className == 'modal-div'){
        modaldiv.style.display = 'none';
        xicon.style.display = 'none';
    }
})


// ========================팀만들기 모달========================

const teammakebtn = document.querySelectorAll('#teammakebtn');
const modaldiv2 = document.querySelector('.modal2-div');
const xicon2 = document.querySelector('#xicon2');


//팀만들기버튼 누르면 모달창 키기
for(let i=0; i<teammakebtn.length; i++){
    teammakebtn[i].addEventListener('click', function(){
        modaldiv2.style.display = 'flex';
        xicon2.style.display = 'block';
    })
}

// 모달창 끄기
xicon2.addEventListener('click', function(){
    modaldiv2.style.display = 'none';
    xicon2.style.display = 'none';
})

//모달창 배경 눌러도 꺼질 수 있도록
modaldiv2.addEventListener('click', function(e){    
    if(e.target.className == 'modal2-div'){
        modaldiv2.style.display = 'none';
        xicon2.style.display = 'none';
    }
})

// ==========================팀가입 모달========================

const teamjoinbtn = document.querySelector('.teamjoin-btn');
const modaldiv3 = document.querySelector('.modal3-div');
const xicon3 = document.querySelector('#xicon3');


//팀가입버튼 누르면 모달창 키기
teamjoinbtn.addEventListener('click', function(){
    modaldiv3.style.display = 'flex';
    xicon3.style.display = 'block';
})

// 모달창 끄기
xicon3.addEventListener('click', function(){
    modaldiv3.style.display = 'none';
    xicon3.style.display = 'none';
})

//모달창 배경 눌러도 꺼질 수 있도록
modaldiv3.addEventListener('click', function(e){    
    if(e.target.className == 'modal3-div'){
        modaldiv3.style.display = 'none';
        xicon3.style.display = 'none';
    }
})


// ==========================팀탈퇴 모달========================

const teamsecssionbtn = document.querySelector('.teamsecession-btn');
const modaldiv4 = document.querySelector('.modal4-div');
const xicon4 = document.querySelector('#xicon4');

//팀탈퇴버튼 누르면 모달창 키기
teamsecssionbtn.addEventListener('click', function(){
    modaldiv4.style.display = 'flex';
    xicon4.style.display = 'block';
})

// 모달창 끄기
xicon4.addEventListener('click', function(){
    modaldiv4.style.display = 'none';
    xicon4.style.display = 'none';
})

//모달창 배경 눌러도 꺼질 수 있도록
modaldiv4.addEventListener('click', function(e){    
    if(e.target.className == 'modal4-div'){
        modaldiv4.style.display = 'none';
        xicon4.style.display = 'none';
    }
})