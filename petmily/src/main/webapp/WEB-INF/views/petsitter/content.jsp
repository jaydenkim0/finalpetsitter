<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<h1>펫시터 상세 페이지</h1>

<!-- 소개 이미지 출력 -->
<div>
<h3>소개이미지</h3>
	<c:forEach var="sitterinfoimg" items="${sitterInfoimageList}">
		 <img src="${pageContext.request.contextPath}/admin/petsitter/sitterInfoimage?info_image_no=${sitterinfoimg.info_image_no}" width="20%" height="20%"> 
	</c:forEach>
</div>


<!-- 펫시터 정보 출력 -->
<div>
<c:forEach var="petsitterGetList" items="${petsitterList}">
	<!-- 펫시터 정보 -->
	<c:forEach var="petsitter" items="${petsitterGetList.petsitterVO}">
		<!-- 펫시터 견적 신청 버튼 -->
		<a href="estimate?pet_sitter_no=${petsitter.pet_sitter_no}"><button>펫시터 견적 신청</button></a><br><br>		
		
		<span>닉네임 : ${petsitter.nick}</span><br>
		<span>소개글 : ${petsitter.info}</span><br><br>
		<span>매칭 종류 : ${petsitter.sitter_matching_type}</span>
	</c:forEach>
	
	<!-- 펫시터 반려동물 정보 -->
	<c:forEach var="petsitterPets" items="${petsitterGetList.petsitterPetsVO}">
	<c:if test="${petsitterPets.pets eq '예'}">
		<span>반려동물 이름 : ${petsitterPets.pet_name}</span><br>
		<span>반려동물 나이 : ${petsitterPets.pet_age}</span><br><br>
	</c:if>
	</c:forEach>
	
	<!-- 펫시터 능력 정보 -->
	<c:forEach var="skillName" items="${petsitterGetList.skillNameDto}">
		<span>보유 스킬 : ${skillName.skill_name}</span><br>
	</c:forEach>
	<c:forEach var="careConditionName" items="${petsitterGetList.careConditionNameDto}">
		<span>돌봄 환경 : ${careConditionName.care_condition_name}</span><br>
	</c:forEach>
	<c:forEach var="carePetTypeName" items="${petsitterGetList.carePetTypeNameDto}">
		<span>돌봄 가능한 동물 : ${carePetTypeName.care_type}</span><br>
	</c:forEach>
	<c:forEach var="location" items="${petsitterGetList.locationDto}">
		<span>${location.city} ${location.area}</span><br>
	</c:forEach>

	
</c:forEach>
</div>