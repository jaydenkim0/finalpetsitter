<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
  
 <form action ="test" method="post">


<h1>리뷰 게시판</h1>
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
</tr>
</c:forEach>
</table>
</form>
