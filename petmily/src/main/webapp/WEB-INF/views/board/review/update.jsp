<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

	<form name="update" method="post" action="/board/review/update">
	
	<div>글 번호</div>
	<div><input name="review_no" value="${reviewDto.review_no}"  type="number" readonly="readonly"></div>
	
	<div>작성자</div>
	<div><input name="review_writer" value="${reviewDto.review_writer}"  type="text" readonly="readonly"></div>
	
	<div>시터번호</div>
	<div><input name="review_sitter_no" value="${reviewDto.review_sitter_no}"  type="text" ></div>
	
	<div>작성일자</div>
	<div>${reviewDto.review_wdate}</div>
		
	
	<div>제목 : </div>
	<div><input name="review_title" value="${reviewDto.review_title}" type="text" required></div>
	
	<div>내용 : </div>
	<div><input name="review_content" value="${reviewDto.review_content}" type="text"  required></div>
	
	<div>별점 : </div>
	<div>
	<select name="review_star" value="${reviewDto.review_star}" required>
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