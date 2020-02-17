<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	
	<h3>가격 옵션 설정</h3>
	
	<a href="${pageContext.request.contextPath}/admin/account"><button> 정산 페이지로 이동</button></a>
	
	<h3> 가격 리스트 </h3>
		<c:forEach var="accountList" items="${accountlist}" >
			<h5>가격명 : ${accountList.payname}</h5>
			<h5>가격 : ${accountList.payment} 원 </h5>		
				<a href="${pageContext.request.contextPath}/admin/accountoptiondelete?payinfo_no=${accountList.payinfo_no}">
				<button> 삭제</button>
			</a>
			<hr>	
		</c:forEach>
		
		<br><br>
		
		
	<h3> 수수료 리스트 </h3>
		<c:forEach var="accountList" items="${feesList}" >
			<h5>수수료명 : ${accountList.payname}</h5>
			<h5>수수료 : ${accountList.payment} % </h5>		
				<a href="${pageContext.request.contextPath}/admin/accountoptiondelete?payinfo_no=${accountList.payinfo_no}">
				<button> 삭제</button>
			</a>
			<hr>	
		</c:forEach>
	
	
	<h3>금액 정보 추가</h3>
	
	<form action="${pageContext.request.contextPath}/admin/accountoption" method="post">
		<select name="paystatus">
			<option>가격</option>
			<option>수수료</option>
		</select>
		<input type="text" name="payname" placeholder="가격이름" required>
		<input type="number" name="payment" placeholder="가격" required step="any">
		<input type="submit" value="등록">
	</form>