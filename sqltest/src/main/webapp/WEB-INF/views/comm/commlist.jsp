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
<meta charset="UTF-8">
<title>게시판 목록</title>
<style>
body{
  font-family: 'Montserrat', sans-serif;
  background:white;
}

.container{
  display:block;
  max-width:680px;
  width:80%;
  margin:120px auto;
  text-align:center;
}

.header1{
  color:#e91e63;
  font-size:48px;
  font-weight: bolder;
  letter-spacing:-3px;
  text-decoration : none;
  margin:120px 0 80px 0 ;
  transition:.2s linear;
}

 .login_btn{
     background:#1285C4;
     color:white;
     display:block;
     width:35%;
     max-width:680px;
     height:50px;
     border-radius:8px;
     margin:0 auto;
     border:none;
     cursor:pointer;
     font-size:20px;
     font-weight: bolder;
     font-family: 'Montserrat', sans-serif;
     box-shadow:0 15px 30px rgba(#e91e63,.36);
    transition:.2s linear;
    &:hover{
      box-shadow:0 0 0 rgba(#e91e63,.0);
    }
  }
} 

form{
  width:100%;
  max-width:680px;
  margin:40px auto 10px;
  .input__block{
     margin:20px auto;
     display:block;
     position:relative;
     &.first-input__block{
        &::before{
          content:"";
          position:absolute;
          top:-15px;
          left:50px;
          display:block;
          width:0;
          height:0;
        background:transparent;
          border-left:15px solid transparent;
          border-right:15px solid transparent;
          border-bottom:15px solid rgba(#0f132a,.1);
          transition:.2s linear;
        }
     }
      
 
  
     


</style>

</head>
<body>
	<div class="container" >
  	<a href = "commlist" class = "header1" >community</a>
	
	<form>
	
		<div>
			<c:if test="${empty sessionScope.nick }">
				<input type="button" value="로그인"  class="login_btn"
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

					<c:forEach var="t" items="${commList}">
						<tr>
							<td><c:out value="${num}" /> <c:set var="num"
									value="${num-1}" /></td>
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
		
</form>
	


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
	<a href="https://www.flaticon.com/kr/free-icons/" title="베타 아이콘"></a>
</html>