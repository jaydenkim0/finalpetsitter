<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	
	
	
	<h1> 펫시터 옵션 기능 추가 삭제 </h1>
	<br>
	<a href="${pageContext.request.contextPath}/admin/petsitter"><button>펫시터페이지로 이동</button></a>
	
	<br><br>
	<hr>
	<br><br>
	
	<h2>펫시터 케어가능 동물 추가 제거</h2>
	
	<h3>
		<c:forEach var="carePetType" items="${CTlist}">	
				
			${carePetType.care_type}
		
		<!-- 삭제 -->
			<form action="${pageContext.request.contextPath}/admin/petsitter/option/carePetTypeD"  method="get">
				<input type="hidden" name="care_type_no" value="${carePetType.care_type_no}">
				<input type="submit" value="삭제하기">
			</form>
		</c:forEach>
	
	<!-- 등록하기 -->
		<form action="${pageContext.request.contextPath}/admin/petsitter/option/scarePetTypeI"  method="get">
				<input type="text" name="care_type" placeholder="돔봄가능한 동물" required>
				<input type="submit" value="등록하기">
		</form>	
	</h3>
	
	<br><br>
	<hr>
	<br><br>
	
		<h2>펫시터 스킬 네임 추가 제거</h2>
	
	<h3>
		<c:forEach var="petSkillName" items="${SKlist}">	
				
			${petSkillName.skill_name}
		
		<!-- 삭제 -->
			<form action="${pageContext.request.contextPath}/admin/petsitter/option/petSkillNameD"  method="get">
				<input type="hidden" name="skill_no" value="${petSkillName.skill_no}">
				<input type="submit" value="삭제하기">
			</form>
		</c:forEach>
	
	<!-- 등록하기 -->
		<form action="${pageContext.request.contextPath}/admin/petsitter/option/petSkillNameI"  method="get">
				<input type="text" name="skill_name" placeholder="스킬이름등록" required>
				<input type="submit" value="등록하기">
		</form>	
	</h3>
	
	<br><br>
	<hr>
	<br><br>
	
		<h2>펫시터 환경 추가 제거</h2>
	
	<h3>
		<c:forEach var="petCareCondition" items="${CClist}">	
				
			${petCareCondition.care_condition_name}
		
		<!-- 삭제 -->
			<form action="${pageContext.request.contextPath}/admin/petsitter/option/petCareConditionD"  method="get">
				<input type="hidden" name="care_condition_no" value="${petCareCondition.care_condition_no}">
				<input type="submit" value="삭제하기">
			</form>
		</c:forEach>
	
	<!-- 등록하기 -->
		<form action="${pageContext.request.contextPath}/admin/petsitter/option/petCareConditionI"  method="get">
				<input type="text" name="care_condition_name" placeholder="스킬이름등록" required>
				<input type="submit" value="등록하기">
		</form>	
	</h3>
	