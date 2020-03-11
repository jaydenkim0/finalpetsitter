<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="context" value="${pageContext.request.contextPath}"></c:set>
<head>
<script>
function no_image() {
	$("#pet_image").hide();
 }
</script>
<style>
	
	th ,td{
	
	padding: 10px;
	text-align: center;
	width:300px;
	}
	input{
	width:180px;
	height:35px;
	BORDER-BOTTOM: teal 1px solid;
		BORDER-LEFT: medium none;
		BORDER-RIGHT: medium none;
		BORDER-TOP: medium none;
		FONT-SIZE: 9pt;
		BORDER-STYLE:none;     
		border-bottom:solid 1px #cacaca;
		border-collapse:collapse;
		HEIGHT:40PX;
	
	
	}
	table{
   padding-top:50px;
	width:410px;
	border-color : #BDBDBD;
	
	}
	
	#petchbtn {
	position:relative;
	display: white;
   width: 70px;
   height: 30px;
   line-height: 20px;
   border: 1px #3399dd solid;
   background-color: white;
   text-align: center;
   font-size: 12px;
   cursor: pointer;
   color: #1482e0;
   transition: all 0.9s, color 0.3;
   border-radius:10px;
   left:20px;
   }
   #petchbtn:hover{
   	background-color: #3399dd;
   	color: white;
   }
  .out{
   background-color:white;
   color: red;
   width:65%;
   }
   .box {
    width: 150px;
    height: 150px; 
    border-radius: 30%;
    overflow: hidden;
}
</style>
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
</head>
<body>
<!-- header 불러오기 -->
	<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>

<section class="section-content">
<div class="mychange" align="center">
<form action="petchange?pet_no=${pet.pet_no }" method="post" name="test" enctype="multipart/form-data">
<input type="hidden" name="pet_no" value=${pet.pet_no }>
	<table>
		<tr>
			<th>Image</th>
			<td>
			<c:choose>
				<c:when test="${pet.pet_image_no<1 }">
					<div class="box" style="background: #BDBDBD;">
						<img src="/petmily/resources/img/기본프로필.jpeg" style="width: 100%; height:100%;"><Br><br>
					</div>
				</c:when>
				<c:otherwise>	
					<div class="box" style="background: #BDBDBD;">
						<img src="${pageContext.request.contextPath }/member/pet/image?pet_no=${pet.pet_no}" style="width: 100%; height: 100%;" onerror="no_image()" id="pet_image"><br><Br>
					</div>
				</c:otherwise>
			</c:choose>
				<input type="file" name="pet_image" accept="image/*">
			</td>
		</tr>
		<tr>
			<th>Name</th>
			<td>
				<input type="text" name="name" value=${pet.name }>
			</td>
		</tr>
		<tr>
			<th>Age</th>
			<td>
				<input type="number" name="age" value=${pet.age }>
			</td>
		</tr>
		<tr>
			<th>Type</th>
			<td>
				<select name="type" id="select">
			 		<option value="강아지">강아지</option>			 		
			 		<option value="고양이">고양이</option>
			 		<option value="물고기">물고기</option>			 		
			 		<option value="토끼">토끼</option>
			 		<option value="햄스터">햄스터</option>			 		
			 		<option value="파충류">파충류</option>
			 	</select>
			 	<script>document.test.type.value='${pet.type}';</script>
			</td>
		</tr>
		<tr>
			<th>etc</th>
			<td>
				<textarea name="ect">${pet.ect }</textarea>
			</td>
		</tr>
		
		<tr>
		
			<th colspan="2">
				<input type="submit" value="수정" id="petchbtn">&nbsp;&nbsp;&nbsp;
			</th>
		</tr>
	</table>
</form>
</div>

<br><!-- footer 불러오기 -->
	<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>  
</section>
</body>