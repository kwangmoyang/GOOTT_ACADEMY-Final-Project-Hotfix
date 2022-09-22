<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="../resources/css/BasicFrame.css">
    <link rel="stylesheet" href="../resources/css/myPage.css">
    <link rel="stylesheet" href="../resources/css/global.css">
    <link rel="stylesheet" href="../resources/css/MainPage.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@8/swiper-bundle.min.css" />
    <script src="https://cdn.jsdelivr.net/npm/swiper@8/swiper-bundle.min.js"></script>
    <!-- 유니콘 아이콘 사이트 -->
    <link rel="stylesheet" href="https://unicons.iconscout.com/release/v4.0.0/css/line.css">
    <title>HOTFIX</title>

</head>

<body>

      <%@ include file="/WEB-INF/views/header/header.jsp" %>
    <div class="container">
        <!-- ======================== 작업 섹션 ======================= -->
        <!-- <div class="common_section"> -->
        <!-- 왼쪽 사이드 -->
        <!-- <div class="sideLeft">
            <div class="myList">
                <ul>
                    <li>
                        <div>

                        </div>
                    </li>
                    <li>
                        닉네임
                        <p>잉잉잉의</p>
                        회원 고유번호
                        <p>#9877</p>
                    </li>
                    <li>마이페이지</li>
                    <li>정보 수정</li>
                    <li>나의 작성글</li>
                    <li>결제 및 정산</li>
                </ul>

            </div>
        </div> -->
        <!-- 메인섹션 -->
        <div class="mains">
            <div id="main_big_preview">
                <div class="swiper mySwiper">
                    <div class="swiper-wrapper">
                        <!-- 일단 테스트 이미지고 향후 이벤트배너등으로 활용가능 -->
                        <div class="swiper-slide"><img src="../resources/img/TestImage/testImage1.jpeg" alt=""></div>
                        <div class="swiper-slide"><img src="../resources/img/TestImage/testImage2.jpeg" alt=""></div>
                        <div class="swiper-slide"><img src="../resources/img/TestImage/testImage3.jpeg" alt=""></div>
                        <div class="swiper-slide"><img src="../resources/img/TestImage/testImage4.jpeg" alt=""></div>
                        <div class="swiper-slide"><img src="../resources/img/TestImage/testImage5.jpeg" alt=""></div>
                        <div class="swiper-slide"><img src="../resources/img/TestImage/testImage6.jpeg" alt=""></div>
                        <div class="swiper-slide"><img src="../resources/img/TestImage/testImage7.jpeg" alt=""></div>
                        <div class="swiper-slide"><img src="../resources/img/TestImage/testImage8.jpeg" alt=""></div>
                        <div class="swiper-slide"><img src="../resources/img/TestImage/testImage9.jpeg" alt=""></div>
                    </div>
                    <div class="swiper-button-next"></div>
                    <div class="swiper-button-prev"></div>
                    <div class="swiper-pagination"></div>
                </div>
            </div>
            <!-- <div id="big_preview">
            <div id="hotfix_preview_title">
                <img src="../resources/img/HOT.png" alt="" class="preview_logo">
                <div>NEW HOTFIX</div>
            </div>
            <div id="hotfix_preview_content">
            </div>
        </div> -->

            <!-- 나중에 onclick 제거할것 -->
            <!-- content_item은 보여줘야해서 늘려놓음 preview_content칸 안에서 6개들어감-->
            <div id="main_community_preview">
                <div id="fir_com_preview">
                    <div id="request_preview">
                        <div class="preview_title"  onclick="location.href='resolveMain.html'"><span>REQUEST(밋밋해서)</span></div>
                        <div class="preview_content">
                            <div class="content_item">
                                <div class="item_writer"><span>구트1년차 </span><span>활동점수10 30분전</span></div>
                                <div class="item_info"><span>0댓글</span></div>
                                <div class="item_title"><span>이거좀도와주십쇼</span></div>
                            </div>
                            <div class="content_item">
                                <div class="item_writer"><span>구트2년차 </span><span>활동점수200 2시간전</span></div>
                                <div class="item_info"><span>1댓글</span></div>
                                <div class="item_title"><span>아진짜어떡하지</span></div>
                            </div>
                            <div class="content_item">
                                <div class="item_writer"><span>구트3년차 </span><span>활동점수340 3시간전</span></div>
                                <div class="item_info"><span>3댓글</span></div>
                                <div class="item_title"><span>집에가고싶습니다</span></div>
                            </div>
                            <div class="content_item">
                                <div class="item_writer"><span>구트4년차 </span><span>활동점수120 4시간전</span></div>
                                <div class="item_info"><span>0댓글</span></div>
                                <div class="item_title"><span>4년차이상만답해주세요</span></div>
                            </div>
                            <div class="content_item">
                                <div class="item_writer"><span>구트5년차 </span><span>활동점수70 5시간전</span></div>
                                <div class="item_info"><span>8댓글</span></div>
                                <div class="item_title"><span>이거해결하면100만원</span></div>
                            </div>
                            <div class="content_item">
                                <div class="item_writer"><span>구트6년차 </span><span>활동점수7000 8시간전</span></div>
                                <div class="item_info"><span>2댓글</span></div>
                                <div class="item_title"><span>어렵네요</span></div>
                            </div>
                        </div>
                    </div>
                    <div id="board1_preview">
                        <div class="preview_title" onclick="location.href='board/lifeBoard.html'"><span>일상</span></div>
                        <div class="preview_content">
                            <div class="content_item">
                                <div class="item_writer"><span>가을타나봐 </span><span>활동점수50 23분전</span></div>
                                <div class="item_info"><span>3댓글</span></div>
                                <div class="item_title"><span>벌써 가을이네요</span></div>
                            </div>
                            <div class="content_item">
                                <div class="item_writer"><span>조용좀합시다</span><span>활동점수113 43분전</span></div>
                                <div class="item_info"><span>1댓글</span></div>
                                <div class="item_title"><span>윗집소음 너무 심해서 미치겠네요</span></div>
                            </div>
                            <div class="content_item">
                                <div class="item_writer"><span>구트13일차 </span><span>활동점수6 50분전</span></div>
                                <div class="item_info"><span>7댓글</span></div>
                                <div class="item_title"><span>개발이 재밌습니다</span></div>
                            </div>
                            <div class="content_item">
                                <div class="item_writer"><span>틀딱개발자</span><span>활동점수230 1시간전</span></div>
                                <div class="item_info"><span>12댓글</span></div>
                                <div class="item_title"><span>jQuery진짜 끝났나요?</span></div>
                            </div>
                            <div class="content_item">
                                <div class="item_writer"><span>비오네빌런</span><span>활동점수50 3시간전</span></div>
                                <div class="item_info"><span>3댓글</span></div>
                                <div class="item_title"><span>오늘비오네요</span></div>
                            </div>
                            <div class="content_item">
                                <div class="item_writer"><span>조용좀합시다</span><span>활동점수210 5시간전</span></div>
                                <div class="item_info"><span>1댓글</span></div>
                                <div class="item_title"><span>집에가고싶습니다</span></div>
                            </div>
                        </div>
                    </div>
                </div>
                <div id="sec_com_preview">
                    <div id="team_preview">
                        <div class="preview_title" onclick="location.href='team/teamlist.html'"><span>TEAM(디자인
                                넣어야함)</span></div>
                        <div class="preview_content">
                            <div class="content_item">
                                <div class="item_writer"><span>구트1년차 </span><span>활동점수10 30분전</span></div>
                                <div class="item_info"><span>0댓글</span></div>
                                <div class="item_title"><span>초급개발자 서로 알려줘요</span></div>
                            </div>
                            <div class="content_item">
                                <div class="item_writer"><span>구트2년차 </span><span>활동점수200 2시간전</span></div>
                                <div class="item_info"><span>1댓글</span></div>
                                <div class="item_title"><span>3년차 이상 백엔드팀원 구함</span></div>
                            </div>
                            <div class="content_item">
                                <div class="item_writer"><span>구트3년차 </span><span>활동점수340 3시간전</span></div>
                                <div class="item_info"><span>3댓글</span></div>
                                <div class="item_title"><span>이직정보공유</span></div>
                            </div>
                        </div>
                    </div>
                    <div id="board2_preview">
                        <div class="preview_title"><span>기본틀(원하는게시판)</span></div>
                        <div class="preview_content">
                            <div class="content_item">
                                <div class="item_writer"><span>작성자 </span><span>활동점수# #분전</span></div>
                                <div class="item_info"><span>#댓글</span></div>
                                <div class="item_title"><span>제목</span></div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- 오른쪽 사이드 -->
        <!-- <div class="sideRight">

        </div> -->

        <!-- 상단 스크롤 이동 -->
        <!-- <div class="toTop"><i class="uil uil-arrow-circle-up"></i></div> -->

        <!-- </div> -->



    </div>
    <!-- 푸터 -->
    <div class="common_footer">
        <div></div>
        <div></div>
        <div></div>
    </div>

</body>

<script src="../resources/js/BasicFrame.js"></script>
<script src="../resources/js/MainPage.js"></script>

</html>