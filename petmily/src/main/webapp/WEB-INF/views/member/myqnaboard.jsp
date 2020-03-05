<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<head>
<!-- BootStrap CDN -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
	
<style>

li{
   display: inline-block;
   margin-left: 10px;
    padding: 5px 10px; 
   font-size:15px;
   font-weight: 600;	
  	list-style-type:none;
   	margin-left:20px;
}


.qnatab {
   width: 72%;
   border-top: 1px solid #444444;
   border-collapse: collapse;
   border-color: #BDBDBD;
}



td{
   
   border-bottom: 1px solid #444444;
   padding: 10px;
   border-color: #BDBDBD;
    padding: 10px;
   text-align: center;
  
}


a {
   text-decoration: none;
   color: black;
}

.right_mar {
   margin-right: 20%;
}
 button{
    display: white;
   width: 80px;
   height: 30px;
   line-height: 20px;
   border: 1px #3399dd solid;
   background-color: white;
   text-align: center;
   font-size: 12px;
   cursor: pointer;
   color: #1482e0;
   transition: all 0.9s, color 0.3;


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


<h1>나의 신고 문의 내역</h1>

<section>
<table CLASS="qnatab">






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
				<button type="button" id="btnwrite" class="btn hover3">글쓰기</button>
			</a>
		</c:if>
	</div>

<br>
<div class="row">
	<!-- 네비게이터(navigator) -->
	<jsp:include page="/WEB-INF/views/member/navigator_myqnaboard.jsp">
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