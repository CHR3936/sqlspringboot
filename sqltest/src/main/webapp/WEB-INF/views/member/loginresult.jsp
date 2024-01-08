<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<c:if test="${result == -1 }">
<script>
	alert("회원가입되지 않은 회원입니다.");
	history.go(-1);
</script>
</c:if>
<c:if test="${result == -2 }">
	<script>
	alert("아이디나 비밀번호가 틀렸습니다.");
	history.go(-1);
	</script>
</c:if>
</body>
</html>