<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- 메인 프레임 연동-->
    <link rel="stylesheet" href="../../resources/css/BasicFrame.css">
    <link rel="stylesheet" href="../../resources/css/myPage_pay.css">
    <!-- 폰트 불러올라고-->
    <link rel="stylesheet" href="../../resources/css/global.css">
    <!-- 유니콘 아이콘 사이트 -->
    <link rel="stylesheet" href="https://unicons.iconscout.com/release/v4.0.0/css/line.css">
    <title>HotFix</title>
</head>

<body>

      <%@ include file="/WEB-INF/views/header/header.jsp" %>

    <div class="container">
    <!-- ======================== 작업 섹션 ======================= -->
    <div class="common_section">
        <!-- 왼쪽 사이드 -->
        <div class="sideLeft">
            <div class="myList">
                <ul>
                    <li>
                        <div>
                            
                        </div>
                    </li>
                    <li>
                        <p>잉잉잉의</p>
                        <p>#9877</p>
                    </li>
                    <li class="myli"><a href="mypage.html">마이페이지</a></li>
                    <li class="myli"><a href="mypage_set.html">정보 수정</a></li>
                    <li class="myli"><a href="mypage_writer.html">나의 작성글</a></li>
                    <li class="myli"><a href="mypage_pay.html">결제 및 정산</a></li>
                </ul>
            </div>
        </div>
        <!-- 메인섹션 -->
        <div class="main">
            <!-- 
                *22-08-22 HIKARI
                *** 테스트시  <div class="main"> 하고 테스트 할 것
            -->
            <!-- ==============작업공간============== -->
            <div class="dpContainer">
                <div class="dpSubBox">
                  <div class="dpGetPoint">
                    <h2>보유 픽스</h2>
                    <span>100 Fix <span>
                     
                 </div>
                 <div class="dpGetPoint">
                    <h2>해결 픽스</h2>
                    <span>50 Fix <span>
                 </div>
                 <div class="dpGetPoint">
                    <h2>총 보유 픽스</h2>
                    <span>150 Fix <span>   
                 </div>
            
                </div>
                <div class="charge">
                    <button>충전</button>
                    <button>정산</button>
                </div>
                <div class="dpListDate"> 
                    <span>충전/사용/적립/정산 내역 조회</span>
                    <input type="date"> ~ <input type="date"> 
                        <select name="pointList">
                            <option value="" selected="selected">전체 상태</option>
                            <option value="사용">사용</option>
                            <option value="적립">적립</option>
                            <option value="정산">정산</option>
                            <option value="충전">충전</option>
                        </select>
                        <button>조회<i class="fas fa-search"></i></button>
                    </div>
                    <h2 class="dpListTitle">2022년 8월</h2>
                    <div class="dpList">
                        <div class="dpListLeft">
                            <div class="dpListCir">
                                <h2>사용</h2>
                            </div>
                        </div>
                        <div class="dpListMid">
                            <span>2022.08.12</span>
                            <span>해결요청 시 사용</span>
                            <span>HOT FIX 해결 요청</span>
                        </div>
                        <div class="dpListRight">
                            <span>-50Fix</span>
                            <button>내역삭제</button>
                        </div>
                    </div> 
                    <div class="dpList save">
                        <div class="dpListLeft">
                            <div class="dpListCir">
                                <h2>적립</h2>
                            </div>
                        </div>
                        <div class="dpListMid">
                            <span>2022.08.22</span>
                            <span>해결완료 시 적립</span>
                            <span>HOT FIX 해결 완료</span>
                        </div>
                        <div class="dpListRight">
                            <span>+100Fix</span>
                            <button>내역삭제</button>
                        </div>
                    </div> 
                    <h2 class="dpListTitle">2022년 9월</h2>
                    <div class="dpList charge">
                        <div class="dpListLeft">
                            <div class="dpListCir">
                                <h2>충전</h2>
                            </div>
                        </div>
                        <div class="dpListMid">
                            <span>2022.09.12</span>
                            <span>충전</span>
                            <span>FIX 충전</span>
                        </div>
                        <div class="dpListRight">
                            <span>+50Fix</span>
                            <button>내역삭제</button>
                        </div>
                    </div> 
                    <div class="dpList get">
                        <div class="dpListLeft">
                            <div class="dpListCir">
                                <h2>정산</h2>
                            </div>
                        </div>
                        <div class="dpListMid">
                            <span>2022.09.12</span>
                            <span>정산</span>
                            <span>FIX 정산</span>
                        </div>
                        <div class="dpListRight">
                            <span>-150Fix</span>
                            <button>내역삭제</button>
                        </div>
                    </div> 
            </div>
            
            

            
            <!-- ==============작업공간============== -->
        </div>



   
    </div>


    
    </div>
    <!-- 푸터 -->
    <div class="common_footer">푸터임다 d </div>

</body>

<script src="../../resources/js/BasicFrame.js"></script>
<script src="../../resources/js/mypage_new_real.js"></script>

</html>