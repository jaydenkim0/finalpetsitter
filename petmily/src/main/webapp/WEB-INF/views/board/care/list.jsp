<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> 
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<!-- BootStrap CDN -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<style>
.page-navigator li {
	display: inline-block;
}

.care_table {
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
	color: #1482e0;
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

<script>
$(function(){
	
	console.log('${password}');
	console.log($.type('${password}'));
	
	if('${password}'=='x'){
		window.alert("비밀번호가 일치하지 않습니다.");
	}
	
});
</script>

</head>


<body>

<div align="center">
<h1>돌봄게시판</h1>

<c:set var="context" value="${pageContext.request.contextPath}"></c:set>
<c:set var="type" value="${param.type}"></c:set>
<c:set var="keyword" value="${param.keyword}"></c:set> 
<c:set var="isSearch" value="${not empty type and not empty keyword}"></c:set>

<!-- 로그인/로그아웃 --> 
<%-- <c:choose> --%>
<%-- 	<c:when test="${sessionScope.id eq null }"> --%>
<%-- 		<a href="${context}/member/login"><button>로그인</button></a> --%>
<%-- 	</c:when> --%>
<%-- 	<c:otherwise> --%>
<%-- 	${sessionScope.id}님이 로그인 중입니다. --%>
<%-- 	<a href = "${context}/member/logout"><button>로그아웃</button></a> --%>
<%-- 	</c:otherwise> --%>
<%-- </c:choose> --%>

<section>

<!-- 목록 -->


<table class="care_table">
	<tr>
		<th>방번호</th>
		<th>생성자</th>
		<th>펫시터</th>
		<th>방 제목</th>
		<th>생성일</th>
		<th>관리</th>
	</tr>
	<c:forEach var="listitem" items="${list }">
		<tr>
			<td>${listitem.care_board_no }</td>
			<c:choose>
				<c:when test="${not empty listitem.care_member_id }">
					<td>${listitem.care_member_id }</td>
				</c:when>
				<c:otherwise>
					<td>탈퇴회원</td>
				</c:otherwise>
			</c:choose>
			<c:choose>
				<c:when test="${not empty listitem.sitter_id }">
					<td>${listitem.sitter_id }</td>
				</c:when>
				<c:otherwise>
					<td>탈퇴회원</td>
				</c:otherwise>
			</c:choose>
			<td>
				<c:choose>
					<c:when test="${listitem.care_member_id == 'null' }">
						${listitem.care_board_content }
					</c:when>
					<c:when test="${listitem.care_member_id==id || grade=='admin'||listitem.sitter_id==id}">
						<c:choose>
							<c:when test="${id==null }">
								${listitem.care_board_content }
							</c:when>
							<c:otherwise>
								<a href="password?care_board_no=${listitem.care_board_no }">
									${listitem.care_board_content }
								</a>						
							</c:otherwise>
						</c:choose>
					</c:when>
					<c:otherwise>
						${listitem.care_board_content }
					</c:otherwise>
				</c:choose>
			</td>
			<td>${listitem.writedateWithFormat }</td>
			<td>
			<c:if test="${(listitem.care_member_id==id && id!=null) || grade=='admin'}">
				<a href="delete?care_board_no=${listitem.care_board_no }"><button class="btn hover3">방 삭제</button></a>
			</c:if>
			</td>
		</tr>
	</c:forEach>
</table>

<br>

<c:if test="${fn:length(list)<1 }">
	<hr>
	<p>검색결과가 없습니다</p>
</c:if>
<c:if test="${isSearch }">
	<hr>
	<a href="list"><button>목록으로</button></a>
</c:if>


<div align="right" class="right_mar">
<c:if test="${not empty id}">
	<a href="write">
		<button class="btn hover3">방 만들기</button>
	</a>
</c:if>
</div>




<div class="row" >
	<!-- 네비게이터(navigator) -->
	<jsp:include page="/WEB-INF/views/board/care/navigator_list.jsp">
		<jsp:param name="pno" value="${pno}"/>
		<jsp:param name="count" value="${count}"/>
		<jsp:param name="navsize" value="${navsize}"/>
		<jsp:param name="pagesize" value="${pagesize}"/>
	</jsp:include>
</div>

<div align="center">
<!-- 검색창 -->

<form method="get" action="${context }/board/care/list">
	<select name="type">
		<option value="care_board_no">방번호</option>
		<option value="care_member_id">생성자 아이디</option>
		<option value="sitter_id">펫시터 아이디</option>
		<option value="care_board_content">방 제목</option>
	</select>
	<input name="keyword" placeholder="검색어" required>
	<input type="submit" value="조회" class="btn hover3">
</form>
</div>

</section>
</div>
</body>