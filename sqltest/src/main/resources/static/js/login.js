$(function(){
		$("#login").submit(function(){
			
			if($("#logemail").val() == ""){
				$("#logemailcheck").html('이메일을 입력해주세요.');
		 		$("#logemailcheck").attr('color','red');
		 		$("#logemail").focus();
		 		return false;	
			}else {
				$("#logemailcheck").hide();
			}
			
			if($("#logpass").val() == ""){
				$("#logpasscheck").html('비밀번호를 입력해주세요.');
		 		$("#logpasscheck").attr('color','red');
		 		$("#logpass").focus();
		 		return false;	
			}else{
				$("#logpasscheck").hide();
			}
			
		
		});
	});