<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<<<<<<< HEAD




<a href="http://localhost:8080/petmily/board/review/insert">리뷰작성</a>
=======
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<h1>펫시터 정보 페이지</h1>
<<<<<<< HEAD
<form>
<!-- value값 나중에 검색해서 들어간 펫시터 아이디로 바꿀것!! -->
<input type="hidden" name="id" value="${id}">
</form>

=======
<c:forEach var="petsitterGetListVO" items="${petsitterList}">
	<c:forEach var="petsitterVO" items="${petsitterVO}">
		<span>펫시터 번호 : ${petsitterVO.pet_sitter_no}</span><br>
		<span>닉네임 : ${petsitterVO.nick}</span><br>
		<span>이름 : ${petsitterVO.name}</span><br>	
		<span>이메일 : ${petsitterVO.email}</span><br>	
		<span>소개글 : ${petsitterVO.info}</span><br><br>
	</c:forEach>
</c:forEach>

<h3>소개이미지</h3>
	<c:forEach var="sitterinfoimg" items="${sitterInfoimageList}">
		 <img src="${pageContext.request.contextPath}/admin/petsitter/sitterInfoimage?info_image_no=${sitterinfoimg.info_image_no}" width="20%" height="20%"> 
	</c:forEach>
>>>>>>> refs/remotes/origin/master
