var auth = false;
	$(document).ready(function() {

		function emailCheck(email_address) {
			email_regex = /^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$/i;
			if (!email_regex.test(email_address)) {
				return false;
			} else {
				return true;
			}
		}

		$("#passfind_Btn").click(function() {

			if ($("#id_text").val() == "") {
				alert("이메일을 입력해주세요");
				$("#id_text").focus();
				return false;
			}

			var id_text = document.getElementById('id_text');

			var email = id_text.value;

			if (emailCheck(email)) {
				$("#id_text").attr('border-color','red');
			} else {
				alert("이메일 형식을 확인해주세요.");
				return false;
			}

			$.ajax({
				url : "passfind",
				data : {
					"id" : $("#id_text").val()
				},
				success : function(data) {			
				if(data == 1){
					alert("이메일이 전송되었습니다.");
				}else{
					alert("가입되지 않은 회원입니다.");
				}
				}
			});
		});
	});