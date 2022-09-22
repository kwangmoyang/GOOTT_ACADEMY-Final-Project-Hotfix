let category = document.querySelectorAll(".board_category ul li a")

textHover(category);

function textColor(param,textColor){
    param.style.color=textColor;
}

function transition(param,second){
    param.style.transition=second;
}

function textHover(param){
    for(let i=0; i<param.length; i++){
        param[i].addEventListener('mouseover',function(){
            textColor(param[i],"rgba(248,58,37,1)");
            transition(param[i],".5s");
    
            param[i].addEventListener('mouseout',function(){
            textColor(param[i],"rgba(25, 25, 25, 1)");
            transition(param[i],"1s");
            })
        })
    }
}


