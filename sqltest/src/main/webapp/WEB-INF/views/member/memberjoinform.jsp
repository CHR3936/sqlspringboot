<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script src="${pageContext.request.contextPath}/js/memberjoin.js"></script>
<style>
@charset "UTF-8";

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

/* div{ */
/* 	margin : 10px; */
/* 	position: relative; */
/* } */

div{
	margin : 10px;
	
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
        padding:0 0 0 0px;
        font-size:14px;
        font-family: 'Montserrat', sans-serif;
        
       
     }
     
  }

	.email{
		position: relative;
        display:block;
        width:90%;
        max-width:680px;
        height:50px;
        margin: 0 auto;
        border-radius:8px;
        border:3;
        background: rgba(#0f132a,.1);
        color : rgba(#0f132a,.3);
        padding:0 0 0 15px;
        font-size:14px;
        font-family: 'Montserrat', sans-serif;
       
     }
	
	.nick{
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
	
	.passinput{
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
	.passcheckinput{
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

  .memberjoin{
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





 /* .emailcheck {
  position: absolute;
  top : 118px;
  width: 100px;
  height: 30px;
  background: #fff;
  border: 1px solid rgb(77,77,77);
  border-radius: 10px;
  font-weight: 500;
  cursor: pointer;
  display: flex;
  align-items: center;
  justify-content: center;
  margin-left : 530px;
  &:hover {
    background: rgb(77,77,77);
    color: #fff;
  } 
}

 .nconfirm {
  position: absolute;
  top : 180px;
  width: 100px;
  height: 30px;
  background: #fff;
  border: 1px solid rgb(77,77,77);
  border-radius: 10px;
  font-weight: 500;
  cursor: pointer;
  display: flex;
  align-items: center;
  justify-content: center;
  margin-left : 530px;
  
  &:hover {
    background: rgb(77,77,77);
    color: #fff;
  } 
} */



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
<script>
var auth = false;

$(document).ready(function() {

	$("#emaildetail").hide();
	$("#econfirm").hide();

	$("#emailcheck").click(function() {
		if ($("#email").val() == "") {
			alert("이메일을 입력해주세요");
			$("#email").focus();
			return false;
		}

		$.ajax({
			url : "send.do",
			data : {
				"mail" : $("#email").val()
			},
			success : function(data) {
				$("#emaildetail").show();
				$("#econfirm").show();
				alert(data);

				$("#econfirm").click(function() {

					if ($("#emaildetail").val() == "") {
						alert("인증번호를 입력하세요");
						$("#emailcheck").focus();
						return false;
					}

					if (data == $("#emaildetail").val()) {
						alert("인증 성공");
						$("#emaildetail").hide();
						$("#econfirm").hide();

						$("#nick").focus();
						auth = true;
						return false;
					}

				});

			}

		});

	});

});
</script>
</head>
<body>
<div class ="container">


  <a href = "commlist" class = "head" >community</a>

	<form id = "myform" action="memberjoin" method="post" modelAttribute="member">
		<div>
			<input type="email" name="id" id="email" class="email" placeholder="이메일" />
			<font id ="emailcheck"/>
		</div>
		<div>
			<input type="button" value="메일인증" id="emailcheck" class = "emailcheck">
		</div>
		<div>
			<input type="text" id="emaildetail"> 
			<input type="button" value="인증확인" id="econfirm" >
		</div>
		<div>
		    <input type="text" name="nick" id="nick" class ="nick" placeholder="닉네임"> 
			<font id ="nickcheck"/>
		</div>
		<div>
			<input type="button" value="중복 확인" class ="nconfirm">
		</div>
		<div>
			<input type="text"  name="passwd" id="passwd" class ="passinput" placeholder="비밀번호">
			<font id = "passcheck"/>
		</div>
		<div>
			<input type = "text" id = "pconfirm" class="passcheckinput" placeholder="비밀번호 확인">
			<font id = "passconfirm"/>
		</div>		
		<div align="center">
			<input type="submit" value="회원가입" class = "memberjoin">
		</div>
		<div align ="right">
		<a href = "loginform">로그인</a>
		</div>
	</form>
	</div>
</body>
</html>