<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="context" value="${pageContext.request.contextPath}"></c:set>

<!-- jquery js -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>


<!-- 
기본 CSS
:	font css
-->
    <!-- font css -->
    <link rel="stylesheet" href="${context}/resources/css/font.css"/>

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
    <!-- header style -->
    <style>
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
	padding-top:150px;
	}
	</style>

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


<style>
* {
    box-sizing: border-box;
    font-family:NotosanR
}
        

.reservation-wrap .page-navigator li {
	display: inline-block;
}

.reservation-wrap .reservation_table {
	width: 80%;
	border-top: 1px solid #444444;
	border-collapse: inherit;
	border-color : #BDBDBD;
}

.reservation-wrap h1{
	font-family:NotosanBlack
}


.reservation-wrap th, 
.reservation-wrap td {
	padding: 10px;
	text-align: center;
	border-color : #BDBDBD;
}


.reservation-wrap a {
	text-decoration: none;
	color: black;
}

.reservation-wrap .right_mar {
	margin-right: 10%;
}

.reservation-wrap .page-navigator li {
	display: inline-block;
}

.reservation-wrap .page-navigator li.active>a {
	color: #1482e0;
}

.reservation-wrap .btn {
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

.reservation-wrap .btn:hover {
	color: white;
}

.reservation-wrap .hover3:hover {
	background-color: #1482e0;
}

.reservation-wrap input {
	width: 150px;
	height: 35px;
	font-size: 14px;
	vertical-align:middle; 
	border-color : #BDBDBD;
	border-style: solid;
	border-width: 1px;
	border-radius: 4px;
}

.reservation-wrap select {
	width: 80px;
	height: 35px;
	font-size: 14px;
	vertical-align:middle; 
	border-color : #BDBDBD;
	border-style: solid;
	border-width: 1px;
	border-radius: 4px;
	}

.reservation-wrap .site-footer{
	position:fixed;
	bottom:0;
}

	</style>


<!-- header 불러오기 -->
	<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>

<section class="section-content">   
	<div class="reservation-wrap" align="center" >
		<h1>펫시터 예약 조회</h1>
		<br>
		<table class="reservation_table" >
			<c:forEach var="rlist" items="${reservationList}">
				
					<tr>
						<th>예약 번호</th>
						<th>예약 회원</th>
						<th>예약 날짜</th>
						<th>예약 이용 시간</th>		
						<th colspan="${fn:length(rlist.list)}">예약 스킬</th>
						<th>시작 시간</th>
					</tr>
					
	
					<tr>
						<td>${rlist.reservation_no}</td>
						<td>${rlist.member_id}</td>
						<td>${rlist.totalMatchingTimeWithFormat}</td>
						<td>${usageTime}시간</td>
						<c:forEach var="skill" items="${rlist.list}">
							<td>${skill.payname}</td>
						</c:forEach>
						<td>${startTime}시</td>
					</tr>
				
			</c:forEach>
		</table>
	</div>	
</section>
	<br><br><br><br>
	<br><!-- footer 불러오기 -->
	<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>    
	
	
		
		
		
