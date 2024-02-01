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
/* 댓글 유효성 검사 */
function countingLength(re_content) {
    if (re_content.value.length > 300) {
        alert('댓글을 300자 이하로 입력해 주세요.');
        re_content.value = re_content.value.substring(0, 300);
        re_content.focus();
    }
    document.getElementById('counter').innerText = re_content.value.length + '/300자';
}


/* 댓글 삭제 */
function replydelete(no,reply_no){
	
	var formData = {
	        're_no': no, 			
	        'reply_no': reply_no
	    };
	
	var result = confirm("정말 삭제하시겠습니까?");
	if(result){
		
	
	
	
	$.ajax({
		type : "DELETE",
		url : "${pageContext.request.contextPath}/reply/replydelete/",
		contentType: 'application/json',  			// 데이터 타입을 JSON으로 설정
		data : JSON.stringify(formData),  			// 데이터를 JSON 문자열로 변환하여 전송
		success : function(result){
			
			if(result == 1){
				alert("삭제되었습니다.");
			}else if(result == -2){
				alert("로그인을 해주세요");
			}else{
				alert("삭제 권한이 없습니다.");
			}
			replylist(no);  						// 글삭제후 목록 페이지로 이동
		}	
	});		
	}	
}

/* 댓글 리스트 불러오기 */
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
					content += "<td><input type='button' id='modalBtn' value='수정' class='redit_Btn' onclick='replyedit(" + item.reply_no + ")'>";
// 					content += "<td><input type=button id=modalBtn value=수정 class='redit_Btn' onclick = 'replyedit(\""+item.reply_no+"\",\""+item.re_content+"\");'>";
//					content += "<td><input type='button' id='modalBtn' value='수정' class='redit_Btn' onclick='replyedit(\"" + item.reply_no +'\',\''+item.re_content+"\");'>";
					content += "<input type =button value = 삭제 class='rdelete_Btn' onclick = 'replydelete("+item.re_no+','+item.reply_no+")'>"+ "</td></tr><br>";
			    
	 			});			
				
	 			$("#replylist").html(content);
	 		}
	 	});
	}

/* 10보다 작은 숫자에 0을 추가하는 함수 */	
function addZero(number) {
	     return number < 10 ? "0" + number : number;
}


/* 댓글 입력 */    
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
					}else if(result == -2){
						alert("로그인을 해주세요");
					}else{
						alert("작성에 실패했습니다.");						
					}
					replylist($("#no1").val());
				}
			});
		

	
	});
});

/* 댓글 목록 요청하기 */
$(document).ready(function(){
	replylist(${comm.no});
});


</script>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css">
<link href="css/commcontent.css" rel="stylesheet">
<jsp:include page="../include/header.jsp" />
</head>
<body>
	
	<div class="first">${comm.title }</div>
	<hr>
	<div class="second">
		<span class="nick">${comm.nick }</span> <span class="date"> <fmt:formatDate
				value="${comm.reg_date }" pattern="yyyy-MM-dd" />
		</span>
	</div>
	<div class="third">

		<i class="bi bi-eyeglasses"></i> ${comm.read_count} 
	</div>
	<div class="content">
		<pre>${comm.content }</pre>
		<c:if test="${!empty comm.community_file }">
				<img src="<%= request.getContextPath() %>/upload/${comm.community_file}"
				 class="content_img">
		</c:if>
	</div>
	<div align="right" class = "Btn_list">
		<input type="button" value="수정" class="edit_Btn"
			onclick="location.href='commupdateform?no=${comm.no}&page=${page}&nick=${comm.nick}'">
		<input type="button" value="삭제" class="delete_Btn"
			onclick="location.href='commdelete?no=${comm.no}&page=${page}&nick=${comm.nick} '">
	</div>

	<div class="reply_write">
		<input type="hidden" value="${sessionScope.nick }" id="nick1">
		<input type="hidden" value="${comm.no}" id="no1">
		<fieldset class="replyinfo">
			<legend>댓글 입력</legend>

			<div class="cm_input">
				<p>
					<textarea id="re_content1" name="re_content"
						onkeyup="countingLength(this);" cols="90" rows="4"
						placeholder="댓글을 입력해 주세요."></textarea>
				</p>
				<div align="right">
					<span><button type="button" class="reply_Btn" id="replyinsert"
							class="insert_btn">등 록</button> <i id="counter">0/300자</i> </span>
				</div>
			</div>
		</fieldset>
	</div>
	
	<!-- 댓글 목록 랜더링 -->
	<div id="replylist" class="replylist"></div>
	<!-- 모달창 랜더링 -->
	<div id="myModal" class="modal">
		<div class="modal-content">
			<span class="close">&times;</span>
			<input type = "button" value = "수정">
			date
		</div>
	</div>
</body>
<script>

// 모달 버튼과 모달창 가져오기
var modalBtn = document.getElementById("modalBtn");
var modal = document.getElementById("myModal");

// 모달 버튼을 클릭하면 모달창을 열도록 이벤트 리스너 등록
function replyedit(reply_no){
	alert(reply_no);
	
	$.ajax({
		url : "replycontent",
		data : {
			"reply_no" : reply_no
		},
		success : function(data){
			if(data == 1){
			modal.style.display = "block"; 
			}else{
				alert("수정 권한이 없습니다");
			}
		}
	});
	
}


// 모달 닫기 버튼 클릭 시 모달창 닫도록 이벤트 리스너 등록
var closeBtn = modal.querySelector(".close");
closeBtn.onclick = function() {
  modal.style.display = "none";
};
</script>


</html>