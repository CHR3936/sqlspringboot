<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
body{
  font-family: 'Montserrat', sans-serif;
  background:white;
}

.container{
  display:block;
  max-width:680px;
  width:80%;
  margin:120px auto;
  text-align:center;
}

.head{
  color:#e91e63;
  font-size:48px;
  font-weight: bolder;
  letter-spacing:-3px;
  text-decoration : none;
  margin:120px 0 80px 0 ;
  transition:.2s linear;
}

.links{
  list-style-type:none;
  li{
     display:inline-block;
     margin:0 20px 0 0;
     transition:.2s linear;
     &:nth-child(2){
        opacity : .6;
        &:hover{
           opacity : 1;
        }
     }
     &:nth-child(3){
        opacity : .6;
        float:right;
         &:hover{
           opacity : 1;
         }
     }
     a{
        text-decoration:none;
        color:#0f132a;
        font-weight:bolder;
        text-align:center;
        cursor : pointer;
     }
   }
}


form{
  width:100%;
  max-width:680px;
  margin:40px auto 10px;
  .input__block{
     margin:20px auto;
     display:block;
     position:relative;
     &.first-input__block{
        &::before{
          content:"";
          position:absolute;
          top:-15px;
          left:50px;
          display:block;
          width:0;
          height:0;
        background:transparent;
          border-left:15px solid transparent;
          border-right:15px solid transparent;
          border-bottom:15px solid rgba(#0f132a,.1);
          transition:.2s linear;
        }
     }
      
     input{
        display:block;
        width:90%;
        max-width:680px;
        height:50px;
        margin:0 auto;
        border-radius:8px;
        border:3;
        background: rgba(#0f132a,.1);
        color : rgba(#0f132a,.3);
        padding:0 0 0 15px;
        font-size:14px;
        font-family: 'Montserrat', sans-serif;
        
       
     }
     
  }

	.emailinput{
        display:block;
        width:90%;
        max-width:680px;
        height:50px;
        margin:0 auto;
        border-radius:8px;
        border:3;
        background: rgba(#0f132a,.1);
        color : rgba(#0f132a,.3);
        padding:0 0 0 15px;
        font-size:14px;
        font-family: 'Montserrat', sans-serif;
        
       
     }

  .signin__btn{
     background:#1285C4;
     color:white;
     display:block;
     width:92.5%;
     max-width:680px;
     height:50px;
     border-radius:8px;
     margin:0 auto;
     border:none;
     cursor:pointer;
     font-size:20px;
     font-weight: bolder;
     font-family: 'Montserrat', sans-serif;
     box-shadow:0 15px 30px rgba(#e91e63,.36);
    transition:.2s linear;
    &:hover{
      box-shadow:0 0 0 rgba(#e91e63,.0);
    }
  }
}




.google__btn{
   display:block;
   width:90%;
   max-width:680px;
   margin:20px auto;
   height:50px;
   cursor:pointer;
   font-size:20px;
   font-family: 'Montserrat', sans-serif;
   border-radius:8px;
   border:none;
   line-height:40px;
   &.google__btn{
      background:#19765B;
      color:white;
      box-shadow:0 15px 30px rgba(#5b90f0,.36);
      transition:.2s linear;
      .fa{
          font-size:20px;
          padding:0 5px 0 0 ;
      }
     &:hover{
       box-shadow:0 0 0 rgba(#5b90f0,.0);
     }
   }
   
}


.low{

	a:visited{
	color : black;
	}
	
}



</style>
<script src = "http://code.jquery.com/jquery-latest.js"></script>
<script>
	$(function(){
		$("#login").submit(function(){
			
			if($("#email").val() == ""){
				$("#emailcheck").html('이메일을 입력해주세요.');
		 		$("#emailcheck").attr('color','red');
		 		$("#email").focus();
		 		return false;	
			}else {
				$("#emailcheck").hide();
			}
			
			if($("#passwd").val() == ""){
				$("#passcheck").html('비밀번호를 입력해주세요.');
		 		$("#passcheck").attr('color','red');
		 		$("#passwd").focus();
		 		return false;	
			}else{
				$("#passcheck").hide();
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
       <input type="email" placeholder="이메일" class="emailinput" id="email" name = "id"  />
    </div>
    <div align = "right">
    <font id = "emailcheck" ></font>
    </div>
    <div class="input__block">
       <input type="password" placeholder="비밀번호" class="input" id="passwd" name = "passwd"   />
    </div>
    <div align = "right">
    <font id ="passcheck"></font>
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