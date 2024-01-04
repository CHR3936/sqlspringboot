<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href = "css/loginform.css" rel="stylesheet">
<script src = "http://code.jquery.com/jquery-latest.js"></script>
<script>
	$(function(){
		$("#login").submit(function(){
			
			if($("#email1").val() == ""){
				$("#emailcheck1").html('이메일을 입력해주세요.');
		 		$("#emailcheck1").attr('color','red');
		 		$("#email1").focus();
		 		return false;	
			}else {
				$("#emailcheck1").hide();
			}
			
			if($("#passwd1").val() == ""){
				$("#passcheck1").html('비밀번호를 입력해주세요.');
		 		$("#passcheck1").attr('color','red');
		 		$("#passwd1").focus();
		 		return false;	
			}else{
				$("#passcheck1").hide();
			}
			
		
		});
	});

</script>
</head>
<body>
<div class="container">
  <!-- Heading -->
  
  <a href = "commlist" class = "head" >community</a>
 
  
  
  <!-- Form -->
  <form  action="login" method="post" id = "login">
    <!-- email input -->
    <div class="email text">
       <input type="email" placeholder="이메일" class="emailinput" id="email1" name = "id"  />
    </div>
    <div align = "right">
    <font id = "emailcheck1" ></font>
    </div>
    <div class="input__block">
       <input type="password" placeholder="비밀번호" class="input" id="passwd1" name = "passwd"   />
    </div>
    <div align = "right">
    <font id ="passcheck1"></font>
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