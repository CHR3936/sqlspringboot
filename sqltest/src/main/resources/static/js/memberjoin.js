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
	$("")

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
					
			
			if($("#nick").val() == ""){
				$("#nickcheck1").html('닉네임을 입력해주세요.');
		 		$("#nickcheck1").attr('color','red');
		 		$("#nick").focus();
		 		return false;	
			}else{
				$("#nickcheck1").hide();
			}
		 	if($("#passwd").val() == ""){
		 		$("#passcheck1").html('비밀번호를 입력해주세요.');
		 		$("#passcheck1").attr('color','red');
		 		$("#nick").focus();
		 		return false;	
		 	}else{
				$("#passcheck1").hide();
			}	
		});
	});
	$(function(){
		$("#pconfirm").keyup(function(){
			if($("#passwd").val() == $("#pconfirm").val()){
				$("#passconfirm1").html("비밀번호가 일치합니다.");
				$("#passconfirm1").attr('color','green');
			}else{
				$("#passconfirm1").html("비밀번호가 일치하지 않습니다");
				$("#passconfirm1").attr('color','red');
					return false;
			}
		});
	});