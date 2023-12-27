<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form action="login" method="post" >
<div>
아이디
<input type ="text" name = "id" required="required">
</div>
<div>
비밀번호
<input type = "text" name = "passwd" required="required">
</div>
<div>
<input type = "submit" value = "로그인">

<input type = "button" value = "회원가입" onclick = "location.href='memberjoinform'">
<input type = "button" value = "취소" onclick="location.href = 'commlist'">
</div>
</form>

</body>
</html>