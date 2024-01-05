<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="http://code.jquery.com/jquery-latest.js?ver=1"></script>
<script src="js/memberjoin.js"></script>
<link href = "css/memberjoinform.css" rel="stylesheet">
<script>



</script>
</head>
<body>
<div class ="container">


  <a href = "commlist" class = "head" >community</a>

	<form id = "myform" action="memberjoin" method="post" modelAttribute="member">
		<div>
			<input type="email" name="id" id="email" class="email" placeholder="이메일" />
			<font id ="emailcheck1"/>
		</div>
			<input type="button" value="메일 인증" id="emailcheck" class = "emailcheck">
		<div>
			<input type="text" id="emaildetail"> 
			<input type="button" value="인증 확인" id="econfirm" >
		</div>
		<div>
		    <input type="text" name="nick" id="nick" class ="nick" placeholder="닉네임"> 
			<font id ="nickcheck1"/>
		</div>
			<input type="button" value="중복 확인" class ="nconfirm">
		<div>
			<input type="text"  name="passwd" id="passwd" class ="passinput" placeholder="비밀번호">
			<font id = "passcheck1"/>
		</div>
		<div>
			<input type = "text" id = "pconfirm" class="passcheckinput" placeholder="비밀번호 확인">
			<font id = "passconfirm1"/>
		</div>		
		<div align="center">
			<input type="submit" value="회원가입" class = "memberjoin">
		</div>
		<div align ="right" class = "low">
		<a href="loginform" style="text-decoration: none" class = "login">로그인</a>
		<a href="idfindform" style="text-decoration: none" class = "idfind">아이디 찾기</a>
  		<a href="passfindform" style="text-decoration: none" class = "passfind">비밀번호 찾기</a>
		</div>
	</form>
	</div>
</body>
</html>