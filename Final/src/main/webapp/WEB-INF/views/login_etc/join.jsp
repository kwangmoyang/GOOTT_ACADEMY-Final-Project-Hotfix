<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<!DOCTYPE html>
<html lang="UTF-8">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="resources/css/join.css?after">
    <!-- 유니콘 아이콘 사이트 -->
    <link rel="stylesheet" href="https://unicons.iconscout.com/release/v4.0.0/css/line.css">
    <script type="module" src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.esm.js"></script>
    <link rel="icon" href="${Path}/resources/img/HotFavicon.png" type="image/png">
    
    <title>HOTFIX - Easy Solution For You</title>
</head>
<script src="http://code.jquery.com/jquery-3.6.0.min.js"></script>
<body>
    <div class="join_Container">
        <div class="join_Div">
            <div class="joinLogo">
                <img src="resources/img/HOT.png" alt="" srcset="">
            </div>
            <div class="join_header">
                <h1>핫픽스에 오신것을 환영합니다.</h1>
            </div>
            <div class="join_Login">
                이미 회원이신가요? &nbsp;<a href="/login">로그인 하기</a>
            </div>

            <!-- ========== 회원가입 정보입력 영역 ========== -->
            <form id="joinForm" name="join_Form" method="POST" >
                <div class="join_id">
                    <h4>아이디</h4>
                    <input type="text" name="User_id" id="hotID" placeholder="영문 또는 영문,숫자 조합 7~15자 이내">
                    <p id="hotID_alert">${idfalse }</p>
                </div>
                <div class="join_pw">
                    <h4>비밀번호</h4>
                    <input type="password" name="User_pw" id="hotPW" placeholder="영문, 숫자, 특수문자 조합 9자 이상">
                    <p id="hotPW_alert"></p>
                </div>
                <div class="join_pwcheck">
                    <h4>비밀번호 재확인</h4>
                    <input type="password" name="hotPW_Check" id="hotPW_Check" placeholder="비밀번호 재입력">
                    <p id="hotPWCK_alert"></p>
                </div>
                <div class="join_email">
                    <h4>이메일</h4>
                    <input type="text" name="Email_address" id="hotEmail_ID">@<input type="text" name="hotEmail_Add" id="hotEmail_Add">
                    <select name="email_sel" id="email_sel" onchange="hotDomain();">
                        <option value="">선택</option>
                        <option value="">직접입력</option>
                        <option value="naver.com">naver.com</option>
                        <option value="gmail.com">gmail.com</option>
                        <option value="daum.net">daum.net</option>
                    </select>
                    <p id="hotEM_alert"></p>
                </div>
                <div class="join_name">
                    <h4>이름</h4>
                    <input type="text" name="User_name" id="hotName" placeholder="이름">
                    <p id="hotNM_alert"></p>
                </div>
                <div class="join_nickname">
                    <h4>닉네임</h4>
                    <input type="text" name="User_nickname" id="hotNick" placeholder="특수문자 제외 2~12자 이내">
                    <p id="hotNK_alert">${nickfalse }</p>
                </div>
                <div class="join_phone">
                    <h4>핸드폰번호</h4>
                    <select name="phone1" id="phone1">
                        <option value="010">010</option>
                        <option value="011">011</option>
                    </select>
                    <input id="phone2" name="phone2" type="text" placeholder="- 빼고 입력하세요">
                    <!-- <p id="hotPH_alert"></p>
                    <input id="phone_check" type="submit" value="인증번호 받기">
                    <input id="number_Write" type="text" name="" placeholder="인증번호를 입력하세요">
                    <input id="number_Check" type="button" value="확인">-->
                    <p id="hotPH_alert"></p>
                </div>

                <div class="join_consent">
                    <input type="checkbox" id="clause">
                    <span id="agree">&nbsp;서비스이용약관</span>| 
                    <span id="agree2">개인정보처리방침</span>
                    <p id="agreeRead"></p>
                    <!-- <a href=""><span id="agree">&nbsp;서비스이용약관</span></a> |
                    <a href=""><span>개인정보처리방침</span></a> -->
                </div>
                
                <div>
                <p id="agreeRead"></p>
                </div>

                <div class="join_Btn">
                    <input type="button" id="join_submit" onclick="joinForm_check();" value="가입하기">
                </div>

            </form>

	           <!-- <h4 class="sns_header">SNS 회원가입</h4>

             ========== SNS 회원가입 영역 ========== 
            <form id="SNSjoin_Form" method="POST">
                <div class="join_sns">
                    <li><a href=""><img src="resources/img/네이버 로고.png" alt="" srcset=""></a></li>
                    <li><a href=""><img src="resources/img/구글 로고.png" alt="" srcset=""></a></li>
                    <li><a href=""><img src="resources/img/카카오톡 로고 라운드.png" alt="" srcset=""></a></li>
                    <li><a href=""><img src="resources/img/깃허브 로고.png" alt="" srcset=""></a></li>
                </div>
            </form> -->
        </div>
    </div>


