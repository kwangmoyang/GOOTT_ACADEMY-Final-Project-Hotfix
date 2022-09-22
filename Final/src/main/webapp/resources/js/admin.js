let adminList_Btn = document.querySelectorAll(".adminList>li>a");
console.log(adminList_Btn);

textHover(adminList_Btn);

// * 22-09-02 HIKARI 텍스트호버 함수
/**
 * 해당 함수를 적용하려면 querySelectorAll로 li 요소를 가져와야함
 * 호버시 진행될 이벤트를 (param)안에 넣어주면 알아서 적용됨
 * transition, textColor 함수를 가져와야 적용됨
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

// * 22-08-23 HIKARI 트랜지션 함수
/**
 * 효과줄 변수입력 및 시간 설정
 * @example transition(Btn,"1s")
 */
 function transition(param,second){
    param.style.transition=second;
}

// * 22-08-23 HIKARI 백그라운드 컬러 함수
/**
 * 효과줄 변수 및 백그라운드컬러 설정
 * @example backColor(Btn,"red")
 */
function backColor(param,color){
    param.style.background=color;
}

// * 22-08-23 HIKARI 컬러 함수
/**
 * 효과줄 변수 및 컬러 설정
 * @example textColor(Btn,"red")
 */
function textColor(param,textColor){
    param.style.color=textColor;
}

// * 22-08-23 HIKARI 디스플레이 함수
/**
 * 효과줄 변수 및 컬러 설정
 * @example display(sideBar,"none or block")
 */
 function display(param,state){
    param.style.display=state;
}


