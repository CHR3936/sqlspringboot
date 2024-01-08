<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form action="commInsert" method = "post" enctype = "multipart/form-data">
<table border = 1 width = 400 align = center>
	<caption>글 작성</caption>
	<tr><th>작성자명</th>
		<td><input type= "text" name = "nick" value =${sessionScope.nick } readonly="readonly"></td>
	</tr>
	<tr><th>제목</th>
		<td><input type =text name= "title"></td>
	</tr>
	<tr><th>내용</th>
		<td><textarea cols= 40 row = 5 name = "content" style = "resize :none;"></textarea></td>
	</tr>
	 <tr><th>첨부파일</th>
		<td><input type="file" class ="fileupload" name = "fileupload" ></td>
	</tr>
	<tr><td colspan=2 align = center>
		<input type = submit value ="글 작성">
		<input type = button value ="취소" onclick = "location.href='commlist'">
	</td>
	</tr>
</table>
</form>


</body>
</html>