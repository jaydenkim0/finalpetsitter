<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="context" value="${pageContext.request.contextPath}"></c:set>
 <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
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
	
	
<style>
 *{
            box-sizing: border-box;
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
	padding-top:150px;
	}
	</style>

<!-- 메일전송 -->
    <script>
       $(document).ready(function() {      
          $("#gosendemail").submit();
       });
   </script> 
	
<!-- header 불러오기 -->
		<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>
 
  <section class="section-content">
		<div align="center">
		<h1>결제가 완료되었습니다 !</h1>
		<a href="${context}/member/myreservation">
		<button type="button">내 예약 목록</button></a>
		</div>
		
		<form id="gosendemail" action="${pageContext.request.contextPath}/pay/paysuccessSendEmail" method="post">
			<input type="hidden" name="id" value="${id}">
			<input type="hidden" name="email" value="${email}">
			<input type="hidden" name="total_amount" value="${total_amount}">
			<input type="hidden" name="sitter_id" value="${sitter_id}">
			<input type="hidden" name="sitter_email" value="${sitter_email}">
			<input type="hidden" name="reservation_no" value="${reservation_no}">
		</form>
	</section>
	<br>
      <!-- footer 불러오기 -->
     <jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>            
 