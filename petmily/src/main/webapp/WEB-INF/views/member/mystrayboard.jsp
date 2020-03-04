<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<head>

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<!-- BootStrap CDN -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
	
<style>
.page-navigator li {
	display: inline-block;
}

.notice_table {
	width: 80%;
	border-top: 1px solid #444444;
	border-collapse: collapse;
	border-color : #BDBDBD;
}

th, td {
	border-bottom: 1px solid #444444;
	padding: 10px;
	text-align: center;
	border-color : #BDBDBD;
}

a {
	text-decoration: none;
	color: black;
}

.right_mar {
	margin-right: 10%;
}

.page-navigator li {
	display: inline-block;
}

.page-navigator li.active>a {
	color: #1482e0;
}

.btn {
	display: white;
	width: 80px;
	height: 10x;
	line-height: 20px;
	border: 1px #3399dd solid;
	background-color: white;
	text-align: center;
	font-size : 12px;
	cursor: pointer;
	color: #1482e0;
	transition: all 0.9s, color 0.3;
}

.btn:hover {
	color: white;
}

.hover3:hover {
	background-color: #1482e0;
}

input {
	width: 150px;
	height: 35px;
	font-size: 14px;
	vertical-align:middle; 
	border-color : #BDBDBD;
	border-style: solid;
	border-width: 1px;
	border-radius: 4px;
}

select {
	width: 80px;
	height: 35px;
	font-size: 14px;
	vertical-align:middle; 
	border-color : #BDBDBD;
	border-style: solid;
	border-width: 1px;
	border-radius: 4px;
	}
</style>

</head>

<body>

<c:set var="context" value="${pageContext.request.contextPath}"></c:set>

<div align="center">
<br>
<h1>나의 Save the Pets ! 게시글</h1>
<br>
<section>
<table class="notice_table">
	<tr>
		<td>글번호</td>
		<td>제목</td>
		<td>게시일자</td>
	</tr>
	<c:forEach var="strayboard" items="${strayboard_list }">
		<tr>
			<td>${strayboard.stray_no }</td>
			
			<td align="left">
				<c:forEach var="i" begin="1" end="${strayboard.depth}">
					&nbsp;&nbsp;&nbsp;&nbsp;
				</c:forEach> 
				<!-- 답글은 이미지를 추가 --> 
				<c:if test="${strayboard.depth > 0}">
					<img src="${context}/resources/img/reply.png" width="20" height="10">
				</c:if> 
				<font color="#1482e0"> [${strayboard.stray_title}] </font> 
				<a href="${context }/board/stray/view?stray_no=${strayboard.stray_no}"> 
					<!-- 제목 출력 -->
					${strayboard.stray_head}
				</a> 
				<c:if test="${strayboard.replycount > 0}">
					<!-- 댓글수 출력 -->
					<font color="red"> [${strayboard.replycount}] </font>
				</c:if>
			</td>
			
			<td>${strayboard.writedateWithFormat }</td>
			
		</tr>
	</c:forEach>
</table>

		<br>

		<div align="right" class="right_mar">
			<a href="${context}/board/stray/write">
				<button type="button" id="btnwrite" class="btn hover3">글쓰기</button>
			</a>
		</div>

<div class="row">
	<!-- 네비게이터(navigator) -->
	<jsp:include page="/WEB-INF/views/member/navigator_mystrayboard.jsp">
		<jsp:param name="pno" value="${pno}"/>
		<jsp:param name="count" value="${count}"/>
		<jsp:param name="navsize" value="${navsize}"/>
		<jsp:param name="pagesize" value="${pagesize}"/>
		<jsp:param name="care_board_no" value="${care_board_no }"/>
	</jsp:include>
</div>

</section>
</div>

</body>