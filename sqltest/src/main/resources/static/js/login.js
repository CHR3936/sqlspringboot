$(function(){
		$("#login").submit(function(){
			
			if($("#email").val() == ""){
				$("#emailcheck1").html('이메일을 입력해주세요.');
		 		$("#emailcheck1").attr('color','red');
		 		$("#email").focus();
		 		return false;	
			}else {
				$("#emailcheck1").hide();
			}
			
			if($("#passwd").val() == ""){
				$("#passcheck1").html('비밀번호를 입력해주세요.');
		 		$("#passcheck1").attr('color','red');
		 		$("#passwd").focus();
		 		return false;	
			}else{
				$("#passcheck1").hide();
			}
			
		
		});
	});