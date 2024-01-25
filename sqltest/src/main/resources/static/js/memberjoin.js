var auth = false;

$(document).ready(function() {

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
				alert(data);

				$("#emailcheck").hide();
				$("#econfirm").show();
				
				$("#econfirm").click(function() {
						

					if ($("#emaildetail").val() == "") {
						alert("인증번호를 입력하세요");
						$("#emaildetail").focus();
						return false;
					}

					if (data == $("#emaildetail").val()) {
						alert("인증 성공");

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
	
	$("#nconfirm").click(function(){
		
		if($("#nick").val() == ""){
			alert("닉네임을 입력 하세요.");
			$("#nick").focus();
			return false;
		}		
		
		var nick = $("#nick").val();
		
		$.ajax({
			type: "post",
			url: "nickcheck",
			data : {"nick" : nick},
			success : function(data){
				if(data == 1){					
					$("#nickcheck1").html("사용중인 닉네임 입니다.");
					$("#nickcheck1").attr('color','red');
				
				}else{
					$("#nickcheck1").html("사용 가능한 닉네임 입니다.");
					$("#nickcheck1").attr('color','green');
				}
				
				
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