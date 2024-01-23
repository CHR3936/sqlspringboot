<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.modal {
	display: none; /* 모달창 기본 숨김 */
	position: fixed;
	z-index: 1;
	left: 0;
	top: 0;
	width: 100%;
	height: 100%;
	overflow: auto;
	background-color: rgba(0, 0, 0, 0.4); /* 배경 불투명도 조절 */
}

/* 모달 내용 스타일 */
.modal-content {
	background-color: #fefefe;
	margin: 15% auto;
	padding: 20px;
	border: 1px solid #888;
	width: 80%;
}

/* 모달 닫기 버튼 스타일 */
.close {
	color: #aaa;
	float: right;
	font-size: 28px;
	font-weight: bold;
}

.close:hover, .close:focus {
	color: black;
	text-decoration: none;
	cursor: pointer;
}
</style>
</head>
<body>
	<input type = "button" id="modalBtn" value="모달" onclick = "replyedit()"/>

	<!-- 모달창 -->
	<div id="myModal" class="modal">
		<div class="modal-content">
			<span class="close">&times;</span>
		</div>
	</div>
</body>
<script>
//모달 버튼과 모달창 가져오기
var modalBtn = document.getElementById("modalBtn");
var modal = document.getElementById("myModal");

// 모달 버튼을 클릭하면 모달창을 열도록 이벤트 리스너 등록
function replyedit(){
	alert("시도");
	modal.style.display = "block";
};
// modalBtn.onclick = function() {
  
// };

// 모달 닫기 버튼 클릭 시 모달창 닫도록 이벤트 리스너 등록
var closeBtn = modal.querySelector(".close");
closeBtn.onclick = function() {
  modal.style.display = "none";
};

</script>
</html>