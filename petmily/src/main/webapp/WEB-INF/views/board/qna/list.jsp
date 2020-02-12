<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
  <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
   <script src="http://code.jquery.com/jquery-latest.min.js"></script>
   <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <c:set var="context" value="${pageContext.request.contextPath}"></c:set>
	<c:choose>
	<c:when test="${sessionScope.id eq null }">
		<a href="${context}/member/login">로그인</a>
	</c:when>
	<c:otherwise>
	${sessionScope.id}님이 로그인 중입니다.
	<a href = "${context}/member/logout">로그아웃</a>
	</c:otherwise>
	</c:choose>
<script>
 	$(document).ready(function(){
 		$("#btnWrite").click(function(){
 			location.herf="${context}/board/qna/write";
 		});
 	});
 	function list(page){
 		loaction.href="${context}/board/list?curPage="+page+
 				"&type-${map.type}"+"&keyword=${map.keyword}";
 	}
 	</script>
<h1>문의 게시판</h1><br>
<a href="${context}/board/qna/write">
	<button type="button" id="btnwrite">글쓰기</button>
</a><br><br>
<form method="get" action="${context}/board/qna/list">
	<select name="type" class="input-item">
		<option value="qna_writer" >작성자</option>
		<option value="qna_head" >제목</option>
		</select>
<input class="input-item" name="keyword" placeholder="검색어" requierd>
<input type="submit" value="조회">
</form>
<section>
<table border="1" width="100%">
<tr>
	<th>글번호</th>
	<th>작성자</th>
	<th>말머리</th>
	<th>제목</th>
	<th>게시일자</th>
</tr>
<c:forEach var="row" items="${list}">
<tr>
	<td>${row.qna_no}</td>
	<td>${row.qna_writer}</td>
	<td>${row.qna_title}</td>
	<td>
		<a href="${context}/board/qna/view?qna_no=${row.qna_no}">${row.qna_head}</a>
	</td>
	<td>${row.writedateWithFormat}</td>
</tr>
</c:forEach>
</table>
<div class="row" >
		<!-- 네비게이터(navigator) -->
		<jsp:include page="/WEB-INF/views/board/qna/navigator.jsp">
			<jsp:param name="pno" value="${pno}"/>
			<jsp:param name="count" value="${count}"/>
			<jsp:param name="navsize" value="${navsize}"/>
			<jsp:param name="pagesize" value="${pagesize}"/>
		</jsp:include>
	</div>
</section>






