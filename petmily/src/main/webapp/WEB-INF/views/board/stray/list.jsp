<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="context" value="${pageContext.request.contextPath}"></c:set>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>

<!-- jquery js -->
 <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>

  
<!-- 
HEADER 이용 시 넣어야할 요소 
:	jquery js,
	header css, 
	header script
-->
  <!-- header css -->
  <link rel="stylesheet" href="${context}/resources/css/header.css">
   <!-- header script -->
   <script>
      $(function() {
          $('body').addClass('js');
          $('#masthead').addClass('color');
          
          var $hamburger = $('.hamburger'),
              $nav = $('#site-nav'),
              $masthead = $('#masthead');

          $hamburger.click(function() {
            $(this).toggleClass('is-active');
            $nav.toggleClass('is-active');
            $masthead.toggleClass('is-active');
            return false; 
          })
      });
    </script>

	
<!-- 
FOOTER 이용 시 넣어야할 요소 
:	jquery js,
	footer css, 
	Required meta tags, 
	Bootstrap CSS,
	아이콘을 사용하기 위해 추가로 불러오는 CSS
-->
  	<!-- footer css -->
    <link rel="stylesheet" href="${context}/resources/css/footer.css"/>  
    <!-- Required meta tags -->
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <!-- 아이콘을 사용하기 위해 추가로 불러오는 CSS -->
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css" integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ" crossorigin="anonymous">
	
<script>
	$(document).ready(function() {
		$("#btnWrite").click(function() {
			location.herf = "${context}/board/stray/write";
		});
	});
	function list(page) {
		loaction.href = "${context}/board/list?curPage=" + page
				+ "&type-${map.type}" + "&keyword=${map.keyword}";
	}
</script>

<style>
* {
	box-sizing: border-box;
}

.page-navigator li {
	display: inline-block;
}

.notice_table {
	width: 60%;
	border-top: 1px solid #444444;
	border-collapse: collapse;
	border-color: #BDBDBD;
}

.ta {
	padding-top: 70px;
}

th, td {
	border-bottom: 1px solid #444444;
	padding: 10px;
	text-align: center;
	border-color: #BDBDBD;
}

a {
	text-decoration: none;
	color: black;
}

.right_mar {
	margin-right: 20%;
}

.page-navigator li {
	display: inline-block;
}

.page-navigator li.active>a {
	color: #1482e0;
}

.custom-btn {
	display: white;
	width: 80px;
	height: 10x;
	line-height: 20px;
	border: 1px #3399dd solid;
	background-color: white;
	text-align: center;
	font-size: 12px;
	cursor: pointer;
	color: #1482e0;
	transition: all 0.9s, color 0.3;
}

.custom-btn:hover {
	color: white;
}

.hover3:hover {
	background-color: #1482e0;
}

input {
	width: 150px;
	height: 35px;
	font-size: 14px;
	vertical-align: middle;
	border-color: #BDBDBD;
	border-style: solid;
	border-width: 1px;
	border-radius: 4px;
}

select {
	width: 80px;
	height: 35px;
	font-size: 14px;
	vertical-align: middle;
	border-color: #BDBDBD;
	border-style: solid;
	border-width: 1px;
	border-radius: 4px;
}

<!--
header style -->#masthead:after {
	content: '';
	position: absolute;
	top: 0;
	width: 100%;
	height: 130px;
	background-color: #fff;
	opacity: 100;
	transition: opacity 0.3s ease;
}

#masthead.is-active {
	background-color: #fff;
}

.section-content {
	padding-top: 115px;
}

#masthead:after {
	opacity: 100;
}

.title {
	font-size: 50px;
}

.con {
	margin-top: 50px;
	margin-bottom: 50px;
	height: auto;
}
</style>

<!-- header 불러오기 -->
		<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>

<section class="section-content">

<div align="center">
	<section class="ta">
	<h1 class="title" align="center">Save the Pets !</h1>
	<br>
		<table class="notice_table">
			<tr>
				<th>글번호</th>
				<th>작성자</th>
				<th>제목</th>
				<th>게시일자</th>
			</tr>
			<c:forEach var="row" items="${list}">
				<tr>
					<td>${row.stray_no}</td>
					<c:choose>
						<c:when test="${not empty row.stray_writer}">
							<td>${row.stray_writer}</td>
						</c:when>
						<c:otherwise>
							<td>비회원</td>
						</c:otherwise>
					</c:choose>
					<!-- 제목을 depth번 만큼 띄어쓰기 후 출력 -->
					<td align="left"><c:forEach var="i" begin="1"
							end="${row.depth}">
							&nbsp;&nbsp;&nbsp;&nbsp;
						</c:forEach> <!-- 답글은 이미지를 추가 --> 
						<c:if test="${row.depth > 0}">
							<img src="${context}/resources/img/reply.png" width="20"
								height="10">
						</c:if>
						<c:choose>
						<c:when test="${strayVO.stray_title ne '완료글'}">
						<font color="#1482e0"> [${row.stray_title}] </font>
						</c:when>
						<c:otherwise>
							<td style="color: red">말머리 : ${strayVO.stray_title}</td>
							</c:otherwise>
						</c:choose> 
						<a href="view?stray_no=${row.stray_no}"> <!-- 제목 출력 -->
							${row.stray_head}
					</a> <c:if test="${row.replycount > 0}">
							<!-- 댓글수 출력 -->
							<font color="red"> [${row.replycount}] </font>
						</c:if></td>
					<td>${row.writedateWithFormat}</td>
				</tr>
			</c:forEach>
		</table>

		<br>

		<div align="right" class="right_mar">
			<a href="${context}/board/stray/write">
				<input type="button" class="custom-btn hover3" id="btnwrite" value="글쓰기">
			</a>
		</div>

		<div>
			<!-- 네비게이터(navigator) -->
			<jsp:include page="/WEB-INF/views/board/stray/navigator.jsp">
				<jsp:param name="pno" value="${pno}" />
				<jsp:param name="count" value="${count}" />
				<jsp:param name="navsize" value="${navsize}" />
				<jsp:param name="pagesize" value="${pagesize}" />
			</jsp:include>
		</div>

	<div align="center">
		<form method="get" action="${context}/board/stray/list">
			<select name="type" class="input-item">
				<option value="stray_writer">작성자</option>
				<option value="stray_head">제목</option>
			</select> 
			<input class="input-item" name="keyword" placeholder="검색어" requierd>
			<input type="submit" value="조회" class="custom-btn hover3" >
		</form>
		</div>
	</section>
</div>
</section>
<br>
      <!-- footer 불러오기 -->
     <jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>            