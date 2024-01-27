<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="css/idfind.css" rel="stylesheet">
<c:if test="${result == -2 }">
<script>
alert("일치하는 정보가 없습니다.");
history.go(-1);
</script>
</c:if>
</head>
<body>
<div>
<a href="commlist"><img src="img/Betta_original.png"></a>
</div>
<div class ="nick_result">아이디는 ${member.id } 입니다.</div>
<input type="button" value="비밀번호 찾기" class="passfind_Btn"
onclick="location.href='passfindform' ">
</body>
</html>