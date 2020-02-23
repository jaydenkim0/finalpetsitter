<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<head>
<script>
function no_image2(){
	$("#2").attr("src", "/petmily/resources/img/기본프로필.jpeg");
}
</script>
</head>

<body>

<div align="center">

	<table border="1" width="">
		<tr>
			<th>리뷰 번호</th>
			<td>${review.review_no }</td>
		</tr>
		<tr>
			<th rowspan="2">펫시터</th>
			<td>${review.sitter_id }</td>
		</tr>
		<tr>
			<td>
				<img src = "${pageContext.request.contextPath }/board/care/member/image?member_image_member_id=${review.sitter_id }" style="max-width: 15%; height: auto;"  onerror="no_image2()" id="2">
			</td>
		</tr>
		<tr>
			<th>제목</th>
			<td>${review.review_title }</td>
		</tr>
		<tr>
			<th>평점</th>
			<td>${review.review_star }</td>
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