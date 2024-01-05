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
<c:if test="${result == 1 }">
<script>
alert("회원 가입 성공");
location.href= "loginform";
</script>
</c:if>
<c:if test="${result != 1 }">
<script>
alert("회원 가입 실패);
location.href="memberjoinform";
</script>
</c:if>
</body>
</html>