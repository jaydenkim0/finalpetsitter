<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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

	<h1>예약 조회</h1>
	
	<p>리뷰는 결제 후 이용날짜 다음날부터 작성 가능합니다.</p>
	<p>리뷰 작성 시 500p 지급</p>
	
	<table width="100%" border="1">
		<tr>
			<td>예약번호</td>
			<td>예약일자</td>
			<td>펫시터</td>
			<td>결제상태</td>
			<td>리뷰작성</td>
		</tr>
		<c:forEach var="reservation" items="${reservation_list }">
			<tr>
				<td>${reservation.reservation_no }</td>
				<td>${reservation.totalMatchingTime }</td>
				<td>
					<c:choose>
						<c:when test="${not empty reservation.sitter_id }">
							${reservation.sitter_id }
						</c:when>
						<c:otherwise>
							탈퇴회원
						</c:otherwise>
					</c:choose>					
				</td>
				<td>${reservation.pay_status }</td>
				<td>
					<c:choose>
						<c:when test="${reservation.pay_status=='완료' }">
							<a href="${context }/board/review/insert?reservation_no=${reservation.reservation_no}">리뷰쓰기</a>
						</c:when>
						<c:otherwise>
							리뷰작성불가
						</c:otherwise>
					</c:choose>		
					
				</td>
			</tr>
		</c:forEach>
	</table>

<div class="row">
	<!-- 네비게이터(navigator) -->
	<jsp:include page="/WEB-INF/views/member/navigator_myreservation.jsp">
		<jsp:param name="pno" value="${pno}"/>
		<jsp:param name="count" value="${count}"/>
		<jsp:param name="navsize" value="${navsize}"/>
		<jsp:param name="pagesize" value="${pagesize}"/>
		<jsp:param name="care_board_no" value="${care_board_no }"/>
	</jsp:include>
</div><br><br><br><br>
	
</div>

</body>