<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="../../resources/css/withdrawal.css">
    <link rel="stylesheet" href="https://unicons.iconscout.com/release/v4.0.0/css/line.css">
    
  

    <title>Document</title>
</head>
<body>
    <div class="WdContainer">
        <div class="WdSubtitle">
                <h1>인출</h1>
                <i class="uil uil-times"></i>
        </div>
        <div class="WdSection">
            <div class="WdPoint">
                <span>인출 가능한 충전픽스</span>
                <span>0원</span>
            </div>
            <div class="WdPoint withdrawal">
                <span>인출할 충전픽스
                    <input type="text" placeholder="본인 명의 계좌만 인출가능">
                </span>
                <button>전액신청</button>
            </div>
            <div class="WdPoint Wdemail">
                <span>이메일</span>
                <span>abcdef@naver.com
                    <i class="uil uil-angle-right-b"></i>
                </span>
            </div>
            <div class="WdPoint withdrawal">
                <span>계좌
                    <input type="text" placeholder="등록된 계좌가 없습니다">
                </span>
                <button>계좌등록</button>
            </div>
            <div class="WdPoint guide">
                <span>인출신청 안내</span>
                <span><i class="uil uil-angle-up"></i></span>
            </div>
            <div class="WdguideText">
                <ul>
                    <li>인출 시 등록하신 계좌로 바로 입금됩니다.</li>
                    <li>유상수단으로 충전한 충전픽스만 인출이 가능합니다.</li>
                    <li>충전픽스는 2,500원 이상부터 500원 단위로 인출하실 수 있습니다.
                        잔액이 2,500원 미만인 경우에는 인출이 불가능합니다
                    </li>
                    <li>본인명의의 계좌가 아닌 경우 인출이 제한됩니다</li>
                </ul>
            </div>
        </div>
        <button class="WdrequestBtn">신청하기</button>
        <script>
            let angle = document.querySelector('.uil-angle-up');
            let WdguideText = document.querySelector('.WdguideText');
            let isClick = 0;

            angle.addEventListener('click', function(){
                if(isClick == 0) {
                    WdguideText.style = "display : block";
                    angle.className = "uil-angle-up"
                    isClick =1;

                } else if(isClick ==1) {
                    WdguideText.style = "display : none";
                    angle.className = "uil-angle-down"
                    isClick =0;
                }

            })
            

        

        </script>
    </div>
</body>
</html>