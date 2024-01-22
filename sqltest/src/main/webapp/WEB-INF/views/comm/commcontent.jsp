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
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css">
<style>
.edit1 {
	width: 50px;
}
</style>
<script>
function countingLength(re_content) {
    if (re_content.value.length > 300) {
        alert('댓글을 300자 이하로 입력해 주세요.');
        re_content.value = re_content.value.substring(0, 300);
        re_content.focus();
    }
    document.getElementById('counter').innerText = re_content.value.length + '/300자';
}

// function replyedit(index) {
//     alert("수정");
//     alert(index);

//     // 두 번째 td의 텍스트 내용 가져오기
//     var txt = $('#replyno_0').text();
// //    var txt = 'test';
//     alert("두 번째 td의 내용: " + txt);

//     // 내용을 textarea로 교체하기
//     $('#replyno_'+index).html("<textarea rows='3' cols='30' id='tt_" + index + "'>" + txt + "</textarea>");

//     // 버튼을 "확인"으로 변경하고 "취소" 버튼 추가하기
//     $('#btn_' + index).html(
//         "<input type='button' value='확인' onclick='up(" + index + ")'> " +
//         "<input type='button' value='취소' onclick='lst()'>"
//     );
// }

/* function replyedit(reply_no) {
	alert(reply_no);
	
	window.open("","edit","width=300, height=300");
	
	
} */




function replydelete(no,reply_no){
	alert(no);
	alert(reply_no);
	
	var formData = {
	        're_no': no, 			
	        'reply_no': reply_no
	    };
	
	$.ajax({
		type : "DELETE",
		url : "${pageContext.request.contextPath}/reply/replydelete/",
		contentType: 'application/json',  			// 데이터 타입을 JSON으로 설정
		data : JSON.stringify(formData),  			// 데이터를 JSON 문자열로 변환하여 전송
		success : function(result){
			if(result == 1){
				alert("삭제되었습니다.");
			}else{
				alert("삭제 권한이 없습니다.");
			}
			replylist(no);  						// 글삭제후 목록 페이지로 이동
		}	
	});	
	
	
}


	function replylist(no){
		$.ajax({
			type : "get",
			url : "${pageContext.request.contextPath}/reply/replylist/"+no,
			success : function(result){
				var content = "<table width=750 height = 120><tr><th>작성자</th><th>내용</th><th>날짜</th></tr>"
				$.each(result.replylist,function(index,item){
					content += "<tr><td>"+item.re_nick +"</td>";
					
					var date = new Date(item.create_date);
					var formattedDate = date.getFullYear() + "-" + addZero(date.getDate()) +
					" " + addZero(date.getHours()) + ":" + addZero(date.getMinutes()) + ":" + addZero(date.getSeconds());
					
					content += "<td id='replyno_'"+index+">"+item.re_content+"</td>";
					
					content += "<td>"+formattedDate+"</td>";  // id='edit_'+index
					content += "<td><input type='button' id='btn_" + index + "' value='수정' class='openBtn' onclick='replyedit(" + item.reply_no + ")'>";
	 		        content += "<input type =button value = 삭제 class='rdelete_btn' onclick = 'replydelete("+item.re_no+','+item.reply_no+")'>"+ "</td></tr><br>";
			    
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
						alert("작성되었습니다.");
						$("#re_content1").val('');
					}else{
						alert("작성에 실패했습니다.");
					}
					replylist($("#no1").val());
				}
			});
		

	
	});
});

$(document).ready(function(){
	replylist(${comm.no});
});


</script>
<style>
i {
	width: 100px;
}

.test {
	background: white;
}

.first {
	width: 70%;
	text-align: left;
	margin-left: 15%;
	margin-top: 5%;
	font-size: 25px;
}

hr {
	width: 70%;
}

.second {
	width: 75%;
	margin-left: 11%;
	font-size: 17px;
}

.nick {
	margin-left: 5.5%;
}

.date {
	float: right;
	margin-right: 1.5%;
}

.third {
	width: 70%;
	height: 20px;
	text-align: right;
	margin-top: 0.5%;
	margin-left: 14.5%;
	margin-bottom: 5%;
	font-size: 17px;
}

.content {
	width: 55%;
	height: 55px;
	margin-top: 2%;
	margin-left: 15%;
	margin-bottom: 10%;
	font-size: 17px;
}

