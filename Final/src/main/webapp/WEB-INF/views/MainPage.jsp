<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/BasicFrame.css">
<%--    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/myPage.css">--%>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/global.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/MainPage.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@8/swiper-bundle.min.css" />
    <script src="https://cdn.jsdelivr.net/npm/swiper@8/swiper-bundle.min.js"></script>
    <!-- 유니콘 아이콘 사이트 -->
    <link rel="stylesheet" href="https://unicons.iconscout.com/release/v4.0.0/css/line.css">
    <script type="module" src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.esm.js"></script>
    <title>HOTFIX</title>

</head>

<body>

      <%@ include file="/WEB-INF/views/header/header.jsp" %>

    <div class="container">
        <!-- ======================== 작업 섹션 ======================= -->
  
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
                        <div class="preview_title"  onclick="location.href='hotfix/index'"><span>REQUEST(밋밋해서)</span></div>
                        <div class="preview_content">
                            <c:forEach var="Req" items="${MainPage}">
                            <div class="content_item">
                                <div class="item_writer"><span>${Req.Requester}</span>&nbsp;<span><ion-icon name="flame-sharp"></ion-icon> ${Req.User_score}</span><span>${Req.ReadySolver_cnt}</span></div>
                                <div class="item_info"><span>${Req.Recruiting_time}</span></div>
                                <div class="item_title"><span>${Req.Request_title}</span></div>
                            </div>
                            </c:forEach>
                        </div>
                    </div>
                    <div id="board1_preview">
                        <div class="preview_title" onclick="location.href='community/index'"><span>커뮤니티</span></div>
                        <div class="preview_content">
                            <div class="content_item">
                                <div class="item_writer"><span>가을타나봐 </span><span>활동점수50 23분전</span></div>
                                <div class="item_info"><span>3댓글</span></div>
                                <div class="item_title"><span>벌써 가을이네요</span></div>
                            </div>
                        </div>
                    </div>
                </div>
                <div id="sec_com_preview">
                    <div id="team_preview">
                        <div class="preview_title" onclick="location.href='team/index'"><span>TEAM(디자인
                                넣어야함)</span></div>
                        <div class="preview_content">
                            <div class="content_item">
                                <div class="item_writer"><span>구트1년차 </span><span>활동점수10 30분전</span></div>
                                <div class="item_info"><span>0댓글</span></div>
                                <div class="item_title"><span>초급개발자 서로 알려줘요</span></div>
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