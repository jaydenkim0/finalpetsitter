<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="context" value="${pageContext.request.contextPath}"></c:set>
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script>
	$(function(){
		
		$("#user_id").blur(function(){
			var user_id = $("#user_id").val();
			
			$.ajax({
				url:'${pageContext.request.contextPath}/board/care/idCheck?userId='+user_id,
				type:'get',
				success:function(data){
					if(data==0){
						$(".id_check").text("존재하지 않는 펫시터입니다");
						$('.id_check').css('color','red');
						$("#submit").attr("disabled",true);
					}else{
						$(".id_check").text("");
						$("#submit").attr("disabled",false);
					}
				}
			});
		});
	});
	
	function prevent(){
	    var tag = document.querySelector(".password");
	    var text = tag.value;
	    var len = text.length;
	    if(len > 4){
	        text = text.substring(0, 4);
	        tag.value = text;
	    }
	}
</script>
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

</head>

<body>
	<!-- header 불러오기 -->
	<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>
	
<section class="section-content">
<h1>돌봄방 생성</h1>
<form action="write" method="post">
<table border="1">
		<tr>
			<th>작성자 아이디</th>
			<td><input type="text" readonly value=${id } name="care_member_id"></td>
		</tr>
		<tr>
			<th>펫시터 아이디</th>
			<td>
				<input type="text" name="care_sitter_id" class="sitter_id_check" id="user_id" list="depList" oninput="checkId()" required>
				<datalist id="depList">
					<c:forEach var="data" items="${list }">
						<option value="${data }">${data }</option>
					</c:forEach>
				</datalist>
				<div class="id_check"></div>
			</td>
		</tr>
		<tr>
			<th>방 제목</th>
			<td><input type="text" name="care_board_content" required></td>
		</tr>
		<tr>
			<th>방 비밀번호</th>
			<td><input class="password" oninput="prevent();" type="number" name="care_pw" placeholder="4자리 숫자" required></td>
		</tr>
		<tr>
			<th colspan="2">
				<input type="submit" value="생성" id="submit">
			</th>
		</tr>
</table>
</form>
</section>

<br><!-- footer 불러오기 -->
	<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include> 
</body>

