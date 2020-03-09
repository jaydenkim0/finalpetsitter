<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

	<!-- 프론트엔드 암호화 불러오기 -->
	<script src="${pageContext.request.contextPath}/resources/js/secom.js"></script>
    
    
<head>

<style>
  .modal{
  	position: fixed;
  	top:0;
  	left:0;
  	right:0;
  	bottom:0;
	background-color: black;
  }
  
  .modal > .modal-view{
  	position: fixed;
  	width: 300px;
  	height:200px;
  	background-color: white;
  	border-radius: 50pt;
  	top: 50%;
  	left: 50%;
  	margin-left: -150px;
  	margin-top:-100px;
  }
  .btn {
	display: white;
	width: 80px;
	height: 10x;
	line-height: 20px;
	border: 1px #3399dd solid;
	background-color: white;
	text-align: center;
	font-size : 12px;
	cursor: pointer;
	color: #1482e0;
	transition: all 0.9s, color 0.3;
}

.btn:hover {
	color: white;
}

.hover3:hover {
	background-color: #1482e0;
}
</style>

</head>


<body>

<!-- 비밀번호 검사 모달창 -->
<div class="modal">
	<div class="modal-view">
		<form action="memberdelete" class="secure-form"  method="post"> 
			<div align="center">
			<br>
				<p>비밀번호 입력</p>
				<br>
				<input type="hidden" name="id" value="${id }">
				<input type="password" required name="password"><br><br>
				<input type="submit" value="입력" class="btn hover3">
			</div>
		</form>
	</div>
</div>

</body>