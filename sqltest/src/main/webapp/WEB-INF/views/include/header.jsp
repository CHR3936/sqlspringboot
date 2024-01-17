<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
li{
	list-style-type: none;
}

img{
	width: 130px;
}

.login{
	margin-left: 55%;
}

.logout{
	margin-left: 2%;
}

.mypage{
	margin-left:45%;
}

.headlist{
  color:#0A58CA;
  font-size:80px;
  font-weight: bolder;
  letter-spacing:-3px;
  text-decoration : none;
  text-align:center;
  top : 150%;
}

a{
	text-decoration: none;
	
}

header{
	background: white;
	border-radius: 5px;
}
</style>
</head>
<body>
<header>
	<a href ="commlist" class = "headlist"><img src="img/Betta.png">Betta</a>
		<c:if test="${empty sessionScope.nick }">
		<a href="loginform" class = "login">로그인</a>
		</c:if>
		<c:if test="${!empty sessionScope.nick }">
		<a href = "mypage" class = "mypage"><%=session.getAttribute("nick")%>님</a> 
		<a href="logout" class = "logout">로그아웃</a>			
		</c:if>
	</header>
</body>
</html>