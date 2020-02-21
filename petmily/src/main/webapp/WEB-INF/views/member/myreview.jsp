<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
						<img src="/petmily/resources/img/3점.png" style="width: 100%; height: auto;">
					</c:when>
					<c:when test="${reviewlist.review_star==2 }">
						<img src="/petmily/resources/img/2점.png" style="width: 100%; height: auto;">
					</c:when>
					<c:otherwise>
						<img src="/petmily/resources/img/1점.png" style="width: 100%; height: auto;">
					</c:otherwise>
				</c:choose>
			</td>
			<td>${reviewlist.writedateWithFormat }</td>
		</tr>
	</c:forEach>
</table>

</div>