<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>



	<!-- 프론트엔드 암호화 불러오기 -->
	<script src="${pageContext.request.contextPath}/resources/js/secom.js"></script>
	
<style>
#changebtn{
width: 100px;
	height: 40px;
	border: none;
	background-color: #1482e0;
	border-radius: 3px;
	color: #fff;
	font-size: 14px;
	font-weight: bold;
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
	

}
</style>
	
	
	<div align="center">
	
		<br><br>
	
		
		<form action="${pageContext.request.contextPath}/member/change" class="secure-form"  method="post" >
			<input type="hidden"  name="email" value ="${email}" >
			<input type="hidden" name="id" value="${id}">
	 		<input type="password" name="pw" placeholder="비밀번호 입력" required><br><br>
			<input type="submit"  value="변경" id="changebtn">
		</form>	
	
	</div>
