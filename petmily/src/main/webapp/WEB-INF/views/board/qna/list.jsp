<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<c:set var="context" value="${pageContext.request.contextPath}"></c:set>
<!-- BootStrap CDN -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

<c:choose>
	<c:when test="${sessionScope.id eq null }">
		<a href="${context}/member/login">로그인</a>
	</c:when>
	<c:otherwise>
	${sessionScope.id}님이 로그인 중입니다.
	<a href="${context}/member/logout">로그아웃</a>
	</c:otherwise>
</c:choose>

<script>
	$(document).ready(function() {
		$("#btnWrite").click(function() {
			location.herf = "${context}/board/qna/write";
		});
	});
	function list(page) {
		loaction.href = "${context}/board/list?curPage=" + page
				+ "&type-${map.type}" + "&keyword=${map.keyword}";
	}
</script>

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

<div align="center">
	<h1>문의 게시판</h1>

	<section>
		<table class="notice_table" >
			<tr>
				<th>글번호</th>
				<th>작성자</th>
				<th>제목</th>
				<th>게시일자</th>
			</tr>
			<c:forEach var="row" items="${list}">
				<tr>
					<td>${row.qna_no}</td>
					<td>${row.qna_writer}
					<td align="left">
						<!-- 제목을 depth번 만큼 띄어쓰기 후 출력 --> 
						<c:forEach var="i" begin="1" end="${row.depth}">
							&nbsp;&nbsp;&nbsp;&nbsp;
						</c:forEach> <!-- 답글은 이미지를 추가 --> <c:if test="${row.depth > 0}">
							<img src="${context}/resources/img/reply.png" width="20"
								height="10">
						</c:if> <font color="#1482e0"> [${row.qna_title}] </font> <a
						href="view?qna_no=${row.qna_no}"> <!-- 제목 출력 -->
							${row.qna_head}
					</a> 
					<c:if test="${row.replycount > 0}">
							<!-- 댓글수 출력 -->
							<font color="red"> 
							[${row.replycount}] 
							</font>
						</c:if>
					</td>
					<%-- 				<a href="${context}/board/qna/view?qna_no=${row.qna_no}">${row.qna_head}</a> --%>
					<td>${row.writedateWithFormat}</td>
				</tr>
		</c:forEach>
	</table>	

	<br>

	<div align="right" class="right_mar">
		<c:if test="${not empty sessionScope.id}">
			<a href="${context}/board/qna/write">
				<button type="button" class="btn hover3" id="btnwrite">글쓰기</button>
			</a>
		</c:if>
	</div>	


		<div class="row">
			<!-- 네비게이터(navigator) -->
			<jsp:include page="/WEB-INF/views/board/qna/navigator.jsp">
				<jsp:param name="pno" value="${pno}" />
				<jsp:param name="count" value="${count}" />
				<jsp:param name="navsize" value="${navsize}" />
				<jsp:param name="pagesize" value="${pagesize}" />
			</jsp:include>
		</div>
		
		<form method="get" action="${context}/board/qna/list">
			<select name="type" class="input-item">
				<option value="qna_writer">작성자</option>
				<option value="qna_head">제목</option>
			</select> 
			<input class="input-item" name="keyword" placeholder="검색어" requierd>
			<input type="submit" value="조회" class="btn hover3" >
		</form>
	</section>
</div>