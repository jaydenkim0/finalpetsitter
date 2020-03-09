<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="context" value="${pageContext.request.contextPath}"></c:set>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
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
   <script>
	function no_image2() {
		$("#2").attr("src", "/petmily/resources/img/기본프로필.jpeg");
	}
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
div#side_left {
	position: relative;
	width: 350px;
	height:550px;
	background-color: white;
	left: 330px;
	top: 80px;
	padding:8pt;
	
}
#side_left_box {
	position:relative;
	width: 250px;
	height: 400px;
	background-color: white;
	float:left;
	margin-left: 80px;
	top:30px;
}
#side_left_box2{
	position:relative;
	left:140px;
    
}
#mid_content {
	position: relative;
	width: 700px;
	height: 200px;
	background-color: white;
	float: right;
	bottom: 530px;
	right: 450px;
}
#mid_content2 {
	position: relative;
	width: 700px;
	height: 200px;
	background-color: white;
	float: right;
	bottom: 295px;
	left:250px;
	
}
#mid_content3 {
	position: relative;
	width: 700px;
	height: 200px;
	background-color: white;
	float: right;
	right:450px;
	bottom:260px;
}
#mid_content4 {
	position: relative;
	width: 700px;
	height: 200px;
	background-color: white;
	float: right;
	left:250px;
	bottom:30px;
}
#mid_content5 {
	position: relative;
	width: 700px;
	height: 200px;
	background-color: white;
	float: right;
	right:450px;
	bottom:10px;
}
#side_content_box {
position: relative;
	display: inline;
	background-color: white;
	margin: 40px;
	float: left;
	left:100px;
	top:20px;
	right:50px;
}
#side_content_box2 {
position: relative;
	display: inline;
	background-color: white;
	margin: 40px;
	float: left;
	left:100px;
	top:20px;
	right:100px;
}
#side_content_box3 {
position: relative;
	display: inline;
	background-color: white;
	margin: 50px;
	float: left;
	left:90px;
	top:22px;
	right:100px;
	font-size:16px;
	}
	#side_content_box4 {
position: relative;
	display: inline;
	background-color: white;
	margin: 50px;
	float: left;
	left:90px;
	top:22px;
	right:100px;
	font-size:16px;
	}
	
	#side_content_box5 {
position: relative;
	display: inline;
	background-color: white;
	margin: 50px;
	float: left;
	left:90px;
	top:22px;
	right:90px;
	font-size:16px;
	}
	
body {
	background-color: #FAFAFA;
}
img {
    border-radius: 100pt;
}
button{
	width: 60px;
		height: 35px;
		border: none;
		background-color: #1482e0;
		color: #fff;
		font-size: 11px;
		font-weight: bold;
		position: relative;
		top: 1px;
		border-radius:7px;
		left:20px;
}

th{
position:relative;
right:15px;
font-size:12pt;
padding:10px;
}
td{
font-size:10pt;
}
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
	padding-top:200px;
	padding-bottom:100px;
	}
	.section-content::after{
      content:"";
      display:block;
      clear:both;
}

</style>

<!-- header 불러오기  -->
<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>
<section class="section-content">


	<div id="side_left" >
		<div id="side_left_box">
		<h3>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${mypage.name }</h3>
		<br>
			<img
				src="${pageContext.request.contextPath }/member/member/image?member_image_no=${member_image_no}"
				style="width: 170px; height: 170px;" onerror="no_image2()" id="2">
	
	<br><Br><br>
		<table>
	<tr>
	<th>Pets </th>
		<td>${mylistpet.size() }</td>
	</tr>
	<tr>
		<th>Point </th>
		<td>${mypage.point}</td>
	</tr>
	<tr>
		<th>JoinDate </th>		
		<td>${mypage.total_joindateWithFormat }</td>
		</tr>
		<tr>
			<th>LastLogin </th>		
			<td>${mypage.final_loginWithFormat }</td>
	</tr>
</table>
<div id="side_left_box2">

	<a href="mylist">
				<button>GO</button>
			</a>
	</div>

		</div>
	</div>
	

	<div id="mid_content" >
		<div id="side_content_box">
		<h2>예약 조회</h2>
		예약 조회 및 이용 후 리뷰 작성을 합니다.  &nbsp;
			<a href="myreservation">
				<button>GO</button>
			</a>
		</div>
</div>
		<div id="mid_content2" >
		<div id="side_content_box2">
		<h2>리뷰 조회</h2>
		내가 작성한 리뷰를 조회 합니다.   &nbsp;&nbsp;
			<a href="myreview">
				<button>GO</button>
			</a>
		</div>
	</div>
	<div id="mid_content3" >
<div id="side_content_box3">
 <h2>돌봄방 조회</h2>
 나의 돌봄방으로 이동 합니다. &nbsp;&nbsp;&nbsp;
  		<a href="mycareboard">
			<button>GO</button>
		</a>
</div>
</div>

<div id="mid_content4" >
<div id="side_content_box4">
 <h2>신고 / 문의</h2>
 나의 신고 및 문의 내역으로 이동 합니다.&nbsp;&nbsp;
<a href="myqnaboard">
	<button>GO</button>
</a>
</div>
</div>
<div id="mid_content5" >
		<div id="side_content_box5">
 <h2>세이브 더 펫</h2>
나의 세이브 더 펫으로 이동합니다. &nbsp;&nbsp;&nbsp;
			<a href="mystrayboard">
			<button>GO</button>
		</a>
</div>
	
	</div>

</section>
<!-- footer 불러오기 -->
	<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>    
