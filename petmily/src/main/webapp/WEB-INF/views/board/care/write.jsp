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
	  .regist{
		font-weight:bold;
		font-size:14pt;
}
	body{
		background-color:#FAFAFA;
}
#submit {
		width: 220px;
		height: 60px;
		border: none;
		background-color: #1482e0;
		border-radius: 3px;
		color: #fff;
		font-size: 15px;
		font-weight: bold;
		position: relative;
		top: 1px;
		left: 50%;
		margin-left:-110px;
	}
	    input{
		width:400px;
		BORDER-BOTTOM: teal 1px solid;
		BORDER-LEFT: medium none;
		BORDER-RIGHT: medium none;
		BORDER-TOP: medium none;
		FONT-SIZE: 9pt;
		BORDER-STYLE:none;     
		border-bottom:solid 1px #cacaca;
		border-collapse:collapse;
		HEIGHT:40PX;
		background-color:#FAFAFA;
}
td{
	font-weight:bold;
	}
		.regist label {
  display: inline-block;
  padding: .5em .75em;
  color: #1C1C1C;
  font-size: 9pt;
  line-height: normal;
  vertical-align: middle;
  background-color: #BDBDBD;
  cursor: pointer;
  -webkit-transition: background-color 0.2s;
  transition: background-color 0.2s;
}

.regist label:hover {
  background-color: #E6E6E6;
}
.regist label:active {
  background-color: #FAFAFA;
}
p{
  color:#FE2E64;
  font-size:12px;
}
	</style>

</head>

<body>
	<!-- header 불러오기 -->
	<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>
	
<section class="section-content">
<div align="center" class="regist">
<h1>돌봄방 만들기</h1><br><br>
<form action="write" method="post">
<table>
		<tr>
		
			<td>작성자 아이디<br>
				<input type="text" readonly value=${id } name="care_member_id"><br><br>
			</td>
		</tr>
		<tr>
			<td>펫시터 아이디<br>
				<input type="text" name="care_sitter_id" class="sitter_id_check" id="user_id" list="depList" oninput="checkId()" required>
				<datalist id="depList">
					<c:forEach var="data" items="${list }">
						<option value="${data }">${data }</option>
					</c:forEach>
				</datalist><br><br>
				<div class="id_check"><br></div>
			</td>
		</tr>
		
		<tr>
			<td>방 제목<br>
				<input type="text" name="care_board_content" required><br><br>
			</td>
		</tr>
		
		<tr>
			<td>방 비밀번호<br>
				<input class="password" oninput="prevent();" type="number" name="care_pw" placeholder="4자리 숫자" required><br><br>
			</td>
		</tr>
		
		<tr>
			<th colspan="2">
			<br><br>
				<input type="submit" value="생성" id="submit">
			</th>
		</tr>
</table>
</form>
</div>
</section>

<br><!-- footer 불러오기 -->
	<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include> 
</body>

