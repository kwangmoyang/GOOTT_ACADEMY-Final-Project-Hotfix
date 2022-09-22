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
    // console.log('인식');
    hotID.style.border = '1px solid rgb(234, 126, 18)';
});
hotID.addEventListener('mouseout', function () {
    hotID.style.border = '1px solid rgb(175, 175, 175)';
});

hotPW.addEventListener('mouseover', function () {
    // console.log('인식');
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
        location.href = "../MainPage.html";
    }
    // alert('로그인되었습니다');
})


// loginSubmit.addEventListener('click', loginForm);


// function loginForm() {

//     if(hotID.value.length == 0){
//         idalert.innerHTML = '<font color=red>&nbsp아이디를 입력해주세요.</font>';
//         hotID.focus();
//         test()는 문자열에서 일치하는 항목을 테스트. true 또는 false를 돌려줍니다
//     } else if(ID_CHECK.test(hotID.value) == false){
//         idalert.innerHTML = '<font color=red>&nbsp영문 및 숫자조합 7~15자 이내로 입력해주세요.</font>';
//         hotID.select();
//     } else if(ID_CHECK.test(hotID.value) == true){
//         hotPW.focus();
//         alert('테스트');
//     } 
    
//     if(PW_CHECK.test(hotPW.value) == false){
//         pwalert.innerHTML = '<font color=red>영문 대소문자,특수문자,숫자 조합 8자 이상 입력해주세요.</font>';
//     } else {
//         alert('로그인되었습니다');
//     }
    
//     if(PW_CHECK.test(hotPW.value) != true){
//         //pwalert.innerHTML = '<font color=red>대문자,특수문자,숫자 조합 8자 이상 입력해주세요.</font>';
//         alert('테스트');
//     } else {
//         alert('로그인되었습니다');
//     }
// }


