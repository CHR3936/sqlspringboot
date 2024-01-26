<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
li {
	list-style-type: none;
}

img {
	width: 300px;
}

.login_Btn {
	width: 70px;
	height: 30px;
	border-color: #61A8C4;
	border-radius: 8px;
	font-size: 12px;
	font-weight: bolder;
	font-family: 'Montserrat', sans-serif;
	box-shadow: 0 15px 30px rgba(#e91e63, .36);
	margin-left: 55%;
}

.logout_Btn {
	width: 70px;
	height: 30px;
	border-color: #61A8C4;
	border-radius: 8px;
	font-size: 12px;
	font-weight: bolder;
	font-family: 'Montserrat', sans-serif;
	box-shadow: 0 15px 30px rgba(#e91e63, .36);
}

.mypage {
	margin-left: 55%;
}

.headlist {
	color: #0A58CA;
	font-size: 70px;
	font-weight: bolder;
	letter-spacing: -3px;
	text-decoration: none;
	text-align: center;
}

a {
	text-decoration: none;
}

header {
	background: white;
	border-radius: 5px;
}
</style>
</head>
<body>
	<header>
		<a href="commlist" class="headlist"><img src="img/Betta.png"></a>

		<c:if test="${empty sessionScope.nick }">
			<button class="login_Btn" onclick="location.href='loginform'">로그인</button>
		</c:if>
		<c:if test="${!empty sessionScope.nick }">
			<a href="mypage" class="mypage"><%=session.getAttribute("nick")%>님</a>
			<button class="logout_Btn" onclick="location.href='logout'">로그아웃</button>
		</c:if>
	</header>
</body>
</html>