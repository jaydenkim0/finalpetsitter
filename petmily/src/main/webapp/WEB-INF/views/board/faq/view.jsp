<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
  <c:set var="context" value="${pageContext.request.contextPath}"></c:set>
<h2>게시글 상세 보기</h2>
	<a href="${context}/board/faq/write">글쓰기</a>

<table border="1">
	<th>정보</th>
	<th>데이터</th>
	
	<!--FaqDto view 안에 있는 정보 불러오기 -->
<tr>
	<td>글번호</td>
	<td>${view.faq_no}</td>
</tr>

<tr>
	<td>게시일자</td>
	<td>${view.wdate}</td>
</tr>

<tr>
	<td>말머리</td>
	<td>${view.faq_title}</td>
</tr>

<tr>
	<td>제목</td>
	<td>${view.faq_head}</td>
</tr>
<tr>
	<td>내용</td>
	<td>${view.faq_content}</td>
</tr>
</table>
	<a href="${context}/board/faq/list">목록으로</a>
	<a href="${context}/board/faq/update?faq_no=${view.faq_no}">수정</a>
	<a href="${context}/board/faq/delete?faq_no=${view.faq_no}">삭제</a>