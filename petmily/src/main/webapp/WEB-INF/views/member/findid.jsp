<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="context" value="${pageContext.request.contextPath}"></c:set>
<head>

<style>
.search{
	 FONT-weight:bold;
	 font-size:14pt;
 
}

.findidbtn{
	border: none;
	background-color: #FAFAFA;
	width: 300px;
	height: 40px;
	color: black;
	font-size: 15px;
	font-weight: bold;
	BORDER-RADIUS:3PX;	
}
.findidbtn:hover{
	background-color: black;
	color:#FAFAFA;
}

input{
	width:400px;
	BORDER-BOTTOM: teal 1px solid;
	BORDER-LEFT: medium none;
	BORDER-RIGHT: medium none;
	BORDER-TOP: medium none;
	FONT-SIZE: 12pt;
	BORDER-STYLE:none;     
	border-bottom:solid 1px #cacaca;
	border-collapse:collapse;
	HEIGHT:40PX;
	background-color:#FAFAFA;
}

body{
	background-color:#FAFAFA;
}
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
</head>

<body>
<!-- header 불러오기 -->
   <jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>
<section class="section-content">
<br><br>
<div class="search" align="CENTER">
<h1>아이디 찾기</h1>
<br>
<form action="findid" method="post">
	<br>
	<input type="text" name="name" required placeholder="이름 입력"><br><br>
	<br>
	<input type="email" name="email" required placeholder="회원가입시 사용했던 이메일을 입력"><br><br>
	<br>
	<input type="tel" name="phone" required placeholder="-를 제외한 휴대폰번호 숫자 입력"><br><br><br>
	<input type="submit" value="확인" class="findidbtn" id="loginbtn">
</form>
</div>

</section>
 <br><!-- footer 불러오기 -->
   <jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>    
</body>