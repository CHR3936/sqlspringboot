<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src = "http://code.jquery.com/jquery-latest.js"></script>
<link href="css/commform.css" rel="stylesheet">
<script src="js/commform.js"></script>
</head>
<body>
<jsp:include page="../include/header.jsp" />
	<form action="commInsert" method="post" enctype="multipart/form-data" id="checkform">
		<div class="form_Line">
			<div>
				<input type=text name="title" " class="title_Box" placeholder="제목" id ="title">
			</div>
			<div>
				<textarea cols=40 row=5 name="content" placeholder="내용" id="content"></textarea>
			</div>
			<div class="file">
				<input type="file" class="fileupload" name="fileupload">
			</div>
			<div class = "commform_Btn">
				<input type="hidden" name="nick" value="${sessionScope.nick }">
				<input type=submit value="작성" class="write_Btn" > 
				<input type=button value="취소" class="reset_Btn" 
				onclick="location.href='commlist'">
			</div>
		</div>

	</form>


</body>
</html>