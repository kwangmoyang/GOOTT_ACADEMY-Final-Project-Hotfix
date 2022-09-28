//const linkcopy = document.querySelectorAll('.linkcopy');
//const tooltip = document.querySelectorAll('.tooltip');
//const tooltiptwo = document.querySelectorAll('.tooltiptwo');
//
//// tooptip 효과
//
////***마우스를 올렸을 때 이벤트 작동이 조금 불안정한듯함***
//for(let i=0; i<linkcopy.length; i++)
//{
//    /**링크 아이콘에 마우스를 올렸을 때 작동하는 이벤트 */
//    linkcopy[i].addEventListener('mouseover', function(){
//        tooltip[i].classList.add('ani');
//        tooltip[i].style.opacity = '1';
//    })
//}
//
//for(let i=0; i<linkcopy.length; i++)
//{
//    /**링크 아이콘에 마우스를 out했을 때 작동하는 이벤트 */
//    linkcopy[i].addEventListener('mouseout', function(){
//        tooltip[i].classList.remove('ani');
//        tooltip[i].style.opacity = '0';
//        tooltiptwo[i].style.opacity = '0';
//    })
//
//}
//
//for(let i=0; i<tooltip.length; i++)
//{
//    /**링크 아이콘에 마우스를 click했을 때 작동하는 이벤트 */
//    linkcopy[i].addEventListener('click', function(){
//        tooltiptwo[i].style.opacity = '1';
//        tooltip[i].style.opacity = '0';
//    })
//}

//태그 검색 부분
//const plusbtn = document.querySelector(".plusbtn");
//const plustagdiv = document.querySelector(".plustagdiv");
//const closebtn = document.querySelector(".closebtn");
//
//const searchtagbtn = document.querySelectorAll(".select-search-div button");
//const searchtagplusbtn = document.querySelectorAll(".plustag button");


//plusbtn.addEventListener('click', function(){
//    plusbtn.style.display = 'none';
//    plustagdiv.style.display = 'flex';
//});
//
//closebtn.addEventListener('click', function(){
//    plustagdiv.style.display = 'none';
//    plusbtn.style.display = 'block';
//});

//var flag = true;
//
////태그 5개
//for(let i=0; i<searchtagbtn.length; i++){
//    searchtagbtn[i].addEventListener('click', function(e){
//        
//        if(e.target.className == 'searchtagbtn'){
//            searchtagbtn[i].style.backgroundColor = 'rgba(255, 95, 47, 0.906)';
//            searchtagbtn[i].style.color = 'white';
//            searchtagbtn[i].className = 'tagclickbtn1';
//        }
//        
//        else if(e.target.className == 'tagclickbtn1'){
//            searchtagbtn[i].style.backgroundColor = 'buttonface';
//            searchtagbtn[i].style.color = 'black';
//            searchtagbtn[i].className = 'searchtagbtn';
//        }
//        
//    })
//}
//
////나머지 태그
//for(let i=0; i<searchtagplusbtn.length; i++){
//    searchtagplusbtn[i].addEventListener('click', function(e){
//       if(e.target.className == 'searchplusbtn'){
//            searchtagplusbtn[i].style.backgroundColor = 'rgba(255, 95, 47, 0.906)';
//            searchtagplusbtn[i].style.color = 'white';
//
//            //closebtn도 같이 변해서 그거 방지하려고 설정
//            closebtn.style.backgroundColor = 'gainsboro';
//            closebtn.style.color = 'black';
//
//            searchtagplusbtn[i].className = 'tagclickbtn2';
//       }
//       else if(e.target.className == 'tagclickbtn2'){
//            searchtagplusbtn[i].style.backgroundColor = 'buttonface';
//            searchtagplusbtn[i].style.color = 'black';
//
//            //closebtn도 같이 변해서 그거 방지하려고 설정
//            closebtn.style.backgroundColor = 'gainsboro';
//
//            searchtagplusbtn[i].className = 'searchplusbtn';
//        }
//        
//    })
//}