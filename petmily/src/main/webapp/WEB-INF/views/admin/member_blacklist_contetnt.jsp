<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	
	
	<h3>회원 경고 사유 작성</h3>
	
	<br>	
	<a href="${pageContext.request.contextPath}/admin/"><button>메인으로</button></a>
	<br>		
	
	<form action="member_blackListpage" method="post">				
		<input type="hidden" name="id" value="${id}">
		<textarea cols="100" rows="50" name="black_content"></textarea>
		<input type="submit" value="등록하기">
	</form>