<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="context" value="${pageContext.request.contextPath}"></c:set>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

<c:choose>
	<c:when test="${sessionScope.id eq null }">
		<a href="${context}/member/login">로그인</a>
	</c:when>
	<c:otherwise>
	${sessionScope.id}님이 로그인 중입니다.
	<a href="${context}/member/logout">로그아웃</a>
	</c:otherwise>
</c:choose>

<h2>문의글 작성</h2>
<form method="post" action="insert" enctype="multipart/form-data">
	<input type="hidden" name="qna_writer" value="${sessionScope.id}">
	<table border="1" width="70%">
		<div>
			말머리 <select name="qna_title">
				<option>펫시터 질문</option>
				<option>유저 질문</option>
				<option>기타 질문</option>
			</select>
		</div>
		<br>
		<div>
			제목<input name="qna_head" id="qna_head" size="80"
				placeholder="글 제목 입력">
		</div>
		<br>
		<div>
			내용
			<textarea name="qna_content" id="qna_content" rows="8" cols="80"
				placeholder="글 내용 입력"></textarea>
		</div>
		<div>
			이미지 첨부 <input type="file" id="qna_file" name="qna_file" multiple
				accept="image/*" required>
		</div>
		<div style="width: 650px; text-align: center;">
			<input type="submit" value="확인"> <input type="reset"
				value="초기화">
		</div>
	</table>
</form>