<!-- ====================== 서비스이용약관 모달창 ====================== -->
<div class="join_modal">
    <div class="join_modal2">
    	<div><ion-icon name="close-outline" id="join_xicon"></ion-icon></div>
        <div class="agreetitle"><p>서비스이용약관</p></div>
        <div class="agreecheck">
          <div class="agreecheckp">
        	<p>제1조(목적) 이 약관은 업체 회사(전자상거래 사업자)가 운영하는 업체 사이버에서 제공하는 인터넷 관련 서비스(이하 “서비스”라 한다)
        	를 이용함에 있어 사이버 몰과 이용자의 권리․의무 및 책임사항을 규정함을 목적으로 합니다.</p><br>
 	
			 <p>※「PC통신, 무선 등을 이용하는 전자상거래에 대해서도 그 성질에 반하지 않는 한 이 약관을 준용합니다.」</p><br>
			 
			<p>제2조(정의)</p>
			 
			<p>① “몰”이란 업체 회사가 재화 또는 용역(이하 “재화 등”이라 함)을 이용자에게 제공하기 위하여 컴퓨터 등 정보통신설비를 이용하여 재화 등을 거래할 수 있도록 설정한 가상의 영업장을 말하며, 
			  아울러 사이버몰을 운영하는 사업자의 의미로도 사용합니다.</p>
			 <br>
			  <p>② “이용자”란 “몰”에 접속하여 이 약관에 따라 “몰”이 제공하는 서비스를 받는 회원 및 비회원을 말합니다.</p><br>
			 
			  <p>③ ‘회원’이라 함은 “몰”에 회원등록을 한 자로서, 계속적으로 “몰”이 제공하는 서비스를 이용할 수 있는 자를 말합니다.</p><br>
			 
			  <p>④ ‘비회원’이라 함은 회원에 가입하지 않고 “몰”이 제공하는 서비스를 이용하는 자를 말합니다.<p><br>
			 
			<p>제3조 (약관 등의 명시와 설명 및 개정) <p><br>
			 
			 <p> ① “몰”은 이 약관의 내용과 상호 및 대표자 성명, 영업소 소재지 주소(소비자의 불만을 처리할 수 있는 곳의 주소를 포함), 
			 전화번호․모사전송번호․전자우편주소, 사업자등록번호, 통신판매업 신고번호, 개인정보관리책임자 등을 이용자가 쉽게 알 수 있도록 00 사이버몰의 초기 서비스화면(전면)에 게시합니다. 
			 다만, 약관의 내용은 이용자가 연결화면을 통하여 볼 수 있도록 할 수 있습니다.<p><br>
			 
			 <p>② “몰은 이용자가 약관에 동의하기에 앞서 약관에 정하여져 있는 내용 중 청약철회․배송책임․환불조건 등과 같은 중요한 내용을 이용자가 이해할 수 있도록 
			 별도의 연결화면 또는 팝업화면 등을 제공하여 이용자의 확인을 구하여야 합니다.</p><br>
			 
			 <p> ③ “몰”은 「전자상거래 등에서의 소비자보호에 관한 법률」, 「약관의 규제에 관한 법률」, 「전자문서 및 전자거래기본법」, 「전자금융거래법」, 「전자서명법」, 「
			  정보통신망 이용촉진 및 정보보호 등에 관한 법률」, 「방문판매 등에 관한 법률」, 「소비자기본법」 등 관련 법을 위배하지 않는 범위에서 이 약관을 개정할 수 있습니다.</p><br>
			 
			  <p>④ “몰”이 약관을 개정할 경우에는 적용일자 및 개정사유를 명시하여 현행약관과 함께 몰의 초기화면에 그 적용일자 7일 이전부터 적용일자 전일까지 공지합니다.
			   다만, 이용자에게 불리하게 약관내용을 변경하는 경우에는 최소한 30일 이상의 사전 유예기간을 두고 공지합니다.  이 경우 "몰“은 개정 전 내용과 개정 후 내용을 명확하게 비교하여 이용자가 알기 쉽도록 표시합니다. </p><br>
			 
			 <p> ⑤ “몰”이 약관을 개정할 경우에는 그 개정약관은 그 적용일자 이후에 체결되는 계약에만 적용되고 그 이전에 이미 체결된 계약에 대해서는 개정 전의 약관조항이 그대로 적용됩니다. 
			  다만 이미 계약을 체결한 이용자가 개정약관 조항의 적용을 받기를 원하는 뜻을 제3항에 의한 개정약관의 공지기간 내에 “몰”에 송신하여 “몰”의 동의를 받은 경우에는 개정약관 조항이 적용됩니다.</p><br>
			 
			 <p> ⑥ 이 약관에서 정하지 아니한 사항과 이 약관의 해석에 관하여는 전자상거래 등에서의 소비자보호에 관한 법률, 약관의 규제 등에 관한 법률, 
			  공정거래위원회가 정하는 「전자상거래 등에서의 소비자 보호지침」 및 관계법령 또는 상관례에 따릅니다.</p><br>
			 
			<p>제4조(서비스의 제공 및 변경) </p><br>
			 
			 <p> ① “몰”은 다음과 같은 업무를 수행합니다.</p><br>
			 
			   <p> 1. 재화 또는 용역에 대한 정보 제공 및 구매계약의 체결</p><br>
			  <p> 2. 구매계약이 체결된 재화 또는 용역의 배송</p><br>
			   <p> 3. 기타 “몰”이 정하는 업무</p><br>
			 
			  <p>② “몰”은 재화 또는 용역의 품절 또는 기술적 사양의 변경 등의 경우에는 장차 체결되는 계약에 의해 제공할 재화 또는 용역의 내용을 변경할 수 있습니다. 
			  이 경우에는 변경된 재화 또는 용역의 내용 및 제공일자를 명시하여 현재의 재화 또는 용역의 내용을 게시한 곳에 즉시 공지합니다.</p><br>
			 
			  <p>③ “몰”이 제공하기로 이용자와 계약을 체결한 서비스의 내용을 재화 등의 품절 또는 기술적 사양의 변경 등의 사유로 변경할 경우에는 그 사유를 이용자에게 통지 가능한 주소로 즉시 통지합니다. </p><br>
			 
			 <p> ④ 전항의 경우 “몰”은 이로 인하여 이용자가 입은 손해를 배상합니다. 다만, “몰”이 고의 또는 과실이 없음을 입증하는 경우에는 그러하지 아니합니다.</p><br>
			 
			<p>제5조(서비스의 중단) <p><br>
			 
			 <p> ① “몰”은 컴퓨터 등 정보통신설비의 보수점검․교체 및 고장, 통신의 두절 등의 사유가 발생한 경우에는 서비스의 제공을 일시적으로 중단할 수 있습니다.</p><br>
			 
			  <p>② “몰”은 제1항의 사유로 서비스의 제공이 일시적으로 중단됨으로 인하여 이용자 또는 제3자가 입은 손해에 대하여 배상합니다. 
			  단, “몰”이 고의 또는 과실이 없음을 입증하는 경우에는 그러하지 아니합니다.</p><br>
			 
			 <p> ③ 사업종목의 전환, 사업의 포기, 업체 간의 통합 등의 이유로 서비스를 제공할 수 없게 되는 경우에는 “몰”은 제8조에 정한 방법으로 이용자에게 통지하고 당초 “몰”에서 제시한 조건에 따라 소비자에게 보상합니다. 
			  다만, “몰”이 보상기준 등을 고지하지 아니한 경우에는 이용자들의 마일리지 또는 적립금 등을 “몰”에서 통용되는 통화가치에 상응하는 현물 또는 현금으로 이용자에게 지급합니다.</p><br>
			  ...
			 </div>
        </div>
        <div class="agree_btn">
                <button>모두 동의합니다.</button>
        </div>
    </div>
