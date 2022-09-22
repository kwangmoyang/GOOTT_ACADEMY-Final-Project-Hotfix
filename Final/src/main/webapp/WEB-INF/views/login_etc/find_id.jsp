<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="../../resources/css/find.css">
    <title>find_id</title>
</head>

<body>
    <div class="find_Container">
        <div class="find_Div">
            <div class="findLogo">
                <img src="../../resources/img/HOT.png" alt="" srcset="">
            </div>
            <div class="find_Header">
                <h1>아이디 / 비밀번호 찾기</h1>
            </div>
            <div class="find_Area">
                <input type="button" value="아이디 찾기" onclick="location.href='find_id.html'">
                <input type="button" value="비밀번호 찾기" onclick="location.href='find_pw.html'">
            </div>
            <div class="find_ChoiceId">
                <h4>아이디를 잊으셨나요?</h4>
                <h4>아래 방법 중 하나를 선택해주세요.</h4>
            </div>
            <div class="find_Email">
                <h4>등록된 이메일로 찾기</h4>
                <input type="text" name="" id="" placeholder="이름">
                <input type="email" name="" id="" placeholder="이메일을 입력해주세요">
            </div>
            <div class="find_Phone">
                <h4>등록된 핸드폰번호로 찾기</h4>
                <input type="text" name="" id="" placeholder="이름">
                <input id="find_Phone1" type="text" size="1" maxlength="3" oninput="changePhone1()"> -
                <input id="find_Phone2" type="text" size="3" maxlength="4" oninput="changePhone2()"> -
                <input id="find_Phone3" type="text" size="3" maxlength="4" oninput="changePhone3()">
            </div>

            <div class="find_BtnId">
                <input id="find_BtnId1" type="submit" value="취소" onclick="location.href='login.html'">
                <input id="find_BtnId2" type="submit" value="확인">
            </div>

        </div>
    </div>
</body>


</html>