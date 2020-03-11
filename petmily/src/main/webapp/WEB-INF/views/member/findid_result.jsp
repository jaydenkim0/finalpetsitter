<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="context" value="${pageContext.request.contextPath}"></c:set>

<!-- jquery js -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>


<style>
.btn2 {
	width: 100px;
	height: 40px;
	border: none;
	background-color: #D8D8D8;
	border-radius: 3px;
	color: black;
	font-size: 15px;
	font-weight: bold;	
}
.btn2:hover{
	background-color: black;
	color: #D8D8D8;
}

a:hover { text-decoration:none !important }
</style>



<!-- 
HEADER 이용 시 넣어야할 요소 
:   jquery js,
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
:   jquery js,
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
   
   <section class="section-content">
		<div align="center">
		<br><br><br>
		<c:choose>
		    <c:when test="${not empty id}">
				<h2>회원님의 아이디는 ${id} 입니다</h2>
				<br>
				<a href="login">
					<input type="button" value="로그인" id="loginbtn" class="btn2">
				</a>
				&emsp;
				<a href="/petmily/" >
					<button id="homebtn" class="btn2">홈</button>
				</a>
		    </c:when>
		    <c:otherwise>
				<h2>입력하신 정보에 해당하는 회원이 없습니다</h2>
				<br>
				<a href="findid">
					<input type="button" value="아이디찾기" class="btn2">
				</a>
				&emsp;
				<a href="/petmily/">
					<button class="btn2">홈</button>
				</a>
		    </c:otherwise>
		</c:choose>
		<br><br><br><br><br>
		</div>
</section>

   <br><!-- footer 불러오기 -->
   <jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>   
