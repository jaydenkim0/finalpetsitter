<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Document</title>
    <style></style>
    <script src="https://cdn.jsdelivr.net/gh/hiphop5782/js/star/hakademy-star.min.js"></script>
    <script>
        window.addEventListener("load", function(){
        	Hakademy.PointManager.factory(".star-wrap");
        });
    </script>
</head>
<body>
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
	<c:forEach var="petsitter" items="${petsitterGetList.petsitterVO}" >

	

		<!-- 펫시터 견적 신청 버튼 -->
		<c:choose>
			<c:when test="${petscheck == 0}">
				<h3 style="color: blue;">등록하신 펫 정보가 없습니다</h3>
				<h3 style="color: blue;">펫이 등록되어 있어야 펫시터에게 견적요청이 가능합니다</h3>
				<h3 style="color: blue;">펫을 등록하신후에 견적요청을 진행해 주시기 바랍니다</h3>
			</c:when>
			<c:otherwise>
				<a href="estimate?pet_sitter_no=${petsitter.pet_sitter_no}"><button>펫시터 견적 신청</button></a><br><br>
			</c:otherwise>			
		</c:choose>
		
		<span>닉네임 : ${petsitter.nick}</span><br>
		<span>별점: <fmt:formatNumber value="${reviewstar}" pattern=".00"/>개<br></span>
		<div class="star-wrap" data-limit="3" data-unitsize="40" data-point="${reviewstar}" data-image="http://www.sysout.co.kr/file/image/288" data-readonly></div><br>
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
	<!-- 펫시터 리뷰 목록 -->



<h1>리뷰</h1>
<table border="0" width="40%" height="40%">
<tr>
<!-- 	<th>글번호</th> -->
	<th>작성자</th>
<!-- 	<th>시터번호</th> -->
	<th>제목</th>
	<th>내용</th>
	<th>별점</th>
<!-- 	<th>작성일</th> -->
	
	
</tr>
<c:forEach var="reviewDto" items="${list}">
<tr>
<%-- 	<td>${reviewDto.review_no}</td> --%>
	<td align="center">${reviewDto.review_writer}</td>
<%-- 	<td align="center">${reviewDto.review_sitter_no}</td> --%>
	<td align="center">${reviewDto.review_title}</td>
	<td align="center">${reviewDto.review_content}</td>
	<td align="center">${reviewDto.review_star}</td>
<%-- 	<td align="center">${reviewDto.review_wdate}</td> --%>
	
	</tr>
	</c:forEach>
	</table>
 <a href="/petmily/board/review/insert">
	<button type="button" id="btndelete">리뷰쓰기</button>
	</a>
	
	</c:forEach>
	</body>
	</html>

</div>