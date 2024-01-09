<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!doctype html>
<html lang="ko">
<head>
<script src = "http://code.jquery.com/jquery-latest.js"></script>
	<meta charset="UTF-8">
	<title>게시판 목록</title>
<style>
 table{
 	border: 1;
 	width: 800px;
    border-collapse: collapse;
    margin: auto;
 }
 th, td {
    border-bottom: 1px solid #3E70A6;
    padding: 10px;
  }
 
 .top{
 	background: #569FBF;
 	height: 50px;
 	color : white;
 }

.tbody{
	text-align: center;
}
</style>
</head>
<body>
	<div>
		<div align = "right">
		<c:if test="${empty sessionScope.nick }">
		<input type = "button" value = "로그인" onclick = "location.href='loginform'">
		</c:if>
		<c:if test="${!empty sessionScope.nick }">
		<input type = "button" value = "로그아웃" onclick = "location.href = 'logout'">
		</c:if>
		</div>
		<table >
		<tr class = "top">
			<th>번호</th>
			<th>제목</th>
			<th>작성자</th>
			<th>날짜</th>
			<th>조회수</th>
		</tr>		
		</div>
		
		<c:set var = "num" value ="${listCount-(page-1)*10}"/>
		<tbody class = "tbody">
			
		<c:forEach var = "t" items ="${commList}">
		<tr>		
			<td>
				<c:out value="${num}"/>
				<c:set var="num" value ="${num-1}"/>
			</td>
			<td>
				<a href = "commcontent?no=${t.no}&page=${page}">${t.title }</a>
			</td>
			<td>${t.nick }</td>
			<td>
				<fmt:formatDate value="${t.reg_date }" pattern="yyyy-MM-dd"/>
			</td>
			<td>${t.read_count }</td>
		</tr>
		</c:forEach>
		</tbody>	
	</table>
	
	
	
	
	
	
	
	<div align = "right">
	<a href="commform">글쓰기</a>
	</div>
	<div align = "right" class = "snick">
	<%= session.getAttribute("nick") %>
	</div>
	
	
	
	
	<center>
		<c:if test="${listCount > 0 }">
			
		<a href = "commlist?page=1" style="text-decoration: none"> << </a>
		
		<c:if test="${startPage > 10 }">
			<a href = "commlist?page=${startPage - 10 }">[이전]</a>
		</c:if>
		
		<c:forEach var ="i" begin = "${startPage}" end="${endPage }">
			<c:if test="${i == page }">
				[${i }]
			</c:if>
			<c:if test="${i != page }">
				<a href="commlist?page=${i }">[${i}]</a>
			</c:if>
		</c:forEach>	
		
		<c:if test="${endPage < pageCount }">
			<a href="commlist?page=${startPage + 10 }">[다음]</a>
		</c:if>	
			
			<a href = "commlist?page=${pageCount }" style="text-decoration: none"> >> </a>
			
		</c:if>
	</center>
</body>
</html>