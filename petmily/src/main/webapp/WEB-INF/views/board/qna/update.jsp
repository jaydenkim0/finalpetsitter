<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="context" value="${pageContext.request.contextPath}"></c:set>

<!-- jquery js -->
 <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>

<!-- css -->
  <link rel="stylesheet" href="${context}/resources/css/write.css">
  
<!-- 
HEADER 이용 시 넣어야할 요소 
:	jquery js,
	header css, 
	header script
-->
  <!-- header css -->
  <link rel="stylesheet" href="${context}/resources/css/header.css">
   <!-- header script -->
   <script>
      $(function() {
          $('body').addClass('js');
          $('#masthead').addClass('color');
          
          var $hamburger = $('.hamburger'),
              $nav = $('#site-nav'),
              $masthead = $('#masthead');

          $hamburger.click(function() {
            $(this).toggleClass('is-active');
            $nav.toggleClass('is-active');
            $masthead.toggleClass('is-active');
            return false; 
          })
      });
    </script>
 
	
<!-- 
FOOTER 이용 시 넣어야할 요소 
:	jquery js,
	footer css, 
	Required meta tags, 
	Bootstrap CSS,
	아이콘을 사용하기 위해 추가로 불러오는 CSS
-->
  	<!-- footer css -->
    <link rel="stylesheet" href="${context}/resources/css/footer.css"/>  
    <!-- Required meta tags -->
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <!-- 아이콘을 사용하기 위해 추가로 불러오는 CSS -->
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css" integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ" crossorigin="anonymous">

<!-- naver toast ui editor를 쓰기 위해 필요한 준비물 -->
    <link rel="stylesheet" type="text/css" href="${context}/resources/lib/toast/css/codemirror.min.css">
    <link rel="stylesheet" type="text/css" href="${context}/resources/lib/toast/css/github.min.css">
    <link rel="stylesheet" type="text/css" href="${context}/resources/lib/toast/css/tui-color-picker.min.css">
    <link rel="stylesheet" type="text/css" href="${context}/resources/lib/toast/dist/tui-editor.min.css">
    <link rel="stylesheet" type="text/css" href="${context}/resources/lib/toast/dist/tui-editor-contents.min.css">

    <script src="https://code.jquery.com/jquery-latest.js"></script>
    <script src="${context}/resources/lib/toast/dist/tui-editor-Editor-full.min.js"></script>

<style>
.btn {
	display: white;
	width: 80px;
	height: 10x;
	line-height: 20px;
	border: 1px #3399dd solid;
	background-color: white;
	text-align: center;
	font-size: 12px;
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

<!--
header style -->
#masthead:after {
	content: '';
	position: absolute;
	top: 0;
	width: 100%;
	height: 130px;
	background-color: #fff;
	opacity: 100;
	transition: opacity 0.3s ease;
}

#masthead.is-active {
	background-color: #fff;
}

.section-content {
	padding-top: 115px;
}

#masthead:after {
	opacity: 100;
}

.ta {
	padding-top: 70px;
}
.title{
	font-size: 50px;
	}
</style>


<!-- 네이버 에디터 설정 -->
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

<!-- header 불러오기 -->
		<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>
		
<section class="section-content">

<div align="left" class="tabl">
<section class="ta">
<form name="update" method="post" action="${context}/board/qna/update">
	<h1 class="title" align="center">Question</h1>
	<input type="hidden" name="member_id" value="${sessionScope.id}">
	<input type="hidden" name="qna_no" value="${qnaVO.qna_no}">

	<div class="form-group">
		<label for="qna_title">Title</label>
		<select name="qna_title" value="${qnaVO.qna_title}">
			<option>펫시터 질문</option>
			<option>유저 질문</option>
			<option>기타 질문</option>
		</select>
		</div>

	<div class="form-group">
		<label for="qna_head">Subject</label>
		<input class="form-control" name="qna_head" id="qna_head" placeholder="${qnaVO.qna_head}">
	</div>

	<div class="form-group">
	<label for="faq_content">Content</label>
		<div class="naver-editor"></div>
			 <input type="hidden" name="qna_content" value="${qnaVO.qna_content}">
	 </div>

		<div class="form-group" align="center">
			<input type="submit" value="수정"  class="btn hover3" > 
				<input type="reset"value="초기화"  class="btn hover3" >
				<a href="${context}/board/qna/list"> 
		<input type="button" value="목록으로"  class="btn hover3" ></a>
	</div>
</form>
</section>
</div>
</section>
<br>
<!--       footer 불러오기 -->
     <jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>            