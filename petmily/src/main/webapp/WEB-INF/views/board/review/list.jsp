<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <script src="http://code.jquery.com/jquery-latest.min.js"></script>
 <script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
 <c:set var="context" value="${pageContext.request.contextPath}"></c:set>
 
 <c:choose>
	<c:when test="${sessionScope.id eq null }">
		<a href="${context}/member/login">로그인</a>
	</c:when>
	<c:otherwise>
	${sessionScope.id}님이 로그인 중입니다.
	<a href="${context}/member/logout">로그아웃</a>
	</c:otherwise>
</c:choose> 
 <script>
	$(document).ready(function() {
		$("#btnWrite").click(function() {
			location.herf = "${context}/board/review/insert";
		});
	});
	function list(page) {
		loaction.href = "${context}/board/list?curPage=" + page
				+ "&type-${map.type}" + "&keyword=${map.keyword}";
	}
</script>
<style>
.page-navigator li {
	display: inline-block;
}
</style>
<h1>리뷰 게시판</h1>
<br>
<%-- <c:if test="${sessionScope.grade eq 'admin'}"> --%>
<%-- 	<a href="${context}/board/review/list"> --%>
<!-- 		<button type="button" id="btndelete">삭제</button> -->
<!-- 	</a> -->
<!-- 	<br> -->
<!-- 	<br> -->
<%-- </c:if> --%>
<form method="get" action="${context}/board/review/list">
	<select name="type" class="input-item">
	<option value="review_writer">작성자</option>
		<option value="review_title">제목</option>
		<option value="review_content">내용</option>
	</select> <input class="input-item" name="keyword" placeholder="검색어" requierd>
	<input type="submit" value="조회">
</form>




<section>
<table border="1" width="100%">
<tr>
	<th>글번호</th>
	<th>작성자</th>
	<th>시터번호</th>
	<th>제목</th>
	<th>내용</th>
	<th>별점</th>
	<th>작성일</th>
	 
	
</tr>
<c:forEach var="reviewDto" items="${list}">
<tr>
	<td>${reviewDto.review_no}</td>
	<td>${reviewDto.review_writer}</td>
	<td>${reviewDto.review_sitter_no}</td>
	<td>${reviewDto.review_title}</td>
	<td>${reviewDto.review_content}</td>
	<td>${reviewDto.review_star}</td>
	<td>${reviewDto.review_wdate}</td>
	
	<td width="40">
<%-- 	<a href="/petmily/board/review/update?review_no=${reviewDto.review_no}"> --%>
<!-- 	<button type="button" id="btnupdate">수정</button> -->
</a>
<a href="/petmily/board/review/delete?review_no=${reviewDto.review_no}">
	<button type="button" id="btndelete">삭제</button>
	</a>
	</td>
</tr>
</c:forEach>
</table>
<div class="row">
<!-- 네비게이터(navigator) -->
		<jsp:include page="/WEB-INF/views/board/review/navigator.jsp">
			<jsp:param name="pno" value="${pno}" />
			<jsp:param name="count" value="${count}" />
			<jsp:param name="navsize" value="${navsize}" />
			<jsp:param name="pagesize" value="${pagesize}" />
		</jsp:include>
		</div>
	</section>

