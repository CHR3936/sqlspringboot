<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
img{
	width : 300px;
}
</style>
</head>
<body>
<a href="commlist"><img src="img/Betta01.png"></a>
<h3>개인정보 수정</h3>
<form action="memberedit" method="post" id="editform">
<div>
아이디 : ${sessionScope.nick}
</div>
<div>
비밀번호 : <input type="text" placeholder="비밀번호를 입력해주세요." id = "passwd">
</div>
<div>
<input type = "submit" value =  "확인">
</div>
</form>
</body>
</html>