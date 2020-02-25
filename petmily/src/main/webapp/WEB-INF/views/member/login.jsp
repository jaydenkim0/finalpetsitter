<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<!-- 프론트엔드 암호화 불러오기 -->
	<script src="${pageContext.request.contextPath}/resources/js/secom.js"></script>  


	<div  align="center">
	
		<h1>로그인</h1>
		<form action="login"  class="secure-form"  method="post">
			<input class="block-item input-item" type="text" name="id" placeholder="ID" required>
			<br><br>
			<input class="block-item input-item" type="password" name="pw" placeholder="Password" required>
			<br><br>
			<input class="btn" type="submit" value="Login">
		</form>
		<c:if test="${param.error!=null }">
			<h5>입력하신 정보가 일치하지 않습니다</h5>
		</c:if>	
		
		<br><hr><br>
		<a href="findid">아이디 찾기</a><br>
		<a href="input">비밀번호 변경</a><br>
		<a href="regist">회원가입</a>

	</div>
	



    