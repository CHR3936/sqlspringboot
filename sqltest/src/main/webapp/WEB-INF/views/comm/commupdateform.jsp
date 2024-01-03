<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form method="post" action="commupdate" >
<input type = "hidden" name = "no" value = "${comm.no }">
<input type = "hidden" name = "page" value = "${page }">
<div>
작성자 : <input type = "text" name = "nick" readonly="readonly"
			  value = "${comm.nick }">
</div>
<div>
제목 : <input type = "text" name = "title" 
			 value = "${comm.title }"> 
</div>
<div>
내용: <input type ="text" name = "content"
			value = "${comm.content }">
</div>
파일 : <input type = "file" name = "fileupload" class = "fileupload">
<div>
<input type="submit" value = "글 수정">
<input type = "button" value = "취소"
onclick="location.href='commlist?page=${page}'">
</div>

</form>
</body>
</html>