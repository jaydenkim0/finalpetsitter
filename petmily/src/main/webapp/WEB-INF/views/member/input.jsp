<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <c:set var="context" value="${pageContext.request.contextPath}"></c:set>
<head>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>





	  <script>
    	$(function () {
    		// 펫시터 거부 버튼 클릭시 발생
			$(".emailsend").submit(function(e) {
				// 이벤트 정지
				e.preventDefault();				
				// 버튼 속성 및 내용 변경
				$("#pwchange").prop("disabled", true);
				$("#pwchange").text("이메일 발송중");				
				
				var url = $(this).attr("action"); 
				var method = $(this).attr("method");
				var data = $(this).serialize();
				
					$.ajax({
						url:url,
						type:"post",
						data:data,
						success:function(resp){
							console.log(resp);
							if(resp == "success"){
								alert("이메일 발송 완료");								
								location.href = '${pageContext.request.contextPath}/member/result';
							}
							else{
								alert("아이디 및 이메일을 확인바랍니다");								
								$("#pwchange").prop("disabled", false);
								$("#pwchange").text("이메일 보내기");
								location.href = '${pageContext.request.contextPath}/member/input?error';
							}
						}
					});
				});						
			});	
    </script>

<style>
.input{
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

#pwchange{
	background-color:#BDBDBD;
	width: 300px;
	height: 40px;
	color: #fff;
	font-size: 15px;
	font-weight: bold;
	BORDER-RADIUS:3PX;
}
.change{
	font-size:14pt;
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

<div align="center" class="change">

<br><br>
<h1>비밀번호 변경</h1>
<br><br>

<form class="emailsend"  action="input" method="post">
	<input type="text" name="id" placeholder="아이디 입력" required class="input"><br><br><br>
	<input type="email" name="email" placeholder="이메일 입력" required class="input"><br><br><br>
	<input id="pwchange" type="submit" value="이메일 전송" >
</form>

	<c:if test="${param.error != null}">
		입력하신 아이디 및 이메일로 가입된 내역이 없습니다<br>
		다시한번 확인해주세요
	</c:if>
</div>
</section>
 <br><!-- footer 불러오기 -->
   <jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>    
</body>