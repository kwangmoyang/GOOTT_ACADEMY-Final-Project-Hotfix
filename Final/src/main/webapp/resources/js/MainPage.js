var swiper = new Swiper(".mySwiper", {
    spaceBetween: 30,
    centeredSlides: true,
    autoplay: {
      delay: 2500,
      disableOnInteraction: false,
    },
    pagination: {
      el: ".swiper-pagination",
      clickable: true,
    },
    navigation: {
      nextEl: ".swiper-button-next",
      prevEl: ".swiper-button-prev",
    },
  });


//==================== 공지사항보기 모달창 ==================== // 

let Main_notice = document.querySelectorAll('#Main_notice');
let Notice_xicon = document.getElementById('Notice_xicon');
let Notice_modal = document.querySelector('.Notice_modal');
let close_btn = document.querySelector('.close_btn');

for(let i=0; i<Main_notice.length; i++){
	Main_notice[i].addEventListener('click', function(){
		 Notice_modal.style.display = 'flex';
		 Notice_xicon.style.display = 'block'; 
	 })
};


Notice_xicon.addEventListener('click',function(){
	 Notice_modal.style.display = 'none';
	 Notice_xicon.style.display = 'none';
})


Notice_modal.addEventListener('click',function(){
	 Notice_modal.style.display = 'none';
	 Notice_xicon.style.display = 'none';
})


close_btn.addEventListener('click',function(){
	 Notice_modal.style.display = 'none';
	 Notice_xicon.style.display = 'none';
}) 



let noticeCont = document.querySelector('.noticeCont');
function NoticeOn(a) {
	 let notice_Con = a; // 공지사항 내용보기
	 noticeCont.innerText = notice_Con;
}

