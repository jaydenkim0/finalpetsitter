<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	<c:set var="context" value="${pageContext.request.contextPath}"></c:set>

<head>

	<!-- 프론트엔드 암호화 불러오기 -->
	<script src="${pageContext.request.contextPath}/resources/js/secom.js"></script>
	
<style>
#changebtn{
width: 100px;
	height: 40px;
	border: none;
	background-color: #1482e0;
	border-radius: 3px;
	color: #fff;
	font-size: 14px;
	font-weight: bold;
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
	<div align="center">
	
		<br><br><br><br><br>
	
		
		<form action="${pageContext.request.contextPath}/member/change" class="secure-form"  method="post" >
			<input type="hidden"  name="email" value ="${email}" >
			<input type="hidden" name="id" value="${id}">
	 		<input type="password" name="pw" placeholder="비밀번호 입력" required><br><br>
			<input type="submit"  value="변경" id="changebtn">
		</form>	
	<br><br><br>
	</div>
</section>
 <br><!-- footer 불러오기 -->
   <jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>    
</body>	
