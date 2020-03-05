<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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

.restab {
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

button{
   display: white;
   width: 70px;
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

	.button:hover{
	color: white;
	}

	
	.hover:hover{
	background-color: #1482e0;
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

a:hover{
	color: black;
}
.right_mar {
	margin-right: 10%;
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
	<h1>예약 조회</h1>
	
	<br>
	<p>리뷰는 결제 후 이용날짜 다음날부터 작성 가능합니다.</p>
	<p>리뷰 작성 시 500p 지급</p>
	<section>
	

	<table  class="restab">

	

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
				<td>
					<c:choose>
						<c:when test="${reservation.pay_status !='완료' }">
							결제 미완료
						</c:when>
						<c:otherwise>
							${reservation.pay_status }
						</c:otherwise>
					</c:choose>									
				</td>
				<td>
					<c:choose>
						<c:when test="${reservation.review_no<1 &&reservation.pay_status =='완료' &&reservation.gap<0}">
							<a href="${context }/board/review/insert?reservation_no=${reservation.reservation_no}&sitter_id=${reservation.sitter_id}">
							<button class="button hover">리뷰 작성</button></a>
						</c:when>
						<c:otherwise>
							작성불가
						</c:otherwise>
					</c:choose>		
					
				</td>
			</tr>
		</c:forEach>
	</table>

<br>
<div class="row">
	<!-- 네비게이터(navigator) -->
	<jsp:include page="/WEB-INF/views/member/navigator_myreservation.jsp">
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