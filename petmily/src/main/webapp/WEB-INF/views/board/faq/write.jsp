<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script>
$(document).ready(function(){
	$("#btnWrite").click(function(){
		loaction.href="${path}/board/faq/write";
	});
});
</script>
</head>
<body>
<h1>공지사항 게시판</h1>
<button type="button" id="btnWrite">글쓰기</button><br><br>
<table border="1" width="600px">
<tr>
	<th>글번호</th>
	<th>말머리</th>
	<th>제목</th>
</tr>
<c:forEach var="row" items="${list}">
<tr>
	<td>${row.faq_no}</td>
	<td><a href="${path}/board/faq/view?=faq_no=${rwo.faq_no}"></a></td>
	<td>${row.member_id}</td>
	<td>${row.faq_head}</td>
</c:forEach>
</table>
</body>
</html>