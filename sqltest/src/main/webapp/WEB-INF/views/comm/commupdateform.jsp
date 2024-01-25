<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="css/commform.css" rel="stylesheet">
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script src="js/commform.js"></script>
</head>
<body>
	<jsp:include page="../include/header.jsp" />
	<form method="post" action="commupdate" enctype="multipart/form-data" id="checkform">
		<div>
			<input type="text" name="title" value="${comm.title }" id="title"
				class="title_Box">
		</div>
		<div>
			<input type="text" name="content" value="${comm.content }" id="content"
				class="text_Box">
		</div>
		<div class="file">
			<input type="file" name="fileupload" class="fileupload" value="파일 선택">
			<c:if test="${!empty comm.community_file }">
				<img
					src="<%= request.getContextPath() %>/upload/${comm.community_file}"
					height="300" width="300">
		</c:if>
		</div>

		<div class="commform_Btn">
			<input type="submit" value="글 수정" class="write_Btn"> 
			<input type="button" value="취소" class="reset_Btn"
				 onclick="location.href='commlist?page=${page}'">
		</div>
		<input type="hidden" name="no" value="${comm.no }">
		<input type="hidden" name="page" value="${page }">
		<input type="hidden" name="nick" value="${comm.nick }">
	</form>
</body>
</html>