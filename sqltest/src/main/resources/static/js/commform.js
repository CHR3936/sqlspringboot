$(function(){
	$("#checkform").submit(function(){
		
		if($("#title").val()==""){
			alert("제목을 입력해주세요.");
			return false;
		}
		
		if($("#content").val() == ""){
			alert("내용을 입력해주세요.");
			return false;
		}
			
	});
});