<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<script src="http://code.jquery.com/jquery-latest.min.js"></script>

<c:set var="context" value="${pageContext.request.contextPath}"></c:set>

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
	
	
		   
<c:set var="admin" value="${grade eq 'admin'}"></c:set>

<script>
	$(document).ready(function() {
		$("#btnWrite").click(function() {
			location.herf = "${context}/board/faq/write";
		});
	});
	function list(page) {
		loaction.href = "${context}/board/list?curPage=" + page
				+ "&type-${map.type}" + "&keyword=${map.keyword}";
	}
</script>
<style>
 *{
            box-sizing: border-box;
        }

.page-navigator li {
	display: inline-block;
}

.notice_table {
	width: 60%;
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
	margin-right: 20%;
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
	
 <!-- header style -->
#masthead:after {
	  content: '';
	  position: absolute;
	  top: 0;
	  width: 100%;
	  height: 130px;
	  background-color: #fff;
	  opacity: 100;
	  transition: opacity 0.3s ease;
	}
	
	#masthead.is-active{
	 background-color: #fff;
	}
	
	.section-content{
		padding-top:200px;
	}
	#masthead:after{
	opacity: 100;
	}
	</style>

		<!-- header 불러오기 -->
		<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>



<section class="section-content">
<div align="center" >
<h1>공지사항</h1>

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
				<td>${row.faq_no}</td>
				<td>${row.member_id}</td>
				<td align="left">
				<font color="#1482e0">
								[${row.faq_title}]
						</font>					
						<a href="view?faq_no=${row.faq_no}">
							<!-- 제목 출력 -->
							${row.faq_head}
						</a>
					</td>
				<td>${row.writedateWithFormat}</td>
			</tr>
		</c:forEach>
</table>	

	<br>

	<div align="right" class="right_mar">
		<c:if test="${sessionScope.grade eq 'admin'}">
			<a href="${context}/board/faq/write">
				<button type="button" id="btnwrite" class="btn hover3" >글쓰기</button>
			</a>
		</c:if>
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
	<form method="get" action="${context}/board/faq/list">
	<select name="type" class="input-item">
		<option value="member_id">작성자</option>
		<option value="faq_head">제목</option>
	</select> 
	<input class="input-item" name="keyword" placeholder="검색어" requierd>
	<input type="submit" value="조회" class="btn hover3" >
	</form>
	</div>
</section>
</div>	
<br>

</section>

      <!-- footer 불러오기 -->
     <jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>            
 