.edit_btn {
	width: 75px;
	height: 35px;
	border-color: #569FBF;
	border-radius: 3px;
	background: #61A8C4;
	color: white;
	font-size: 15px;
	font-weight: bolder;
	font-family: 'Montserrat', sans-serif;
	box-shadow: 0 15px 30px rgba(#e91e63, .36);
}

.delete_btn {
	width: 75px;
	height: 35px;
	border-color: #569FBF;
	border-radius: 4px;
	background: #61A8C4;
	color: white;
	font-size: 15px;
	font-weight: bolder;
	font-family: 'Montserrat', sans-serif;
	box-shadow: 0 15px 30px rgba(#e91e63, .36);
}

button {
	width: 75px;
	height: 35px;
	border-color: #569FBF;
	border-radius: 4px;
	background: #61A8C4;
	color: white;
	font-size: 15px;
	font-weight: bolder;
	font-family: 'Montserrat', sans-serif;
	box-shadow: 0 15px 30px rgba(#e91e63, .36);
}

.reply_write {
	width: 70%;
	margin-left: 15%;
	margin-bottom: 2%;
}

.replylist {
	margin-left: 15%;
}

textarea {
	resize: none;
	width: 90%;
}

tr, td {
	text-align: center;
}

.replyinfo {
	width: 80%;
}

.redit_btn {
	width: 75px;
	height: 35px;
	border-color: #569FBF;
	border-radius: 4px;
	background: #61A8C4;
	color: white;
	font-size: 15px;
	font-weight: bolder;
	font-family: 'Montserrat', sans-serif;
	box-shadow: 0 15px 30px rgba(#e91e63, .36);
}

.rdelete_btn {
	width: 75px;
	height: 35px;
	border-color: #569FBF;
	border-radius: 4px;
	background: #61A8C4;
	color: white;
	font-size: 15px;
	font-weight: bolder;
	font-family: 'Montserrat', sans-serif;
	box-shadow: 0 15px 30px rgba(#e91e63, .36);
}

.modal {
	position: fixed;
	top: 0;
	left: 0;
	width: 100%;
	height: 100%;
	display: flex;
	justify-content: center;
	align-items: center;
}

.modal .bg {
	width: 100%;
	height: 100%;
	background-color: rgba(0, 0, 0, 0.6);
}

.modalBox {
	position: absolute;
	background-color: #fff;
	width: 400px;
	height: 200px;
	padding: 15px;
}

.modalBox button {
	display: block;
	width: 80px;
	margin: 0 auto;
}

.hidden {
	display: none;
}
</style>
</head>
<body>
	<jsp:include page="../include/header.jsp" />
	<div class="modal hidden">
		<div class="bg"></div>
		<div class="modalBox">
			<p>내용</p>
			<input type="button" value="수정"> <input type="button"
				value="취소" class="closeBtn">
		</div>
	</div>
	<div class="modal">
		<input type="text" placeholder="작성자명"> <input type="text"
			placeholder="댓글내용">
	</div>

	<div class="first">${comm.title }</div>
	<hr>
	<div class="second">
		<span class="nick">${comm.nick }</span> <span class="date"> <fmt:formatDate
				value="${comm.reg_date }" pattern="yyyy-MM-dd" />
		</span>
	</div>
	<div class="third">

		<i class="bi bi-eyeglasses"></i> ${comm.read_count} <i
			class="bi bi-chat-dots"></i> ${replyCount }
	</div>
	<div class="content">
		<pre>${comm.content }</pre>

		<c:if test="${!empty comm.community_file }">
			<div>
				<img
					src="<%= request.getContextPath() %>/upload/${comm.community_file}"
					height="200" width="300">
			</div>
		</c:if>
	</div>
	<div align="center">
		<input type="button" value="수정" class="edit_btn"
			onclick="location.href='commupdateform?no=${comm.no}&page=${page}'">
		<input type="button" value="삭제" class="delete_btn"
			onclick="location.href='commdelete?no=${comm.no}&page=${page} '">
	</div>

	<div class="reply_write">
		<input type="hidden" value="${sessionScope.nick }" id="nick1">
		<input type="hidden" value="${comm.no }" id="no1">
		<fieldset class="replyinfo">
			<legend>댓글 입력</legend>

			<div class="cm_input">
				<p>
					<textarea id="re_content1" name="re_content"
						onkeyup="countingLength(this);" cols="90" rows="4"
						placeholder="댓글을 입력해 주세요."></textarea>
				</p>
				<div align="right">
					<span><button type="button" class="btns" id="replyinsert"
							class="insert_btn">등 록</button> <i id="counter">0/300자</i> </span>
				</div>
			</div>
		</fieldset>
	</div>
	<div id="replylist" class="replylist"></div>
</body>
<script>
const open = () => {
    document.querySelector(".modal").classList.remove("hidden");
  }

const close = () => {
    document.querySelector(".modal").classList.add("hidden");
  }

  document.querySelector(".openBtn").addEventListener("click", open);
  document.querySelector(".closeBtn").addEventListener("click", close);
  document.querySelector(".bg").addEventListener("click", close);

</script>
</html>