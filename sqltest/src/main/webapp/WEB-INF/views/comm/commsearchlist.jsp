<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!doctype html>
<html lang="ko">
<head>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-KyZXEAg3QhqLMpG8r+8fhAXLRk2vvoC2f3B09zVXn8CA5QIVfZOJ3BCsw2P0p/We"
	crossorigin="anonymous">
<link href = "css/commlist.css" rel="stylesheet">
	
<meta charset="UTF-8">
<title>게시판 목록</title>


</head>
<body>
	<div class="container1" align = "center">
		<a href="commlist" class="headlist">community</a>
	</div>
		<div >
			<c:if test="${empty sessionScope.nick }">
				<input type="button" value="로그인"  class="btn_login"
				onclick="location.href='loginform'">
			</c:if>
			<c:if test="${!empty sessionScope.nick }">
				<div class="snick">
					<%=session.getAttribute("nick")%>
					<input type="button" value="로그아웃"
						onclick="location.href = 'logout'">
				</div>
			</c:if>
		</div>

		<div id="list">
			<table style="margin-left: auto; margin-right: auto;">

				<tr class="top">
					<th class = "num">번호</th>
					<th>제목</th>
					<th>작성자</th>
					<th>날짜</th>
					<th class = "count">조회수</th>
				</tr>

				<c:set var="num" value="${listCount-(page-1)*10}" />
				<tbody class="tbody">

					<c:forEach var="t" items="${commSearchList}">
						<tr>
							<td><c:out value="${num}" /> 
							<c:set var="num" value="${num-1}" /></td>
							<td><a href="commcontent?no=${t.no}&page=${page}">${t.title }</a>
							</td>
							<td>${t.nick }</td>
							<td><fmt:formatDate value="${t.reg_date }"
									pattern="yyyy-MM-dd" /></td>
							<td>${t.read_count }</td>
						</tr>
						
					</c:forEach>
				</tbody>
			</table>
				<div>
				<input type="button" value="글쓰기" class="btn_commform"
						onclick="location.href = 'commform' " >
				</div>
				
		</div>
		<div align = "center">
		<form action="commSearch" method="post">
				<select name = "type">
					<option value ="title" >제목</option>
					<option value ="content">내용</option>
					<option value ="title_content">제목+내용</option>
					<option value ="nick">작성자</option>
				</select>
				<input type="text" name ="keyword" name = "keyword"/>
				<input type="submit" value = "검색"/>
		</form>
		</div>

		


		<c:if test="${listCount > 0 }">
			<div class="container">
				<div class="row">
					<div class="col">
						<ul class="pagination justify-content-center">

							<li class="page-item"><a class="page-link"
								href="commlist?page=1" style="text-decoration: none"> << </a></li>

							<c:if test="${startPage > 10 }">
								<li class="page-item"><a a class="page-link"
									href="commlist?page=${startPage - 10 }">[이전]</a></li>
							</c:if>

							<li class="page-item"><c:forEach var="i"
									begin="${startPage}" end="${endPage }">
									<li class="page-item"><c:if test="${i == page }">
											<a class="page-link">${i }</a>
										</c:if></li>
									<c:if test="${i != page }">
										<li class="page-item"><a class="page-link"
											href="commlist?page=${i }">[${i}]</a></li>
									</c:if></li>
							</c:forEach>
							</li>

							<c:if test="${endPage < pageCount }">
								<li class="page-item"><a class="page-link"
									href="commlist?page=${startPage + 10 }">[다음]</a></li>
							</c:if>

							<li class="page-item"><a class="page-link"
								href="commlist?page=${pageCount }" style="text-decoration: none">
									>> </a></li>
		</c:if>
		</ul>
	</div>
	</div>
	</div>

</body>
</html>