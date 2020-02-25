<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="context" value="${pageContext.request.contextPath}"></c:set>
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
	font-size : 12px;
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
                height:"300px",
                
                hooks: {
                    'addImageBlobHook': function(blob, callback) {
                        //이미지 블롭을 이용해 서버 연동 후 콜백실행
                        //callback('이미지URL');
                        console.log("이미지 업로드");
                    }
                }
            };

            var editor = tui.Editor.factory(options);

            //에디터의 값이 변하면 뒤에 있는 input[type=hidden]의 값이 변경되도록 처리
            editor.on("change", function(){
                var text = editor.getValue();//에디터에 입력된 값을 불러온다
                document.querySelector(".naver-editor + input[type=hidden]").value = text;  
            });
            var text = document.querySelector(".naver-editor + input[type=hidden]").value;
            editor.setValue(text);//값 설정
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
<form name="update" method="post" action="${context}/board/faq/update">
	<h2 align="center">공지글 수정</h2>
	<input type="hidden" name="member_id" value="${sessionScope.id}">
	<input type="hidden" name="faq_no" value="${faqVO.faq_no}">

	<div class="form-group">
		<label for="faq_title">말머리</label>
		<select name="faq_title" value="${faqVO.faq_title}">
			<option>전체공지</option>
			<option>펫시터공지</option>
			<option>유저공지</option>
		</select>
	</div>

	<div class="form-group">
		<label for="faq_head">제목</label>
		<input class="form-control" name="faq_head" id="faq_head" placeholder="${faqVO.faq_head}">
	</div>

	<div class="form-group">
	<div class="naver-editor"></div>
	 <input type="hidden" name="faq_content" value="${faqVO.faq_content}">
	 </div>

	<div class="form-group" align="center">
		<input type="submit" value="수정" class="btn hover3" > 
		<input type="reset"value="초기화" class="btn hover3" >
		<a href="${context}/board/faq/list"> 
		<input type="button" value="목록으로" class="btn hover3" ></a>
	</div>
</form>
</div>