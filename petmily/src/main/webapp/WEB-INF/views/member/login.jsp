<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html lang="ko">
<head>
<link rel="stylesheet" href="css/styles.css">
<c:set var="context" value="${pageContext.request.contextPath}"></c:set>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<!-- 프론트엔드 암호화 불러오기 -->
<script src="${pageContext.request.contextPath}/resources/js/secom.js"></script>
<style type="text/css">

.loginbox {
	position:absolute;
	top:0; left:0; bottom:0; right:0;
	height:10%;
	margin:10% auto;
}

.loginbox h1 {
	width: 100%;
	height: 100px;
	font-size: 36px;
	color: #1C1C1C;

	padding-left: 40px;
	box-sizing: border-box;
	margin-bottom: 50px;
	
	
	
}

#loginid, #loginpw {
	width: 420px;
	height: 45px;
	border: 1px solid #999;
	box-sizing: border-box;
	margin-bottom: 10px;
	

}

.btnwrap {
	width: 100%;
	text-align: center;
}


.btnwrap a {
	width:400px;
	border-top: 2px solid #eee;
	text-decoration: none;
	color: #fff;
	font-size: 12px;
	
	
	
}

#loginbtn {
	width: 420px;
	height: 50px;
	border: none;
	background-color: #1482e0;
	border-radius: 3px;
	color: #fff;
	font-size: 15px;
	font-weight: bold;
	position: relative;
	top: 1px;
	
}
body{
 background-image: url(${context}/resources/img/gra.jpg);
 background-size: cover;
}



.loginbox img
{

width:90px;
height:140px;
float:center;



}

</style>
</head>



 <body>
 
<div  class="loginbox" align="center">
	<h1><img src="${context}/resources/img/Logo.png" ></h1>
	<form action="login" class="secure-form" method="post">
	  
		<input class="block-item input-item" type="text" id="loginid"
			name="id" placeholder="아이디" required> <br>
		<br> <input class="block-item input-item" type="password"
			id="loginpw" name="pw" placeholder="비밀번호" required>
		
		
		<div class="search">
	
	
</div>
		<br>
		<div class="btnwrap">
			 <input class="btn" type="submit" value="로그인" id="loginbtn"><br><br><br><br>
			 <a href="findid">아이디찾기&nbsp;|</a><a href="input">&nbsp;비밀번호 찾기&nbsp;</a><a href="regist">|회원가입</a> 
		</div>
	</form>
	<c:if test="${param.error!=null }">
		<h5>입력하신 정보가 일치하지 않습니다</h5>
	</c:if>
</div>





</body>
</html>



