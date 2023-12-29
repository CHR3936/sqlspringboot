<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="http://code.jquery.com/jquery-latest.js"></script>
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
		
		
		if($("#passwd").val() != $("#pconfirm").val()){
			alert("비밀번호가 일치하지 않습니다.")
		}

	});
</script>

</head>
<body>
	<form action="memberjoin" method="post" modelAttribute="member">
		<div>
			이메일 : <input type="text" name="email" id="email" class="form-control" />
			<input type="button" value="메일인증" id="emailcheck">
		</div>
		<div>
			<input type="text" id="emaildetail"> <input type="button"
				value="인증확인" id="econfirm">
		</div>
		<div>
			닉네임 : <input type="text" name="nick" id="nick"> <input
				type="button" value="중복 확인">
		</div>
		<div>
			비밀번호 : <input type="text" name="passwd" id="passwd">
		</div>
		<div>
			비밀번호 확인 : <input type="text" id="pconfirm">
		</div>
		<div align="center">
			<input type="submit" value="회원가입">

		</div>
	</form>
</body>
</html>