<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>



	<!-- 프론트엔드 암호화 불러오기 -->
	<script src="${pageContext.request.contextPath}/resources/js/secom.js"></script>
	

	
	
	<div align="center">
	
		<br><br>
		<h1>비밀번호 변경</h1>
		
		<form action="${pageContext.request.contextPath}/member/change" class="secure-form"  method="post" >
			<input type="hidden"  name="email" value ="${email}" >
			<input type="hidden" name="id" value="${id}">
	 		<input type="password" name="pw" placeholder="비밀번호" required><br><br>
			<input type="submit"  value="비밀번호 변경하기">
		</form>	
	
	</div>
