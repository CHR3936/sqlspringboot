<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script src="js/memberjoin.js"></script>

</head>
<body>
	<form id = "myform" action="memberjoin" method="post" modelAttribute="member">
		<div>
			이메일 : <input type="email" name="id" id="email" class="form-control" />
			<font id ="emailcheck"/>
		</div>
		<div>
			<input type="button" value="메일인증" id="emailcheck">
		</div>
		<div>
			<input type="text" id="emaildetail"> 
			<input type="button" value="인증확인" id="econfirm">
		</div>
		<div>
			닉네임 : <input type="text" name="nick" id="nick"> 
			<font id ="nickcheck"/>
		</div>
		<div>
			<input type="button" value="중복 확인">
		</div>
		<div>
			비밀번호 : <input type="text"  name="passwd" id="passwd">
			<font id = "passcheck"/>
		</div>
		<div>
			비밀번호 확인 : <input type = "text" id = "pconfirm">
			<font id = "passconfirm"/>
		</div>		
		<div align="center">
			<input type="submit" value="회원가입">

		</div>
	</form>
</body>
</html>