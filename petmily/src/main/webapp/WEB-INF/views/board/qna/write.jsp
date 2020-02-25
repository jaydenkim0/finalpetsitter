<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="context" value="${pageContext.request.contextPath}"></c:set>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

<!-- BootStrap CDN -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

<!-- naver toast ui editor를 쓰기 위해 필요한 준비물 -->
    <link rel="stylesheet" type="text/css" href="${context}/resources/lib/toast/css/codemirror.min.css">
    <link rel="stylesheet" type="text/css" href="${context}/resources/lib/toast/css/github.min.css">
    <link rel="stylesheet" type="text/css" href="${context}/resources/lib/toast/css/tui-color-picker.min.css">
    <link rel="stylesheet" type="text/css" href="${context}/resources/lib/toast/dist/tui-editor.min.css">
    <link rel="stylesheet" type="text/css" href="${context}/resources/lib/toast/dist/tui-editor-contents.min.css">

    <script src="https://code.jquery.com/jquery-latest.js"></script>
    <script src="${context}/resources/lib/toast/dist/tui-editor-Editor-full.min.js"></script>
 <!-- 네이버 토스트에디터 종료 -->
    
<style>
.tabl {
	width: 60%;
	margin: auto;
}
a {
	text-decoration: none;
	color: black;
}
.btn {
	display: white;
	width: 80px;
	height: 10x;
	line-height: 20px;
	border: 1px #3399dd solid;
	background-color: white;
	text-align: center;
	cursor: pointer;
	color: #1482e0;
	transition: all 0.9s, color 0.3;
}

.btn:hover {
	color: white;
}

.hover3:hover {
	background-color: #1482e0;
}

input {
	width: 150px;
	height: 35px;
	font-size: 14px;
	vertical-align: middle;
	border-color: #BDBDBD;
	border-style: solid;
	border-width: 1px;
	border-radius: 4px;
}
.input-file{
	width: 100%;
	height: 35px;
	border-style : none;
}

select {
	width: 100%;
	height: 35px;
	font-size: 14px;
	vertical-align: middle;
	border-color: #BDBDBD;
	border-style: solid;
	border-width: 1px;
	border-radius: 4px;
}
</style>

    <script>
        $(function(){
            //생성은 항상 옵션 먼저 + 나중에 생성
            var options = {
                //대상
                el:document.querySelector(".naver-editor"),
                //미리보기 스타일(vertical / horizontal)
                previewStyle:"horizontal",
                //입력 스타일
                initialEditType:"wysiwyg",
                //높이
                height:"300px"
            };

            var editor = tui.Editor.factory(options);

            //에디터의 값이 변하면 뒤에 있는 input[type=hidden]의 값이 변경되도록 처리
            editor.on("change", function(){
                var text = editor.getValue();//에디터에 입력된 값을 불러온다
                document.querySelector(".naver-editor + input[type=hidden]").value = text;
            });
        });
    </script>

<c:choose>
	<c:when test="${sessionScope.id eq null }">
		<a href="${context}/member/login">로그인</a>
	</c:when>
	<c:otherwise>
	${sessionScope.id}님이 로그인 중입니다.
	<a href="${context}/member/logout">로그아웃</a>
	</c:otherwise>
</c:choose>


<div align="left" class="tabl">
	<form method="post" action="insert" enctype="multipart/form-data">
		<h2>문의글 작성</h2>
		<c:if test="${param.superno>0}">
			<input type="hidden" name="superno" value="${param.superno}">
		</c:if>

		<input type="hidden" name="qna_writer" value="${sessionScope.id}">
		<div class="form-group">
			<label for="qna_title">말머리</label> <select name="qna_title">
				<option>펫시터 질문</option>
				<option>유저 질문</option>
				<option>기타 질문</option>
				<option>신고합니다</option>
			</select>
		</div>

		<div class="form-group">
			<label for="qna_head">제목</label>
			<c:choose>
				<c:when test="${param.superno > 0}">
					<input class="form-control" type="text" name="qna_head" value="RE:"
						id="qna_head" size="75">
				</c:when>
				<c:otherwise>
					<input class="form-control" name="qna_head" id="qna_head" size="75"
						placeholder="글 제목 입력">
				</c:otherwise>
			</c:choose>
		</div>

		<div class="form-group">
			<label for="qna_content">내용</label>
			<div class="naver-editor"></div>
			<input type="hidden" name="qna_content" value="">
		</div>

		<div class="form-group">
			<label for="qna_file">이미지 첨부</label> 
			<input class="input-file" type="file" id="qna_file" name="qna_file" multiple accept="image/*">
		</div>

		<div class="form-group" align="center">
			<input type="submit" value="확인" class="btn hover3"> 
			<input type="reset" value="초기화" class="btn hover3">
		</div>
	</form>
</div>
