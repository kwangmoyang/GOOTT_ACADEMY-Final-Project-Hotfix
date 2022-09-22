
// header center 카테고리 호버시 함수
let header_text = document.querySelectorAll(".header_menu>li>a");
console.log(header_text[0]);
textHover(header_text);

// header 마이페이지 클릭시 함수
let myPage = document.querySelector(".user>div"); //마이페이지 동그라미
let myPage_drop = document.querySelector(".user>ul"); //마이페이지 동그라미 드롭다운 요소

// header 알람 클릭시 함수
let myAlarm = document.querySelector(".alarm>div"); //알람 동그라미
let myAlarm_drop = document.querySelector(".alarm>ul"); //알람 동그라미 드롭다운 요소

// 플래그 스위치 모읍
let flagMyPage = false;  //마이페이지 동그라미 스위치d
let flagMyAlarm = false;  //알람 동그라미 스위치




let header_left = document.querySelector(".common_header_left"); //헤더 왼쪽부분
let header_center = document.querySelector(".common_header_center");//헤더 센터부분
let section = document.querySelector(".container"); // 전체 섹션박스

 

// ! ==============구현부========================

//22.09.16 HIKARI
// 드롭다운 함수
// 마이페이지 클릭시 알람창이 닫히고, 알람창 클릭시 마이페이지 닫히도록 구현

myPage.addEventListener('click', function () {
    if (flagMyPage == false) {
        display(myPage_drop, "block");
        //알람 페이지가 열려있을시 실행
        if (flagMyAlarm == true) {
            display(myAlarm_drop, "none");
            flagMyAlarm=false;
        }
    } else if (flagMyPage == true) {
        display(myPage_drop, "none");
    }
    // 토글 스위치 변경
    flagMyPage = !flagMyPage;
})

myAlarm.addEventListener('click', function () {
    if (flagMyAlarm == false) {
        display(myAlarm_drop, "block");
        //마이 페이지가 열려있을시 실행
        if (flagMyPage == true) {
            display(myPage_drop, "none");
            flagMyPage=false;
        }
        
    } else if (flagMyAlarm == true) {
        display(myAlarm_drop, "none");
    }
    // 토글 스위치 변경
    flagMyAlarm = !flagMyAlarm;
})


//22.09.16 HIKARI
// 드롭다운이 되어있는 상태에서 다른 영역 클릭시
// 드롭다운 사라짐 구현

drophide(header_left,"click");
drophide(header_center,"click");
drophide(section,"click");
drophide(window,"scroll");

function drophide(param,event){
    param.addEventListener(event,function(){
        display(myAlarm_drop, "none");
        display(myPage_drop, "none");
        flagMyPage=false;
        flagMyAlarm=false;
    })
}


// ! =====================함수존=======================


// * 22-09-02 HIKARI 텍스트호버 함수
/**
 * 해당 함수를 적용하려면 querySelectorAll로 li 요소를 가져와야함
 * 호버시 진행될 이벤트를 (param)안에 넣어주면 알아서 적용됨
 * @example textHover(param)
 */
function textHover(param) {
    for (let i = 0; i < param.length; i++) {
        param[i].addEventListener('mouseover', function () {
            textColor(param[i], "rgba(248,58,37,1)");
            transition(param[i], ".5s");
            console.log("ok");

            param[i].addEventListener('mouseout', function () {
                textColor(param[i], "rgba(25, 25, 25, 1)");
                transition(param[i], "1s");
                console.log("ok");
            })
        })
    }
}



// * 22-08-23 HIKARI 컬러 함수
/**
 * 효과줄 변수 및 컬러 설정
 * @example backColor(Btn,"red")
 */
function textColor(param, textColor) {
    param.style.color = textColor;
}

// * 22-08-23 HIKARI 트랜지션 함수
/**
 * 효과줄 변수입력 및 시간 설정
 * @example transition(Btn,"1s")
 */
function transition(param, second) {
    param.style.transition = second;

}

// * 22-08-23 HIKARI 디스플레이 함수
/**
 * 효과줄 변수 및 컬러 설정
 * @example display(sideBar,"none or block")
 */
function display(param, state) {
    param.style.display = state;
}