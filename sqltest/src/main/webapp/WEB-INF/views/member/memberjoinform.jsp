<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form action = "memberjoin" method="post" modelAttribute = "member">
<label>아이디</label>
<input type="text" name="id"class="form-control" placeholder="아이디를 입력해주세요"/>  
<div>
닉네임 : 
<input type = "text" name = "nick" >
</div>
<div>
비밀번호 :
<input type = "text" name = "passwd" >
</div>
<div>
<input type ="submit" value = "회원가입" >
<input type = "button" value = "취소"
onclick="location.href='commlist'">
</div>
</form>
</body>
</html>