<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 


<h1>리뷰 게시판</h1>
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

