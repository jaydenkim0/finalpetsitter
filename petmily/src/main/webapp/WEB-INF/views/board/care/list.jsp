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

<h1>돌봄게시판</h1>
<c:set var="context" value="${pageContext.request.contextPath}"></c:set>
<c:choose>
	<c:when test="${sessionScope.id eq null }">
		<a href="${context}/member/login"><button>로그인</button></a>
	</c:when>
	<c:otherwise>
	${sessionScope.id}님이 로그인 중입니다.
	<a href = "${context}/member/logout"><button>로그아웃</button></a>
	</c:otherwise>
</c:choose>
<br><br>
<c:if test="${not empty id}">
<a href="write"><button>방 만들기</button></a><br><br>
</c:if>
<table border="1" width="100%">
	<tr>
		<th>방번호</th>
		<th>생성자</th>
		<th>펫시터</th>
		<th>방 제목</th>
		<th>생성일</th>
		<th>관리</th>
	</tr>
	<c:forEach var="list" items="${list }">
		<tr>
			<td>${list.care_board_no }</td>
			<c:choose>
				<c:when test="${not empty list.care_member_id }">
					<td>${list.care_member_id }</td>
				</c:when>
				<c:otherwise>
					<td>탈퇴회원</td>
				</c:otherwise>
			</c:choose>
			<td>${list.sitter_id }</td>
			<td>
				<c:choose>
					<c:when test="${list.care_member_id == 'null' }">
						${list.care_board_content }
					</c:when>
					<c:when test="${list.care_member_id==id || grade=='admin'||list.sitter_id==id}">
						<c:choose>
							<c:when test="${id==null }">
								${list.care_board_content }
							</c:when>
							<c:otherwise>
								<a href="password?care_board_no=${list.care_board_no }">
									${list.care_board_content }
								</a>						
							</c:otherwise>
						</c:choose>
					</c:when>
					<c:otherwise>
						${list.care_board_content }
					</c:otherwise>
				</c:choose>
			</td>
			<td>${list.writedateWithFormat }</td>
			<td>
			<c:if test="${(list.care_member_id==id && id!=null) || grade=='admin'}">
				<a href="delete?care_board_no=${list.care_board_no }"><button>방 삭제</button></a>
			</c:if>
			</td>
		</tr>
	</c:forEach>
</table>
<div class="row" >
	<!-- 네비게이터(navigator) -->
	<jsp:include page="/WEB-INF/views/board/care/navigator_list.jsp">
		<jsp:param name="pno" value="${pno}"/>
		<jsp:param name="count" value="${count}"/>
		<jsp:param name="navsize" value="${navsize}"/>
		<jsp:param name="pagesize" value="${pagesize}"/>
	</jsp:include>
</div>

</body>