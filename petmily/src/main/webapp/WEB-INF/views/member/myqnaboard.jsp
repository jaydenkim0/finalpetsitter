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

<h1>내가 쓴 문의/신고 게시글</h1>

<table width="100%" border="1">
	<tr>
		<td>글번호</td>
		<td>제목</td>
		<td>게시일자</td>
	</tr>
	<c:forEach var="qnaboard" items="${qnaboard_list }">
		<tr>
			<td>${qnaboard.qna_no }</td>
			
			<td align="left">
					<!-- 제목을 depth번 만큼 띄어쓰기 후 출력 --> 
					<c:forEach var="i" begin="1" end="${qnaboard.depth}">
							&nbsp;&nbsp;&nbsp;&nbsp;
					</c:forEach> <!-- 답글은 이미지를 추가 --> <c:if test="${qnaboard.depth > 0}">
						<img src="${context}/resources/img/reply.png" width="20"
								height="10">
					</c:if>
					<font color="#1482e0"> [${qnaboard.qna_title}] </font> 
						<a href="${context }/board/qna/view?qna_no=${qnaboard.qna_no}"> <!-- 제목 출력 -->
							${qnaboard.qna_head}
						</a> 
					<c:if test="${qnaboard.replycount > 0}">
						<!-- 댓글수 출력 -->
						<font color="red"> 
							[${qnaboard.replycount}] 
						</font>
					</c:if>
			</td>
			<td>${qnaboard.writedateWithFormat}</td>
	</c:forEach>
</table>

	<br>

	<div align="right" class="right_mar">
		<c:if test="${not empty sessionScope.id}">
			<a href="${context}/board/qna/write">
				<button type="button" id="btnwrite">글쓰기</button>
			</a>
		</c:if>
	</div>

<div class="row">
	<!-- 네비게이터(navigator) -->
	<jsp:include page="/WEB-INF/views/member/navigator_myqnaboard.jsp">
		<jsp:param name="pno" value="${pno}"/>
		<jsp:param name="count" value="${count}"/>
		<jsp:param name="navsize" value="${navsize}"/>
		<jsp:param name="pagesize" value="${pagesize}"/>
		<jsp:param name="care_board_no" value="${care_board_no }"/>
	</jsp:include>
</div><br><br><br><br>

</div>

</body>