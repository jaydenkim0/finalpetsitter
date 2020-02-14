<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


	<form method="post" action="${pageContext.request.contextPath}/board/review/update">
	
	<div>글 번호</div>
	<div>${reviewDto.review_no} </div>
	
	<div>작성자</div>
	<div>${reviewDto.review_writer}</div>
	
	<div>시터번호</div>
	<div>${reviewDto.review_sitter_no}</div>
	
	<div>작성일자</div>
	<div>${reviewDto.review_wdate}</div>
		
	<input type="hidden" name="review_no" value="${reviewDto.review_no}">
	<div>제목 : </div>
	<div><input name="review_title" value="${reviewDto.review_title}" type="text" required></div>
	
	<div>내용 : </div>
	<div><input name="review_content" value="${reviewDto.review_content}" type="text"  required></div>
	
	<div>별점 : </div>
	<div>
	<select name="review_star" required>
		<option value="">선택</option>
	   <option value=3>좋음(3)</option>
	   <option value=2>보통(2)</option>
	   <option value=1>나쁨(1)</option>
   </select></div>
	 		
	<div>
		<input type="submit" value="수정">
		<input type="reset" value="초기화">
	</div>
</form>