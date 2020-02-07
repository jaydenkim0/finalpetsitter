<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
   <c:set var="context" value="${pageContext.request.contextPath}"></c:set>

<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script> 
<script>
function list(page){
  console.log("페이지를 이동합니다");
  location.href="list?curPage="+page;
  }
  
</script>
   
    
    
    
    
    <h1>리뷰 게시판</h1>
<a href="#{context}/board/review/write"><button>글쓰기</button></a>
<table border="1" width="100%">
<tr>
<th>글번호</th>
<th>작성자</th>
<th>제목</th>
<th>내용</th>
<th>게시일자</th>
<th>평점</th>
</tr>
<c:forEach var="row" items="${list}">
<tr>
	<td>${row.review_no}</td>
	<td>${row.member_id}</td>
	<td>${row.review_title}</td>
	<td>${row.review_content}</td>
	<td>${row.review_wdate}</td>
	</tr>${row.review_star}</td>
		<a href="${context}/board/review/"></a>
	</td> 
</c:forEach>


</table>

 