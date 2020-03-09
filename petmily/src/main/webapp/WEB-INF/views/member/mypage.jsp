<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="context" value="${pageContext.request.contextPath}"></c:set>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
 
   <script>
	function no_image2() {
		$("#2").attr("src", "/petmily/resources/img/기본프로필.jpeg");
	}
</script>
    
    

     
<style>

div#side_left {
	position:absolute;
	width: 350px;
	height:550px;
	background-color: white;
	padding:8pt;
	left:375px;
	top:100px;
	
}

#side_left_box {

	width: 250px;
	height: 400px;
	background-color: white;
	margin-left: 80px;
	
}


#mid_content {

	position:absolute;
	width: 350px;
	height: 180px;
	background-color: white;
	left:800px;
	top:100px;
	
}

#mid_content2 {
	position:absolute;
	width: 350px;
	height: 180px;
	background-color: white;
	left:1200px;
	top:100px;
}

#mid_content3 {
	position:absolute;
	width: 350px;
	height: 180px;
	background-color: white;
	left:800px;
	bottom: 420px;
	
}


#mid_content4 {
	position:absolute;
	width: 350px;
	height: 180px;
	background-color: white;
 	bottom: 420px;
	left:1200px;
	

}



#mid_content5 {
	position:absolute;
	width: 350px;
	height: 180px;
	background-color: white;
	bottom: 200px;
	left:800px;
}

#side_content_box {

	display: inline;
	background-color: white;
	margin: 40px;
	
}

#side_content_box2 {

	display: inline;
	background-color: white;
	margin: 40px;

}

#side_content_box3 {

	display: inline;
	background-color: white;
	margin: 50px;
	
	font-size:16px;
	}
	#side_content_box4 {

	display: inline;
	background-color: white;
	margin: 50px;

	font-size:16px;
	}
	
	#side_content_box5 {

	display: inline;
	background-color: white;
	margin: 50px;

	font-size:16px;
	}
	
body {
	background-color: #F2F2F2;
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
		position: absolute;
		border-radius:7px;
		right:20px;
		bottom:10px;
}
th,td{
 padding: 10px;
 font-size:12px;

}





</style>


	<div id="side_left" style="border:1px solid #A4A4A4;">
		<div id="side_left_box">
		<h3>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${mypage.name }&nbsp; 님</h3>
		<br>
			<img
				src="${pageContext.request.contextPath }/member/member/image?member_image_no=${member_image_no}"
				style="width: 170px; height: 170px;" onerror="no_image2()" id="2">
	
	<br><Br><br>
		<table>
	<tr>
	<th>Pets </th>
		<td>${mylistpet.size() } 마리</td>
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
	

	<div id="mid_content" style="border:1px solid #A4A4A4;">
		<div id="side_content_box">
		<h2>예약 조회</h2>
		예약 조회 및 이용 후 리뷰 작성을 합니다.  &nbsp;
			<a href="myreservation">
				<button>GO</button>
			</a>
		</div>
</div>
		<div id="mid_content2" style="border:1px solid #A4A4A4;">
		<div id="side_content_box2">
		<h2>리뷰 조회</h2>
		내가 작성한 리뷰를 조회 합니다.   &nbsp;&nbsp;
			<a href="myreview">
				<button>GO</button>
			</a>
		</div>
	</div>
	<div id="mid_content3" style="border:1px solid #A4A4A4;">
<div id="side_content_box3">
 <h2>돌봄방 조회</h2>
 나의 돌봄방으로 이동 합니다. &nbsp;&nbsp;&nbsp;
  		<a href="mycareboard">
			<button>GO</button>
		</a>
</div>
</div>

<div id="mid_content4" style="border:1px solid #A4A4A4;">
<div id="side_content_box4">
 <h2>신고 / 문의</h2>
 나의 신고 및 문의 내역으로 이동 합니다.&nbsp;&nbsp;
		 <a href="myqnaboard">
			<button>GO</button>
		</a>
</div>
</div>
<div id="mid_content5" style="border:1px solid #A4A4A4;">
		<div id="side_content_box5">
 <h2>세이브 더 펫</h2>
나의 세이브 더 펫으로 이동합니다. &nbsp;&nbsp;&nbsp;
			<a href="mystrayboard">
			<button>GO</button>
		</a>
</div>
	
	</div>

</section>
 


