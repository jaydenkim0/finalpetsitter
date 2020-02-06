<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
   <script src="http://code.jquery.com/jquery-latest.min.js"></script>
   <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <c:set var="context" value="${pageContext.request.contextPath}"></c:set>
	<c:set var="admin" value="${grade == 'admin'}"></c:set>
	<c:choose>
	<c:when test="${sessionScope.member_id == null }">
		<a href="${context}/member/login">로그인</a>
	</c:when>
	<c:otherwise>
	${sessionScope.member_id}님이 로그인 중입니다.
	<a href = "${context}/member/logout">로그아웃</a>
	</c:otherwise>
	</c:choose>
<script>
 	$(document).ready(function(){
 		$("#btnWrite").click(function(){
 			location.herf="${context}/board/faq/write";
 		});
 	});
 	</script>
<h1>공지사항 게시판</h1><br>
<form name="form1" method="post" action="${context}/board/faq/list">
	<select name="type">
		<option value="all" 
		<c:out value="${map.type == 'all'?'selected':''}"/>>말머리+제목+작성자+내용
		</option>
		<option value="member_id" 
		<c:out value="${map.type == 'member_id'?'selected':''}"/>>작성자
		</option>
		<option value="faq_title" 
		<c:out value="${map.type == 'faq_title'?'selected':''}"/>>말머리
		</option>
		<option value="faq_head" 
		<c:out value="${map.type == 'faq_head'?'selected':''}"/>>제목
		</option>
		</select>
<input name="keyword" value="${map.keyword}">
<input type="submit" value="조회">
</form>
${map.count}개의 게시물이 있습니다.
<table border="1" width="100%">
<tr>
	<th>글번호</th>
	<th>작성자</th>
	<th>말머리</th>
	<th>제목</th>
	<th>내용</th>
	<th>게시일자</th>
</tr>
<c:forEach var="row" items="${map.list}">
<tr>
	<td>${row.faq_no}</td>
	<td>${row.member_id}</td>
	<td>${row.faq_title}</td>
	<td>
		<a href="${context}/board/faq/view?faq_no=${row.faq_no}">${row.faq_head}</a>
	</td>
	<td>${row.faq_content}</td>
	<td>${row.wdate}</td>
</tr>
</c:forEach>
</table>
<%--  <c:if test="${admin}"> --%>
<a href="${context}/board/faq/write">
	<button type="button" id="btnwrite">글쓰기</button>
</a><br><br>
<%-- </c:if> --%>