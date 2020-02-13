<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="context" value="${pageContext.request.contextPath}"></c:set>
<form name="update" method="post" action="${context}/board/qna/update">

	<div>글 번호</div>
	<div>
		<input name="qna_no" value="${qnaVO.qna_no}" type="number"
			readonly="readonly">
	</div>

	<div>작성자</div>
	<div>
		<input name="qna_writer" value="${qnaVO.qna_writer}" type="text"
			readonly="readonly">
	</div>

	<div>작성일자</div>
	<div>${qnaVO.wdate}</div>

	<div>말머리</div>
	<div>
		<select name="qna_title" value="${qnaVO.qna_title}">
			<option>펫시터 질문</option>
			<option>유저 질문</option>
			<option>기타 질문</option>
		</select>
	</div>

	<div>제목 :</div>
	<div>
		<input name="qna_head" value="${qnaVO.qna_head}" type="text">
	</div>

	<div>내용 :</div>
	<div>
		<input name="qna_content" value="${qnaVO.qna_content}" type="text">
	</div>

	<div>
		<input type="submit" value="수정"> <input type="reset"
			value="초기화">
	</div>
</form>