<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="context" value="${pageContext.request.contextPath}"></c:set>
<!-- jquery js -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>   

    <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
    <script>
    	$(document).ready(function() {		
	 		$("#gosendemail").submit();
    	});
	</script> 
	
 <!-- 
기본 CSS
:	index css,
	font css
-->
    <!-- index css -->
    <link rel="stylesheet" href="${context}/resources/css/index.css" />
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


<!-- header 불러오기 -->
		<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>
  
    
	<div align="center">
	<h2>결제 완료 !</h2>
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
	
<br>
<div class="section fp-auto-height" id="footer">
      <!-- footer 불러오기 -->
     <jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>            
 </div>