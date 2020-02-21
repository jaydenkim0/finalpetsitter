<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<head>

<style>
li{
  	list-style-type:none;
  	float:left;
  	margin-left:20px;	
}
</style>

</head>

<body>

<c:set var="context" value="${pageContext.request.contextPath}"></c:set>
<div align="center">

<h1>내가 쓴 리뷰</h1>

<table width="100%" border="1">
	<tr>
		<td>리뷰번호</td>
		<td>펫시터</td>
		<td>제목</td>
		<td>별점</td>
		<td>작성일</td>
	</tr>
	<c:forEach var="reviewlist" items="${review }">
		<tr>
			<td>${reviewlist.review_no }</td>
			<td>
			<c:choose>
				<c:when test="${not empty reviewlist.sitter_id }">
					${reviewlist.sitter_id }
				</c:when>
				<c:otherwise>
					탈퇴회원
				</c:otherwise>
			</c:choose>
			</td>
			<td>
				<a href="review_content?review_no=${reviewlist.review_no }">
					${reviewlist.review_title }
				</a>
			</td>
			<td>
				<c:choose>
					<c:when test="${reviewlist.review_star==3 }">
						<img src="/petmily/resources/img/3.png" style="width: auto; height: 20px;">
					</c:when>
					<c:when test="${reviewlist.review_star==2 }">
						<img src="/petmily/resources/img/2.png" style="width: auto; height: 20px;">
					</c:when>
					<c:otherwise>
						<img src="/petmily/resources/img/1.png" style="width: auto; height: 20px;">
					</c:otherwise>
				</c:choose>
			</td>
			<td>${reviewlist.writedateWithFormat }</td>
		</tr>
	</c:forEach>
</table>

<div class="row">
	<!-- 네비게이터(navigator) -->
	<jsp:include page="/WEB-INF/views/member/navigator_myreview.jsp">
		<jsp:param name="pno" value="${pno}"/>
		<jsp:param name="count" value="${count}"/>
		<jsp:param name="navsize" value="${navsize}"/>
		<jsp:param name="pagesize" value="${pagesize}"/>
		<jsp:param name="care_board_no" value="${care_board_no }"/>
	</jsp:include>
</div><br><br><br><br>

</div>

</body>