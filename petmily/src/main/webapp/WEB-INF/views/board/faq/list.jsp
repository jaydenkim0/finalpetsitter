<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
  <c:set var="context" value="${pageContext.request.contextPath}"></c:set>
<h1>공지사항 게시판</h1>
<a href="${context}/board/faq/write">글쓰기</a><br><br>
<table border="1" width="100%">
<tr>
	<th>글번호</th>
	<th>작성자</th>
	<th>말머리</th>
	<th>제목</th>
	<th>내용</th>
	<th>게시일자</th>
</tr>
<c:forEach var="row" items="${list}">
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