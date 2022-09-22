<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="../../resources/css/cash.css">
    <!-- 유니콘 아이콘 사이트 -->
    <link rel="stylesheet" href="https://unicons.iconscout.com/release/v4.0.0/css/line.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />
</head>
    <title>HotFix</title>
</head>

<body>
            <!-- 작업 섹션 공간 -->
        <!-- 충전 컨테이너 -->
    <div class="CashContainer">
        <!-- 충전 헤드 파트  -->
        <div class="CashHeader">
            <h2>충전 / 결제</h2>
        </div>
        <!-- 충전 픽스 패키지 -->
        <div class="CashFixtitle">
            <h2>픽스 패키지</h2>
        </div>
        <div class="CashFixWrap">
            <div class="CashFixCon">
                <div class="CashFix">
                    <div class="Fix"><i class="fas fa-wrench"></i>픽스 1개 &nbsp; </div>
                    <div class="Fix"><i class="fas fa-wrench"></i>픽스 10개 </div>
                    <div class="Fix"><i class="fas fa-wrench"></i>픽스 50개 </div>
                    <div class="Fix"><i class="fas fa-wrench"></i>픽스 100개</div>
                </div>
                <div class="CashFix">
                    <div class="Fix"><button>100원</button></div>
                    <div class="Fix"><button>1,000원</button></div>
                    <div class="Fix"><button>5,000원</button></div>
                    <div class="Fix"><button>9,500원</button></div>
                </div>
                <div class="CashFix">
                    <div class="Fix"><i class="fas fa-wrench"></i>픽스 1개 &nbsp; </div>
                    <div class="Fix"><i class="fas fa-wrench"></i>픽스 10개 </div>
                    <div class="Fix"><i class="fas fa-wrench"></i>픽스 50개 </div>
                    <div class="Fix"><i class="fas fa-wrench"></i>픽스 100개</div>
                </div>
                <div class="CashFix">
                    <div class="Fix"><button>100원</button></div>
                    <div class="Fix"><button>1,000원</button></div>
                    <div class="Fix"><button>5,000원</button></div>
                    <div class="Fix"><button>9,500원</button></div>
                </div>

            </div>

        </div>
        <!-- 결제 수단 -->
        <h2>결제 수단 선택</h2>
        <div class="CashOption">
            <div class="CashPayment">
                <input type="radio">
                <img src="../../resources/img/kakaopay.png" alt="">
            </div>
            <div class="CashPayment">
                <input type="radio">
                <img src="../../resources/img/naverPay.png" alt="">
            </div>

        </div>
        <!-- 결제인 정보 -->
        <h2>결제인 정보</h2>
        <div class="CashInpo">
            <div class="CashPhone">
                <span>휴대폰 번호
                    <input type="text"> - <input type="text"> - <input type="text">
                </span>
                <span>이메일
                    <input type="text">
                </span>
                <p>결제 완료된 정보가 SMS와 이메일로 발송됩니다.</p>
                <div class="PayBtnBox">
                    <button class="PayBtn">결제하기</button>
                </div>
            </div>

        </div>

    </div>

        <!-- ============================ -->

       

</body>

<script src="../../resources/js/BasicFrame.js"></script>

</html>