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


    .caretab {
   width: 72%;
   border-top: 1px solid #444444;
   border-collapse: collapse;
   border-color: #BDBDBD;
}

button{
  display: white;
   width: 90px;
   height: 40px;
   line-height: 20px;
   border: 1px #3399dd solid;
   background-color: white;
   text-align: center;
   font-size: 12px;
   cursor: pointer;
   color: #1482e0;
   transition: all 0.9s, color 0.3;
   
 
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
a:hover{
	color:black;
}

.page-navigator li {
	display: inline-block;
}

.page-navigator li.active>a {
	color: #1482e0;
}




</style>


</head>

<body>

<c:set var="context" value="${pageContext.request.contextPath}"></c:set>

<div align="center">

<Br>
<h1>나의 돌봄방</h1>

<br><br>
<c:if test="${not empty id}">
<a href="${context }/board/care/write"><button>방 만들기</button></a><br><br>
</c:if>

<section>
<table class="caretab" >




	<tr>
		<td>방번호</td>
		<td>펫시터</td>
		<td>방 제목</td>
		<td>생성일</td>
		<td>관리</td>
	</tr>
	<c:forEach var="careboard" items="${careboard_list }">
		<tr>
			<td>${careboard.care_board_no }</td>
			
			<td>
			<c:choose>
				<c:when test="${not empty listitem.sitter_id }">
					${careboard.sitter_id }
				</c:when>
				<c:otherwise>
					탈퇴회원
				</c:otherwise>
			</c:choose>
			</td>
			
			<td>
				<c:choose>
					<c:when test="${careboard.care_member_id == 'null' }">
						${careboard.care_board_content }
					</c:when>
					<c:when test="${careboard.care_member_id==id || grade=='admin'||careboard.sitter_id==id}">
						<c:choose>
							<c:when test="${id==null }">
								${careboard.care_board_content }
							</c:when>
							<c:otherwise>
								<a href="${context }/board/care/password?care_board_no=${careboard.care_board_no }">
									${careboard.care_board_content }
								</a>						
							</c:otherwise>
						</c:choose>
					</c:when>
					<c:otherwise>
						${careboard.care_board_content }
					</c:otherwise>
				</c:choose>
			</td>
			
			<td>${careboard.writedateWithFormat }</td>
			
			<td>
				<c:if test="${(careboard.care_member_id==id && id!=null) || grade=='admin'}">
					<a href="${context }/board/care/delete?care_board_no=${careboard.care_board_no }"><button class="btn hover3">방 삭제</button></a>
				</c:if>
			</td>
		</tr>
	</c:forEach>
</table>

<br>


<br>
<div class="row">
	<!-- 네비게이터(navigator) -->
	<jsp:include page="/WEB-INF/views/member/navigator_mycareboard.jsp">
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