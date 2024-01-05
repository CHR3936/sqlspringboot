<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href = "css/loginform.css" rel="stylesheet">
<script src = "http://code.jquery.com/jquery-latest.js"></script>
<script src ="js/login.js?ver=1"></script>

</head>
<body>
<div class="container">
  
  <a href = "commlist" class = "head" >community</a>
  
  
  <!-- Form -->
  <form  action="login" method="post" id = "login">
    <!-- email input -->
    <div class="email text">
       <input type="email" placeholder="이메일" class="emailinput" id="logemail" name = "id"  />
    </div>
    <div align = "right">
    <font id = "logemailcheck" ></font>
    </div>
    <div class="input__block">
       <input type="password" placeholder="비밀번호" class="input" id="logpass" name = "passwd" />
    </div>
    <div align = "right">
    <font id ="logpasscheck"></font>
    </div>
    <!-- sign in button -->
    <button class="signin__btn" type="submit">
      로그인
    </button>
  </form>
  <div align = "right" class ="low">
  <a href= "memberjoinform" style="text-decoration: none" class = "memberjoin">회원가입</a>
  <a href style="text-decoration: none" class = "idfind">아이디 찾기</a>
  <a href style="text-decoration: none" class = "passfind">비밀번호 찾기</a>
  </div>
  
  
</div>

</body>
</html>