</div>


<!-- ====================== 개인정보처리방침 모달창 ====================== -->
<div class="join_modal3">
    <div class="join_modal4">
    	<div><ion-icon name="close-outline" id="join_xicon2"></ion-icon></div>
        <div class="agreetitle"><p>개인정보처리방침</p></div>
        <div class="agreecheck">
          <div class="agreecheckp">
	                    <p>개인정보처리방침</p>
	                    <br>
	                    <br>
	                    <p>[차례]</p>
	                    <p>1. 총칙</p>                    
	                    <p>2. 개인정보 수집에 대한 동의</p>
	                    <p>3. 개인정보의 수집 및 이용목적</p>
	                    <p>4. 수집하는 개인정보 항목</p>
	                    <p>5. 개인정보 자동수집 장치의 설치, 운영 및 그 거부에 관한 사항</p>
	                    <p>6. 목적 외 사용 및 제3자에 대한 제공</p>
	                    <p>7. 개인정보의 열람 및 정정</p>
	                    <p>8. 개인정보 수집, 이용, 제공에 대한 동의철회</p>
	                    <p>9. 개인정보의 보유 및 이용기간</p>
	                    <p>10. 개인정보의 파기절차 및 방법</p>
	                    <p>11. 아동의 개인정보 보호</p>
	                    <p>12. 개인정보 보호를 위한 기술적 대책</p>
	                    <p>13. 개인정보의 위탁처리</p>
	                    <p>14. 의겸수렴 및 불만처리</p>
	                    <p>15. 부 칙(시행일)</p> 
	                    <br>
	                    <p>1. 총칙</p>
	                    <br>
	                    <p>본 업체 사이트는 회원의 개인정보보호를 소중하게 생각하고, 회원의 개인정보를 보호하기 위하여 항상 최선을 다해 노력하고 있습니다. </p>
	                    <p>1) 회사는 「정보통신망 이용촉진 및 정보보호 등에 관한 법률」을 비롯한 모든 개인정보보호 관련 법률규정을 준수하고 있으며, 관련 법령에 의거한 개인정보처리방침을 정하여 이용자 권익 보호에 최선을 다하고 있습니다.</p>
	                    <p>2) 회사는 「개인정보처리방침」을 제정하여 이를 준수하고 있으며, 이를 인터넷사이트 및 모바일 어플리케이션에 공개하여 이용자가 언제나 용이하게 열람할 수 있도록 하고 있습니다.</p>
	                    <p>3) 회사는 「개인정보처리방침」을 통하여 귀하께서 제공하시는 개인정보가 어떠한 용도와 방식으로 이용되고 있으며 개인정보보호를 위해 어떠한 조치가 취해지고 있는지 알려드립니다.</p>
	                    <p>4) 회사는 「개인정보처리방침」을 홈페이지 첫 화면 하단에 공개함으로써 귀하께서 언제나 용이하게 보실 수 있도록 조치하고 있습니다.</p>
	                    <p>5) 회사는  「개인정보처리방침」을 개정하는 경우 웹사이트 공지사항(또는 개별공지)을 통하여 공지할 것입니다.</p>
	                    <br>
	                    <p>2. 개인정보 수집에 대한 동의</p>
	                    <br>
	                    <p>귀하께서 본 사이트의 개인정보보호방침 또는 이용약관의 내용에 대해 「동의 한다」버튼 또는 「동의하지 않는다」버튼을 클릭할 수 있는 절차를 마련하여, 「동의 한다」...</p>
			  ...
			 </div>
        </div>
    </div>
</div>




</body>

<script src="resources/js/join.js"></script>

</html>