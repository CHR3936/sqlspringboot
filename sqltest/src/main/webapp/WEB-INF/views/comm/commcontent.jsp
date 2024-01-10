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
<div>
제목	${comm.title }
</div>
<div>
작성자 ${comm.nick }
</div>
<div>
조회수 ${comm.read_count}
</div>
<div>
날짜 <fmt:formatDate value="${comm.reg_date }" pattern = "yyyy-MM-dd"/>
</div>
<div>
<pre>내용	${comm.content }</pre>
</div>
<c:if test="${!empty comm.community_file }">
<div>
업로드 사진
		<img src="<%= request.getContextPath() %>/upload/${comm.community_file}" height = "300" width ="300">
</div>
</c:if>

	<div align = "right">
	<input type ="button" value = "목록"
		   onclick="location.href='commlist?page=${page}'"	>
	<input type="button" value = "수정"
		   onclick="location.href='commupdateform?no=${comm.no}&page=${page}'">
	<input type="button" value = "삭제"
		   onclick="location.href='commdelete?no=${comm.no}&page=${page} '">
	</div>
<form>
<input type = "text" placeholder="댓글 내용을 입력해주세요." name = >
</form>
</body>
</html>