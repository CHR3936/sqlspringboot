<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<script>
$(function(){
	$('#menu1').click(function(){    		// 메뉴 보기1 클릭
		$.ajax({
			url: 'menu.html',				// 서버에 요청할 파일명
			type: 'post',       			// 전송방식 설정
			dataType: 'html',   			// 요청한 데이터 타입
			// 서버로부터 응답 받은 데이터는 콜백함수의 매개변수로 전달된다.
			success: function(data){		// 콜백함수
				alert(data);
				
				// 콜백함수로 돌려받은 data를 id가 message1인 태그사이에 출력
				$('#message1').html(data);
			}
		}); // $.ajax() end		
	});
	
</script>
</body>
</html>