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
	
	$(function(){
		$("#myform").submit(function(){
					
			if($("#email").val() == ""){
				$("#emailcheck").html('이메일을 입력해주세요.');
		 		$("#emailcheck").attr('color','red');
		 		$("#email").focus();
		 		return false;	
			}else{
				$("#emailcheck").hide();
			}
			if($("#nick").val() == ""){
				$("#nickcheck").html('닉네임을 입력해주세요.');
		 		$("#nickcheck").attr('color','red');
		 		$("#nick").focus();
		 		return false;	
			}
			
		 	if($("#passwd").val() == ""){
		 		$("#passcheck").html('비밀번호를 입력해주세요.');
		 		$("#passcheck").attr('color','red');
		 		$("#nick").focus();
		 		return false;	
		 	}	
		});
	});
	$(function(){
		$("#pconfirm").keyup(function(){
			if($("#passwd").val() == $("#pconfirm").val()){
				$("#passconfirm").html("비밀번호가 일치합니다.");
				$("#passconfirm").attr('color','green');
			}else{
				$("#passconfirm").html("비밀번호가 일치하지 않습니다");
				$("#passconfirm").attr('color','red');
					return false;
			}
		});
	});