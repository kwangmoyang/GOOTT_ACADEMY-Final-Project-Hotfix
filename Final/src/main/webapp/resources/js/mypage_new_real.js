
// 22-07-17 HIKARI
// side bar 마이페이지 텍스트 호버 함수
// 해당 함수는 mypage 폴더내의 모든 파일들과 연관있음
let myPage_side_text = document.querySelectorAll(".myli>a");
textHover(myPage_side_text);




// ! =====================함수존=======================


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
            console.log("ok");
    
            param[i].addEventListener('mouseout',function(){
            textColor(param[i],"rgba(25, 25, 25, 1)");
            transition(param[i],"1s");
            console.log("ok");
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