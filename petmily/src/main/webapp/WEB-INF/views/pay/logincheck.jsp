<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<head>
	<link rel="stylesheet" href="css/styles.css">	
	<c:set var="context" value="${pageContext.request.contextPath}"></c:set>
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
     
	height: 140px;
	font-size: 36px;
	color: #1C1C1C;

	padding-left: 20px;
	box-sizing: border-box;
	margin-bottom: 40px;
	
	
	
}

#loginid, #loginpw {
	width: 420px;
	height: 45px;
	border: 1px solid #999;
	box-sizing: border-box;
	margin-bottom: 12px;
	border-radius: 3px;
	

}

.btnwrap {
	width: 100%;
	text-align: center;
	
}

.aa{
	width: 420px;
	border-top: 1px solid #eee;
	padding-top:10px;
	text-decoration:none;
	color: #fff;
	font-size: 12px;
	margin-left:auto; 
	margin-right:auto;
}

/* .btnwrap a { */
/* 	width:300px; */
/* 	border-top: 1px solid #eee; */
/* 	padding-top:10px; */
/* 	text-decoration:none; */
/* 	color: #fff; */
/* 	font-size: 12px; */
	
	
	
/* } */

.font2{
color : white;
font-weight: bold;
text-decoration: none;
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
  
 

<body>


	<div class="loginbox" align="center">
		<h1>
			<a href="${context}"> <img
				src="${context}/resources/img/Logo.png"></a>
		</h1>
		<form action="${pageContext.request.contextPath}/check/login"
			class="secure-form" method="post">

			<input class="block-item input-item" type="text" name="id" value="${id}" readonly id="loginid"> <br> 
			<input class="block-item input-item" type="password" id="loginpw" name="pw" placeholder="비밀번호" required> 
			<input type="hidden" name="reservation_no" value="${reservation_no}"> 
			<input type="hidden" name="sitter_no" value="${sitter_no}"> 
			<input type="hidden" name="go" value="/pay/account"> 
			<input type="hidden" name="back" value="/check/login">
	<div class="search"></div>
		<br>
			<div class="btnwrap" align="center">
			 <input class="btn" type="submit" value="로그인" id="loginbtn"><br><br><br><br>
			<br><br><br>
			<div class="aa"  align="center">
<!-- 			<a href="findid"> -->
<!-- 					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; -->
<!-- 					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;아이디찾기&nbsp;|</a> -->
<!-- 					<a href="input"> -->
<!-- 					&nbsp;비밀번호 변경&nbsp; -->
<!-- 					</a> -->
<!-- 					<a href="regist">|&nbsp;회원가입&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</a> -->
			  <a href="findid"  class="font2">아이디찾기&nbsp;|</a>
			 <a href="input" class="font2">&nbsp;비밀번호 변경&nbsp;</a>
			 <a href="regist" class="font2">|&nbsp;회원가입</a> 
			</div>
		</div>
		</form>
		<c:if test="${param.error!=null }">
			<h5>입력하신 정보가 일치하지 않습니다</h5>
		</c:if>
	</div>





</body>
</html>