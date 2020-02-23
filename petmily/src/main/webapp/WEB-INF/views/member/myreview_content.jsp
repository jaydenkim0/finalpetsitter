<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script>
$(function(){
	
});
</script>
</head>

<body>

<div align="center">

	<table border="1" width="100%">
		<tr>
			<th>리뷰 번호</th>
			<td>${review.review_no }</td>
		</tr>
		<tr>
			<th rowspan="2">펫시터</th>
			<td>
				<img src = "petmily/board/care/member/image?member_image_member_id=${review.sitter_id }" style="max-width: 15%; height: auto;"onerror="this.onerror=null; this.src='/petmily/resources/img/기본프로필.jpeg';">
			</td>
		</tr>
		<tr>
			<td>${review.sitter_id }</td>
		</tr>
		<tr>
			<th>제목</th>
			<td>${review.review_title }</td>
		</tr>
		<tr>
			<th>별점</th>
			<td>
				<c:choose>
					<c:when test="${review.review_star==3 }">
						<img src="/petmily/resources/img/3.png" style="width: auto; height: 20px;">
					</c:when>
					<c:when test="${review.review_star==2 }">
						<img src="/petmily/resources/img/2.png" style="width: auto; height: 20px;">
					</c:when>
					<c:otherwise>
						<img src="/petmily/resources/img/1.png" style="width: auto; height: 20px;">
					</c:otherwise>
				</c:choose>
			</td>
		</tr>
		<tr>
			<th>작성일자</th>
			<td>${review.writedateWithFormat }</td>
		</tr>
		<tr>
			<th>내용</th>
			<td>${review.review_content }</td>
		</tr>
	</table>

</div>

</body>