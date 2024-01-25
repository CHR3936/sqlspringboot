<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
form{
padding : 10%;
border : 1px solid;
border-color: #B0BEC5;
width: 80%;	
    
}

.title_Box{
width:80%;
border-radius: 5px;
margin-bottom: 5%;
}

textarea {
	width: 80%;
	border-radius: 5px;
	margin-bottom: 5%;
	resize: none;
}


</style>
<jsp:include page="../include/header.jsp" />
</head>
<body>
<form action="commInsert" method = "post" enctype = "multipart/form-data">
<div class="form_Line">
<div>
<input type =text name= "title" " class="title_Box" placeholder="제목">
</div>
<div>내용
<textarea cols= 40 row = 5 name = "content" placeholder="내용" ></textarea>
</div>
<div>첨부파일
<input type="file" class ="fileupload" name = "fileupload" >
</div>
<div>
<input type = submit value ="글 작성">
<input type = button value ="취소" onclick = "location.href='commlist'">
</div>
</div>
	
</form>


</body>
</html>