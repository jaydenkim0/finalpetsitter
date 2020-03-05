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

.page-navigator li{
   display: inline-block;
   margin-left: 10px;
    padding: 5px 10px; 
   font-size:15px;
   font-weight: 600;	
}
.page-navigator li {
	display: inline-block;

}


.page-navigator li.active>a {
   color: #1482e0;
}
table td img {
   width: 60px;
}

.review_table {
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
   margin-right: 10%;
}


=======

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
>>>>>>> refs/remotes/origin/master
</style>


</head>

<body>

<c:set var="context" value="${pageContext.request.contextPath}"></c:set>
<div align="center">


<h1>나의 리뷰</h1>

<section>
<table  class="review_table">


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
				<a href="myreview_content?review_no=${reviewlist.review_no }">
					${reviewlist.review_title }
				</a>
			</td>
			<td>
				<c:choose>
					<c:when test="${reviewlist.review_star==3 }">
						<img src="/petmily/resources/img/3.png" style="width: auto; height: 20px;">
					</c:when>
					<c:when test="${reviewlist.review_star==2 }">
						<img src="/petmily/resources/img/2.png" style="width: auto; height: 20px;">
					</c:when>
					<c:otherwise>
						<img src="/petmily/resources/img/1.png" style="width: auto; height: 20px;">
					</c:otherwise>
				</c:choose>
			</td>
			<td>${reviewlist.writedateWithFormat }</td>
		</tr>
	</c:forEach>
</table>

<br>

<div class="row">
	<!-- 네비게이터(navigator) -->
	<jsp:include page="/WEB-INF/views/member/navigator_myreview.jsp">
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