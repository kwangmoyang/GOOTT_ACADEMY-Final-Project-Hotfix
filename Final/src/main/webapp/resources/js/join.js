// ========== 정규표현식 ========== //
// 아이디 : 숫자와 영문(대문자or소문자) 7자~15자이내
const ID_CHECK = /^[a-zA-Z]+[a-zA-Z0-9]{6,14}$/;
// 비밀번호 : 숫자와 특수문자 각 1개 이상, 영문은 2개 이상 사용하여 9자~20자이내
const PW_CHECK = /^(?=.*\d{1,20})(?=.*[~`!@#$%\^&*()-+=]{1,20})(?=.*[a-zA-Z]{2,20}).{9,20}$/;
// 이메일 : 숫자 또는 영문 조합 
const EMAIL_CHECK = /^[0-9a-zA-Z]{3,30}$/;
// 이름 유효성 검사
const NAME_CHECK = /^[가-힣]{2,15}$/;
// 특수문자 유효성 검사 (특수문자는 제외)
let NICK_CHECK = /^[!?@#$%^&*():;+-=~{}<>\_\[\]\|\\\"\'\,\.\/\`\₩]{2,}$/g;
let NICK_NAME = /^[ㄱ-ㅎ|가-힣|a-z|A-Z|0-9|]{2,12}$/;
// const NICK_NAME = 
// 핸드폰번호 숫자만
const PHONE_CHECK = /^[0-9]{8}$/;

// ========== 회원가입 정보입력란 변수선언 ========== //
let hotID = document.getElementById('hotID');
let hotPW = document.getElementById('hotPW');
let hotPW_Check = document.getElementById('hotPW_Check');
let hotEmail_ID = document.getElementById('hotEmail_ID');
let hotEmail_Add = document.getElementById('hotEmail_Add');
let hotName = document.getElementById('hotName');
let hotNick = document.getElementById('hotNick');
let phone1 = document.getElementById('phone1');
let phone2 = document.getElementById('phone2');

// ========== 조건에 맞지 않을 경우 innerHTML 표시영역 변수선언 ========== //
let hotID_alert = document.getElementById('hotID_alert');
let hotPW_alert = document.getElementById('hotPW_alert');
let hotPWCK_alert = document.getElementById('hotPWCK_alert');
let hotEM_alert = document.getElementById('hotEM_alert');
let hotNM_alert = document.getElementById('hotNM_alert');
let hotNK_alert = document.getElementById('hotNK_alert');
let hotPH_alert = document.getElementById('hotPH_alert');

// ========== 가입하기 버튼 변수선언 ========== //
let joinBtn = document.getElementById('join_submit');
let joinForm = document.getElementById('joinForm');

// 가입하기 클릭시 유효성 조건 맞추기 위한 변수선언 //
let userID = false
let userPW = false
let userPWCK = false
let userEM = false
let userNM = false
let userNC = false
let userPH = false

// ========== 서비스 이용약관 영역 ========== //
let agree = document.getElementById('agree');
let join_xicon = document.getElementById('join_xicon');
let join_modal = document.querySelector('.join_modal');
let agree_btn = document.querySelector('.agree_btn');
let clause = document.getElementById('clause');
let agreeRead = document.getElementById('agreeRead');

agree.addEventListener('click', function(){
        join_modal.style.display = 'flex';
        join_xicon.style.display = 'block';
})
join_xicon.addEventListener('click',function(){
    join_modal.style.display = 'none';
    join_xicon.style.display = 'none';
})
join_modal.addEventListener('click',function(){
    join_modal.style.display = 'none';
    join_xicon.style.display = 'none';
})
agree_btn.addEventListener('click',function(){
    join_modal.style.display = 'none';
    join_xicon.style.display = 'none';
    clause.checked = true;
})


// 2022.09.20 유효성 검사 90% 완료 추가 보완중


if(typeof(Storage)!== 'undefined'){
    sessionStorage.hotID = hotID.value;
    if (hotID.value === 'undefined') {
        //세션스토리지에 undefined가 들어 있다면
        //undefined가 뜨지않게 하기 위해서 공백을 넣음
        hotID.value = '';
    } else {
        hotID.value = sessionStorage.hotID;
    }
    hotID.addEventListener('keyup',function(){
        sessionStorage.hotID = hotID.value;
        if (hotID.value=='') { // 아이디값이 없을 경우
            hotID_alert.innerHTML = '<font color=red>&nbsp 아이디를 입력해주세요.</font>';
        } else if (!ID_CHECK.test(hotID.value)) { // 정규표현식 조건과 맞지 않을 경우
            hotID_alert.innerHTML = '<font color=red>&nbsp 영문 또는 영문 및 숫자 포함 7~15자 이내로 입력해주세요.(공백X)</font>';
        } else { 
            hotID_alert.innerHTML = '<font color=blue>&nbsp 멋진 아이디네요^^</font>';
            userID = true;
        }
    })

    hotPW.addEventListener('keyup',function(){
        if (hotPW.value=='') {
            hotPW_alert.innerHTML = '<font color=red>&nbsp 비밀번호를 입력해주세요.</font>';
        } else if (!PW_CHECK.test(hotPW.value)) {
            hotPW_alert.innerHTML = '<font color=red>&nbsp 영문, 특수문자, 숫자 조합 9~20자 이내로 입력해주세요.</font>';
        } else if (hotID.value==hotPW.value) { // 아이디와 비밀번호가 동일한지 체크
            hotPW_alert.innerHTML = '<font color=red>&nbsp 비밀번호는 아이디와 동일할 수 없습니다.</font>';
        } else {
            hotPW_alert.innerHTML = '<font color=blue>&nbsp 사용가능합니다!</font>';
            userPW = true;
        }
    })

    hotPW_Check.addEventListener('keyup',function(){
        if (hotPW_Check.value!==hotPW.value) { // 입력한 비밀번호 재확인 영역
            hotPWCK_alert.innerHTML = '<font color=red>&nbsp 입력하신 비밀번호와 일치하지 않습니다. 다시 입력해주세요.</font>';
        } else{
            hotPWCK_alert.innerHTML = '<font color=blue>&nbsp 입력하신 비밀번호와 일치합니다!</font>';
            userPWCK = true;
        }
    })

    hotEmail_ID.addEventListener('keyup',function(){
        if (hotEmail_ID.value=='') {
            hotEM_alert.innerHTML = '<font color=red>&nbsp 이메일을 입력해주세요.</font>';
        } else if (!EMAIL_CHECK.test(hotEmail_ID.value)) {
            hotEM_alert.innerHTML = '<font color=red>&nbsp 올바른 이메일 형식이 아닙니다.</font>';
        } else {
            hotEM_alert.innerHTML = '<font color=red>&nbsp 정확하지 않을 경우 메일 발송이 제한 될 수 있습니다.</font>';
            userEM  = true;
        }
    })

    hotName.addEventListener('keyup',function(){
        if (hotName.value=='') {
            hotNM_alert.innerHTML = '<font color=red>&nbsp 이름을 입력해주세요.</font>';
        } else if (!NAME_CHECK.test(hotName.value)) {
            hotNM_alert.innerHTML = '<font color=red>&nbsp 한글만 입력해주세요.</font>';
        } else {
            hotNM_alert.innerHTML = '';
            userNM = true;
        }
    })

    hotNick.addEventListener('keyup',function(){
        if (hotNick.value=='') {
            hotNK_alert.innerHTML = '<font color=red>&nbsp 닉네임을 입력해주세요.</font>';
        } else if (!NICK_CHECK.test(hotNick.value)) {
            hotNK_alert.innerHTML = '<font color=red>&nbsp 특수문자를 제외한 2~12자 이내로 입력해주세요.</font>';
        } 
    })

    hotNick.addEventListener('keyup',function(){
        if (hotNick.value=='') {
            hotNK_alert.innerHTML = '<font color=red>&nbsp 닉네임을 입력해주세요.</font>';
        } else if (!NICK_NAME.test(hotNick.value)) {
            hotNK_alert.innerHTML = '<font color=red>&nbsp 특수문자를 제외한 2~12자 이내로 입력해주세요.</font>';
        } else {
            hotNK_alert.innerHTML = '<font color=blue>&nbsp 사용가능합니다!</font>';
            userNC = true;
        }
    })

    phone2.addEventListener('keyup',function(){
        if (phone2.value=='') {
            hotPH_alert.innerHTML = '<font color=red>&nbsp 핸드폰 번호를 입력해주세요.</font>';
        } else if (!PHONE_CHECK.test(phone2.value)) {
            hotPH_alert.innerHTML = '<font color=red>&nbsp 숫자 8자리만 입력해주세요.</font>';
        } else {
            hotPH_alert.innerHTML = '';
            userPH = true;
        }
    })

    // if (clause.checked=false) {
    //     agreeRead.innerHTML = '<font color=red>&nbsp 약관 확인 후 동의 체크해주세요.</font>';
    // }
    // if (clause.checked=true) {
    //     agreeRead.innerHTML = '';
    // }
}

function joinForm_check() {
    // 유효성 조건 다 맞을 경우 제출됨
    if (userID && userPW && userPWCK && userEM && userNM && userNC && userPH){
        joinForm.submit();
        alert("회원가입을 축하드립니다!");
    } else {
        alert("공란 또는 이용약관 확인 후 가입해주세요!");
    }
    
}

// 이메일 옵션 선택 후 주소 자동 완성
function hotDomain() {
    let hotEmail_Add = document.getElementById('hotEmail_Add');
    let email_sel = document.getElementById('email_sel');

    // 선택된 옵션의 순서와 값 구하기
    let idx = email_sel.options.selectedIndex;
    let val = email_sel.options[idx].value;

    // 값 반영
    hotEmail_Add.value = val;
}
