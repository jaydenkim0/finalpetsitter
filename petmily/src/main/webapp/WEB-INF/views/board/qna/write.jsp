<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="context" value="${pageContext.request.contextPath}"></c:set>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>

<!-- jquery js -->
 <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>

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
<!-- header style -->
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
	
	#masthead.is-active{
	 background-color: #fff;
	}
	
	.section-content{
	padding-top:150px;
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


<!-- header 불러오기 -->
		<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>
		
<section class="section-content">

<div align="left" class="tabl">
	<form method="post" action="insert" enctype="multipart/form-data">
		<h2>문의사항 작성</h2>
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
</section>
<br>
      <!-- footer 불러오기 -->
     <jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>            