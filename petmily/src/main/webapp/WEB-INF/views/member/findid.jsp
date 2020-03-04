<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<style>
.search{
	 FONT-weight:bold;
	 font-size:14pt;
 
}

.btn{
border: none;
	background-color: #BDBDBD;
	width: 300px;
	height: 40px;
	color: #fff;
	font-size: 15px;
	font-weight: bold;
	BORDER-RADIUS:3PX;
	
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
	background-color:#FAFAFA;
}

body{
	background-color:#FAFAFA;
}
</style>




<br><br>
<div class="search" align="CENTER">
<h1>아이디 찾기</h1>
<br>
<form action="findid" method="post">
	<br>
	<input type="text" name="name" required placeholder="이름 입력"><br><br>
	<br>
	<input type="email" name="email" required placeholder="회원가입시 사용했던 이메일을 입력"><br><br>
	<br>
	<input type="tel" name="phone" required placeholder="-를 제외한 휴대폰번호 숫자 입력"><br><br><br>
	<input type="submit" value="확인" class="btn" id="loginbtn">
</form>
</div>
