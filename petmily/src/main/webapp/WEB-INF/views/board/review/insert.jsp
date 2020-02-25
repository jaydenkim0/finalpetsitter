<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="context" value="${pageContext.request.contextPath}"></c:set>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<html lang="en">
<html>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <script src="https://cdn.jsdelivr.net/gh/hiphop5782/js/star/hakademy-star.min.js"></script>
    
    <title>Document</title>
    <style></style>
    <script>
        window.addEventListener("load", function(){
            Hakademy.PointManager.factory(".star-wrap");
        });
    </script>
    
    
    <!-- 에디터 불러오기 -->
<link
	href="https://cdn.jsdelivr.net/npm/suneditor@latest/dist/css/suneditor.min.css"
	rel="stylesheet">
    
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
  textarea[name=review_content]{
       width:100%;
       height:150px;
    } 
</style>

<script>
	$(function() {
		//생성은 항상 옵션 먼저 + 나중에 생성
		var options = {
			//대상
			el : document.querySelector(".naver-editor"),
			//미리보기 스타일(vertical / horizontal)
			previewStyle : "horizontal",
			//입력 스타일
			initialEditType : "wysiwyg",
			//높이
			height : "300px"
		};

		var editor = tui.Editor.factory(options);

		//에디터의 값이 변하면 뒤에 있는 input[type=hidden]의 값이 변경되도록 처리
		editor
				.on(
						"change",
						function() {
							var text = editor.getValue();//에디터에 입력된 값을 불러온다
							document
									.querySelector(".naver-editor + input[type=hidden]").value = text;
						});
	});
</script>
   

    <div align = "center" class="tabl">
    <form method="post" action="insert" enctype="multipart/form-data">
    	<h2>리뷰 작성</h2>
	<input type="hidden" name="review_writer" value="${id}">
	<div class="form-group" align="right">
		<label for="review_star">별점</label> 
		<select name="review_star" required>
			<option value="">선택</option>
			<option value=3>좋음(★★★)</option>
			<option value=2>보통(★★)</option>
			<option value=1>나쁨(★)</option>
		</select>
	</div>
	
		<div class="form-group" align="right">
		<label for="review_writer" >작성자 ID : ${id}</label> 
	  
	</div>


	<input type="hidden" name="review_reservation_no" value="${reservation.reservation_no}">
	<div class="form-group">
		<label for="review_title">제목</label> 
		<input class="form-control" name="review_title" id="review_title" placeholder="글 제목 입력" required>
	</div>
	
	<div class="form-group">
		<label for="review_sitter_no">펫시터번호</label> 
		<input class="form-control" name="review_sitter_no"  value="${reservation.reservation_sitter_no}" required>
	</div>


	<div class="form-group">
	<label for="review_content">내용</label>
	<div class="naver-editor"></div>
	 <input type="hidden" name="review_content" value="review_content" required></div>

    <div class="form-group" align="right">
		<label for="review_reservation_no" >예약번호 : ${reservation.reservation_no}</label> 
	  
	</div>
	

<div class="form-group">
		<input type="submit" value="확인">
		<input type="reset" value="초기화">
</div>
</form>
</div>