<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>


    // 댓글 저장
    function saveComment() {

        const content = document.getElementById('content');
        isValid(content, '댓글');

        const postId = [[ ${post.id} ]];
        const params = {
            postId : postId,
            content : content.value,
            writer : '홍길동'
        }

        $.ajax({
            url : `/posts/${postId}/comments`,
            type : 'post',
            contentType : 'application/json; charset=utf-8',
            dataType : 'json',
            data : JSON.stringify(params),
            async : false,
            success : function (response) {
                console.log(response);
            },
            error : function (request, status, error) {
                console.log(error)
            }
        })
    }
    </script>
</head>
<body>
    <!--/* 댓글 작성 */-->
    <div class="cm_write">
        <fieldset>
            <legend class="skipinfo">댓글 입력</legend>
            <div class="cm_input">
                <p><textarea id="content" name="content" onkeyup="countingLength(this);" cols="90" rows="4" placeholder="댓글을 입력해 주세요."></textarea></p>
                <span><button type="button" class="btns" onclick="saveComment();">등 록</button> <i id="counter">0/300자</i></span>
            </div>
        </fieldset>
    </div>
</body>
</html>