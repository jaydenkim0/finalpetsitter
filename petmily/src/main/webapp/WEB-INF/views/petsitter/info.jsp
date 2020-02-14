<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<h1>펫시터 정보 페이지</h1>

<h3>소개이미지</h3>
	<c:forEach var="sitterinfoimg" items="${sitterInfoimageList}">
		 <img src="${pageContext.request.contextPath}/admin/petsitter/sitterInfoimage?info_image_no=${sitterinfoimg.info_image_no}" width="20%" height="20%"> 
	</c:forEach>

<c:forEach var="petsitterGetList" items="${petsitterList}">
	<!-- 펫시터 정보 -->
	<c:forEach var="petsitter" items="${petsitterGetList.petsitterVO}">
		<span>펫시터 번호 : ${petsitter.pet_sitter_no}</span><br>
		<span>아이디 : ${petsitter.sitter_id}</span><br>
		<span>닉네임 : ${petsitter.nick}</span><br>
		<span>이름 : ${petsitter.name}</span><br>	
		<span>이메일 : ${petsitter.email}</span><br>	
		<span>핸드폰 : ${petsitter.phone}</span><br>	
		<span>주소 : ${petsitter.getTotal_addr}</span><br>	
		<span>포인트 : ${petsitter.point}</span><br>	
		<span>반려동물 여부 : ${petsitter.pets}</span><br>	
		<span>가입일 : ${petsitter.getPetsitterdateWithFormat}</span><br>
		<span>소개글 : ${petsitter.info}</span><br>
		<span>반려동물 경험 여부 : ${petsitter.sitter_pets}</span><br>
		<span>상태 : ${petsitter.sitter_status}</span><br>
		<span>매칭 종류 : ${petsitter.sitter_matching_type}</span><br>
		<span>은행 및 계좌 : ${petsitter.getTotal_account}</span><br><br>
	</c:forEach>
	
	<!-- 펫시터 반려동물 정보 -->
	<c:forEach var="petsitterPets" items="${petsitterGetList.petsitterPetsVO}">
		<c:if test="${petsitterPets.pets eq '예'}">
			<span>반려동물 이름 : ${petsitterPets.pet_name}</span><br>
			<span>반려동물 나이 : ${petsitterPets.pet_age}</span><br>
			<span>반려동물 종류 : ${petsitterPets.pet_type}</span><br>
			<span>반려동물 기타 : ${petsitterPets.pet_ect}</span><br>
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