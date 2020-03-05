<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<style>
	
	
	button{
   font:13px;
   width: 120px;
   height: 40px;
   text-align: center;
   box-shadow: 0;
   cursor: pointer;
   color:#1482e0;
   
	}
	.button:hover{
	color: white;
	}
	.hover:hover{
	border: 1px solid #1482e0;
    background-color:#1482e0;
	
	}
	
	
</style>
<body>
<h1>마이 페이지 </h1>
<fieldset style="width:70px; height:750px;">
<legend>메뉴</legend>


<a href="mylist">
	<button class="button hover"> 정보 조회</button>
</a><br><br>
<a href="myreview">
	<button class="button hover"> 리뷰 조회</button>
</a><br><br>

<a href="myreservation">
	<button class="button hover"> 예약 조회 </button>
</a><br><br>


<a href="mycareboard">
	<button class="button hover"> 돌봄 방 </button>
</a><br><br>


<a href="myqnaboard">
	<button class="button hover"> 신고 / 문의 </button>
</a><br><br>


<a href="mystrayboard">
	<button class="button hover">Save the Pets!</button>
</a>


</fieldset>
</body>