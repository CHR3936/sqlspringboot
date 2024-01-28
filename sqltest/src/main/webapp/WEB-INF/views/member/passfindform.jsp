<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="css/passfind.css" rel="stylesheet">
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script src="js/passfind.js"></script>
</head>
<body>
	<div>
		<a href="commlist"><img src="img/Betta_original.png"></a> <input
			type="email" placeholder="이메일을 입력해주세요." name="id" class="id_text"
			id="id_text"> <input type="button" value="비밀번호 찾기"
			class="passfind_Btn" id="passfind_Btn" />
	</div>
	<div class="footer">
		<a href="loginform">로그인</a> <a href="idfindform">아이디 찾기</a>
	</div>
</body>
</html>