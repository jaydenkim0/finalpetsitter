<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<h1>돌봄게시판</h1>
<table border="1" width="100%">
	<tr>
		<th>글번호</th>
		<th>작성자</th>
		<th>펫시터</th>
		<th>내용</th>
		<th>등록일</th>
	</tr>
	<c:forEach var="list" items="${list }">
		<tr>
			<td>${list.care_board_no }</td>
			<td>${list.care_member_id }</td>
			<td>${list.sitter_id }</td>
			<td>${list.care_board_content }</td>
			<td>${list.wdate.substring(0,16) }</td>
		</tr>
	</c:forEach>
</table>