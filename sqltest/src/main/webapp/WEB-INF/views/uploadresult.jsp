<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    



<c:if test="${result ==1 }">
	<script>
		alert("파일은 100KB까지 업로드 가능합니다");
		history.go(-1);
	</script>
</c:if>

<c:if test="${result == 2 }">
	<script>
		alert("첨부파일은 jpg, git, png 파일만 업로드 가능합니다.");
		history.go(-1);
	</script>

</c:if>