<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core" %>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<h1>아이디 : ${mylist.id }</h1><br>
<c:if test="${member_image_no>0 }">
	<img src="${pageContext.request.contextPath }/member/member/image?member_image_no=${member_image_no}" style="max-width: 40%; height: auto;" onerror="no_image2()" id="member_image">
</c:if>
<h3>이름 : ${mylist.name }</h3>
<h3>닉네임 : ${mylist.nick }</h3>
<h3>전화번호 : ${mylist.phone }</h3>
<h3>주소 : ${mylist.total_addr }</h3>
<h3>포인트 : ${mylist.point }점</h3>
<h3>가입일 : ${mylist.total_joindateWithFormat }</h3>
<h3>최종로그인 : ${mylist.final_loginWithFormat }</h3>
<h3>반려동물 : ${mylistpet.size() }마리</h3>

<!-- 정보수정 -->
<form action="mylistchange" method="get">
	<input type="hidden" name="id" value="${mylist.id}">
	<input type="submit" value="정보수정">
</form>

<c:if test="${mylist.pets eq '예'}">
	<c:forEach var="pet"  items="${mylistpet }">
	<br><hr>
		<h3>이름 : ${pet.name }</h3>
			<img src="${pageContext.request.contextPath }/member/pet/image?pet_no=${pet.pet_no}" style="max-width: 40%; height: auto;" onerror="no_image()" id="pet_image">
			<script>
			function no_image() {
				$("#pet_image").hide();
			 }
			 function no_image2(){
				 $("#member_image").hide();
			 }
			</script>
		<h3>나이 : ${pet.age }</h3>
		<h3>동물종 : ${pet.type }</h3>
		<h3>${pet.ect }</h3>
		<a href="petchange?pet_no=${pet.pet_no }"><button>동물정보수정</button></a>
	<hr>	
	</c:forEach>
</c:if>
