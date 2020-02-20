<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
			location.herf = "${context}/board/stray/write";
		});
	});
	function list(page) {
		loaction.href = "${context}/board/list?curPage=" + page
				+ "&type-${map.type}" + "&keyword=${map.keyword}";
	}
</script>
<h1>Save the Pets !</h1>
<br>
<%-- <c:if test="${not empty sessionScope.id}"> --%>
<a href="${context}/board/stray/write">
	<button type="button" id="btnwrite">글쓰기</button>
</a>
<br>
<br>
<%-- </c:if> --%>
<form method="get" action="${context}/board/stray/list">
	<select name="type" class="input-item">
		<option value="stray_writer">작성자</option>
		<option value="stray_head">제목</option>
	</select> <input class="input-item" name="keyword" placeholder="검색어" requierd>
	<input type="submit" value="조회">
</form>
<section>
	<table border="1" width="100%">
		<tr>
			<th>글번호</th>
			<th>작성자</th>
			<th>제목</th>
			<th>게시일자</th>
			<th>groupno</th>
			<th>superno</th>
			<th>depth</th>
		</tr>
		<c:forEach var="row" items="${list}">
			<tr>
				<td>${row.stray_no}</td>
				<c:choose>
					<c:when test="${not empty row.stray_writer}">
						<td>${row.stray_writer}</td>
					</c:when>
					<c:otherwise>
						<td>비회원</td>
					</c:otherwise>
				</c:choose>
				<td align="left">
					<!-- 제목을 depth번 만큼 띄어쓰기 후 출력 -->
						<c:forEach var="i" begin="1" end="${row.depth}">
							&nbsp;&nbsp;&nbsp;&nbsp;
						</c:forEach>
						
						<!-- 답글은 이미지를 추가 -->
						<c:if test="${row.depth > 0}">
						 <img src="${context}/resources/img/reply.png" width="20" height="10">
						</c:if>
						
						<a href="view?stray_no=${row.stray_no}">
							<!-- 제목 출력 -->
							${row.stray_head}
						</a>
					</td>
				<td>${row.writedateWithFormat}</td>
				<td>${row.groupno}</td>
				<td>${row.superno}</td>
				<td>${row.depth}</td>
			</tr>
		</c:forEach>
	</table>
	<div class="row">
		<!-- 네비게이터(navigator) -->
		<jsp:include page="/WEB-INF/views/board/stray/navigator.jsp">
			<jsp:param name="pno" value="${pno}" />
			<jsp:param name="count" value="${count}" />
			<jsp:param name="navsize" value="${navsize}" />
			<jsp:param name="pagesize" value="${pagesize}" />
		</jsp:include>
	</div>
</section>