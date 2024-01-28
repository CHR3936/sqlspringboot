<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="css/idfind.css" rel="stylesheet">
</head>
<body>
<div>
<a href="commlist"><img src="img/Betta_original.png"></a>
<form action="idfind" method="post">
<input type="text" placeholder="닉네임을 입력해주세요." name="nick" class="nick_text">
<input type = "submit" value ="아이디 찾기" class = "idfind_Btn"/>
</form>
</div>
<div class="footer">
<a href = "loginform">로그인</a>
<a href = "passfindform">비밀번호 찾기</a>
</div>
</body>
</html>