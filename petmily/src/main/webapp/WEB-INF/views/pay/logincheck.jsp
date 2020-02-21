<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	<!-- 프론트엔드 암호화 불러오기 -->
	<script src="${pageContext.request.contextPath}/resources/js/secom.js"></script>  

    
        
	<h3>로그인 체크</h3>
	
	<h4>아이디 : ${id}</h4>
	
	<form action="${pageContext.request.contextPath}/check/login"  class="secure-form" method="post">
		<input type="hidden" name="id" value="${id}">
		<input type="hidden" name="reservation_no" value="${reservation_no}">
		<input type="hidden" name="sitter_no" value="${sitter_no}">
		<input type="hidden" name="go" value="/pay/account">	
		<input type="password" name="pw" placeholder="비밀번호" required>
		<input type="submit" value="로그인">	
	</form>
		<c:if test="${param.error!=null }">
			<h5>입력하신 정보가 일치하지 않습니다</h5>
		</c:if>	
		