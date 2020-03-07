<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<c:set var="context" value="${pageContext.request.contextPath}"></c:set>
<script>
	function no_image2() {
		$("#2").attr("src", "/petmily/resources/img/기본프로필.jpeg");
	}
</script>
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
     
<style>

div#side_left {
	position: relative;
	width: 350px;
	height:550px;
	background-color: white;
	left: 330px;
	top: 80px;
	
}

#side_left_box {
	width: 250px;
	height: 400px;
	background-color: white;
	float:left;
	margin-left: 80px;
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
	bottom: 300px;
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
	bottom:40px;
	right:100px;
}



body {
	background-color: #FAFAFA;
}

img {
    border-radius: 100pt;
}
button{
	width: 70px;
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



.section-content::after{
      content:"";
      display:block;
      clear:both;
   }


</style>


<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>
<section class="section-content">

	<div id="side_left" style="border:1px solid #A4A4A4;">
		<div id="side_left_box">
		<h2>&nbsp;내 정보 조회</h2>
			<img
				src="${pageContext.request.contextPath }/member/member/image?member_image_no=${member_image_no}"
				style="width: 170px; height: 170px;" onerror="no_image2()" id="2">

			<a href="mylist">
				<button>이동</button>
			</a>
	<br><Br><br>
		<table >
	<tr>
		<th>JoinDate :</th>		
		<td>${mylist.total_joindateWithFormat }</td>
		</tr>
		<tr>
			<th>LastLogin :</th>		
			<td>${mylist.final_loginWithFormat }</td>
	</tr>
</table>
		</div>
	</div>

	<div id="mid_content" style="border:1px solid #A4A4A4;">
		<div id="side_content_box">
		<h1>예약 조회</h1>
		예약 조회 및 이용 후 리뷰 작성을 합니다.  &nbsp;
			<a href="myreservation">
				<button>이동</button>
			</a>
		</div>
</div>
		<div id="mid_content2" style="border:1px solid #A4A4A4;">
		<div id="side_content_box2">
		<h1>리뷰 조회</h1>
		내가 작성한 리뷰를 조회 합니다.   &nbsp;&nbsp;
			<a href="myreview">
				<button>이동</button>
			</a>
		</div>
	</div>
	<div id="mid_content3" style="border:1px solid #A4A4A4;">
<div id="side_content_box3">
   <h4> 나의 돌봄 방 &nbsp;&nbsp;&nbsp;
  		<a href="mycareboard">
			<button> 이동</button>
		</a></h4><br>
		 <h4>신고/문의 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		 <a href="myqnaboard">
			<button> 이동</button>
		</a></h4> <br>
		    <h4>Save the Pets!
		<a href="mystrayboard">
			<button>이동</button>
		</a></h4>
</div>
	</div>

</section>
	<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>    

</html>
