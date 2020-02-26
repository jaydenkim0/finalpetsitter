<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
    <script>
    	$(document).ready(function() {		
	 		$("#gosendemail").submit();
    	});
	</script> 
    
	<div align="center">
	<h2>결제 완료 !</h2>
	<a href="${context}/member/myreservation">
	<button type="button">내 예약 목록</button></a>
	</div>
	
	<form id="gosendemail" action="${pageContext.request.contextPath}/pay/paysuccessSendEmail" method="post">
		<input type="hidden" name="id" value="${id}">
		<input type="hidden" name="email" value="${email}">
		<input type="hidden" name="total_amount" value="${total_amount}">
		<input type="hidden" name="sitter_id" value="${sitter_id}">
		<input type="hidden" name="sitter_email" value="${sitter_email}">
		<input type="hidden" name="reservation_no" value="${reservation_no}">
	</form>