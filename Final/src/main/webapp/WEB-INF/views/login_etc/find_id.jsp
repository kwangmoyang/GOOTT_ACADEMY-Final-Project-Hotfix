<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="../../resources/css/find.css">
    <link rel="icon" href="${Path}/resources/img/HotFavicon.png" type="image/png">
    <title>HOTFIX - Easy Solution For You</title>
</head>

<body>
    <div class="find_Container">
        <div class="find_Div">
            <div class="findLogo">
                <img src="../../resources/img/HOT.png" alt="" srcset="">
            </div>
            <div class="find_Header">
                <h1>아이디  찾기</h1>
            </div>

            <div class="find_ChoiceId">
            	<br>
                <h4>아이디를 잊으셨나요?</h4>
                <h4>가입시 등록한 이메일 주소를 입력해주세요!</h4>
            </div>
            <form action="/find_user_idChk" method="POST">
            <div class="find_Email">
                <h4>정보 입력</h4>
                <input type="email" name="Email_address" id="" value="" placeholder="이메일을 입력해주세요">
            </div>
            <p>${noJoinUser }</p>
            <div class="find_BtnId">
                <input id="find_BtnId2" type="submit" value="확인">
            </div>
			</form>
        </div>
    </div>
</body>


</html>