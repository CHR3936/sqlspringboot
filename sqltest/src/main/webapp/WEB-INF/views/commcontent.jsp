<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>


<table border = 1 width =400 align = "center" >
	<tr>
		<td>제목</td>
		<td>${comm.title}</td>
	</tr>	
	<tr>
		<td>작성자</td>
		<td>${comm.nick }</td>
	</tr>
	<tr>
		<td>조회수</td>
		<td>${comm.read_count}</td>
	</tr>
	<tr>
		<td>날짜</td>
		<td><fmt:formatDate value="${comm.reg_date }"
			 pattern = "yyyy-MM-dd"/>
			 
		</td>
	</tr>
	<tr>
		<td>내용</td>
		<td><pre>${comm.content}</pre></td>
	</tr>
	<tr>
		<td>업로드 사진</td>
		<td>
		<c:if test="${!empty comm.community_file }">
		<img src="<%= request.getContextPath() %>/upload/${comm.community_file}" height = "300" width ="300">
		</c:if>
		
		</td>
	</tr>

</table>

	<div align = "right">
			<input type ="button" value = "목록"
onclick="location.href='commlist?page=${page}'"	>
			<input type="button" value = "수정">
			
	</div>

</body>
</html>