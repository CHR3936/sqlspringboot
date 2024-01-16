<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="http://code.jquery.com/jquery-latest.js"></script>

<script>
function countingLength(re_content) {
    if (re_content.value.length > 300) {
        alert('댓글을 300자 이하로 입력해 주세요.');
        re_content.value = re_content.value.substring(0, 300);
        re_content.focus();
    }
    document.getElementById('counter').innerText = re_content.value.length + '/300자';
}


	function replylist(no){
		$.ajax({
			type : "get",
			url : "${pageContext.request.contextPath}/reply/replylist/"+no,
			success : function(result){
				var content = "<table><tr><th>작성자</th><th>날짜</th><th>내용</th></tr>"
				$.each(result.replylist,function(index,item){
					content += "<tr><td>" + item.re_nick + "</td>";
					
					var date = new Date(item.create_date);
					var formattedDate = date.getFullYear() + "-" + addZero(date.getDate()) +
					" " + addZero(date.getHours()) + ":" + addZero(date.getMinutes()) + ":" + addZero(date.getSeconds());
					
					content += "<td>" + formattedDate + "</td>";
					
					content += "<td>" + item.re_content;
	 		        content += "<input type =button value = 수정 onclick = 'replyupdate()' >";
	 		        content += "<input type =button value = 삭제 onclick = 'replydelete()'>"+ "</td></tr></table>";
			    
	 			});			
				
	 			$("#replylist").html(content);
	 		}
	 	});
	}

	//10보다 작은 숫자에 0을 추가하는 함수
	function addZero(number) {
	     return number < 10 ? "0" + number : number;
	}


    
$(function(){	
	
	$("#replyinsert").click(function(){
		alert("댓글 작성시도");
		
		if($("#re_content1").val() == ""){
			alert("내용을 입력해주세요");
			$("#re_content1").focus();
			return false;
		}
		
		var formData = {
				re_nick : $("#nick1").val(),
				re_content : $("#re_content1").val(),
				re_no : $("#no1").val()
			};
			
			$.ajax({
				type : "post",
				url : "${pageContext.request.contextPath}/reply/replyinsert",
				contentType : 'application/json',
				data : JSON.stringify(formData),
				success : function(result){
					if(result == 1){
						alert("댓글 작성");
						$("#re_content1").val= " ";
					}else{
						alert("댓글 실패");
					}
					replylist($("#no1").val());
				}
			});
		

	
	});
});

$(document).ready(function(){
	replylist(${comm.no});
});

function replyupdate(){
	alert("댓글 수정 시도");
}

function replydelete(){
	alert("댓글 삭제 시도");
}
</script>
<style>

</style>
</head>
<body>
<input type = "image" src = "img/Betta.png" width="300">

	<div>제목 ${comm.title }</div>
	<div>작성자 ${comm.nick }</div>
	<div>조회수 ${comm.read_count}</div>
	<div>
		날짜
		<fmt:formatDate value="${comm.reg_date }" pattern="yyyy-MM-dd" />
	</div>
	<div>
		<pre>내용	${comm.content }</pre>
	</div>
	<c:if test="${!empty comm.community_file }">
		<div>
			업로드 사진 <img
				src="<%= request.getContextPath() %>/upload/${comm.community_file}"
				height="200" width="300">
		</div>
	</c:if>

	<div align="right">
		<input type="button" value="목록"
			onclick="location.href='commlist?page=${page}'"> <input
			type="button" value="수정"
			onclick="location.href='commupdateform?no=${comm.no}&page=${page}'">
		<input type="button" value="삭제"
			onclick="location.href='commdelete?no=${comm.no}&page=${page} '">
	</div>

	<div class="cm_write">
		<input type = "hidden" value = "${sessionScope.nick }" id = "nick1">
		<input type = "hidden" value = "${comm.no }" id = "no1">
		<fieldset>
			<legend class="skipinfo">댓글 입력</legend>
			<div>session :${sessionScope.nick }</div>
		
			<div class="cm_input">
				<p>
					<textarea id="re_content1" name="re_content"
						onkeyup="countingLength(this);" cols="90" rows="4"
						placeholder="댓글을 입력해 주세요."></textarea>
				</p>
				<div align = "right">
				<span><button type="button" class="btns" id = "replyinsert">등 록</button>
						<i id="counter">0/300자</i>
						</span>
				</div>
			</div>
		</fieldset>
	</div>
	<div id="replylist"></div>
</body>
</html>