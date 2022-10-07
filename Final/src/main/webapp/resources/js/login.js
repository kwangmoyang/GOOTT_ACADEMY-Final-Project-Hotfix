// 로그인 버튼영역
let loginSubmit = document.getElementById('login_submit');

// 로그인 페이지 입력영역 변수
let login_Form = document.getElementById('login_Form');
let hotID = document.getElementById('hotID');
let hotPW = document.getElementById('hotPW');
let idalert = document.getElementById('idalert');
let pwalert = document.getElementById('pwalert');




// 아이디 및 비밀번호 마우스오버시 효과
hotID.addEventListener('mouseover', function () {

    hotID.style.border = '1px solid rgb(234, 126, 18)';
});
hotID.addEventListener('mouseout', function () {
    hotID.style.border = '1px solid rgb(175, 175, 175)';
});

hotPW.addEventListener('mouseover', function () {

    hotPW.style.border = '1px solid rgb(234, 126, 18)';
});
hotPW.addEventListener('mouseout', function () {
    hotPW.style.border = '1px solid rgb(175, 175, 175)';
});

// 로그인폼 함수영역 //

hotID.addEventListener('keyup',function(){
    idalert.innerHTML = '';
})

hotPW.addEventListener('keyup',function(){
    pwalert.innerHTML = '';
});

loginSubmit.addEventListener('click',function(){
    if(hotID.value===""){
        idalert.innerHTML = '<font color=red>&nbsp아이디를 입력해주세요.</font>';
        hotID.focus();
        return false;
    }
    if(hotPW.value===""){
        pwalert.innerHTML = '<font color=red>&nbsp비밀번호를 입력해주세요.</font>';
        hotPW.focus();
        return false;
    }
    else{

    	login_Form.action = "/loginChk";
    	login_Form.submit();
        
    }
})




