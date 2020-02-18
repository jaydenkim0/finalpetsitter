<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core" %>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script>
	$(function(){
		$("#add_content").hide();
		
		//펫 추가 버튼 눌렀을 시
		$("#add_btn").click(function(){
			$(this).hide();
			$("#add_content").show();
		});
		
		//취소 버튼 눌렀을 시
		$("#cancel").click(function(){
			$("#add_content").hide();
			$("#add_btn").show();
		});
	});
</script>
<h1>아이디 : ${mylist.id }</h1><br>
<c:if test="${member_image_no>0 }">
	<img src="${pageContext.request.contextPath }/member/member/image?member_image_no=${member_image_no}" style="width: 20%; height: auto;" onerror="no_image2()" id="member_image">
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
			<img src="${pageContext.request.contextPath }/member/pet/image?pet_no=${pet.pet_no}" style="width: 20%; height: auto;" onerror="no_image()" id="pet_image">
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
		<a href="petchange?pet_no=${pet.pet_no }"><button>펫정보수정</button></a>
		<a href="pet_delete?pet_no=${pet.pet_no }"><button>삭제</button></a>
	<hr>	
	</c:forEach>
</c:if>
<button id="add_btn">펫 추가</button>
<div id="add_content">
<form action="pet_regist" method="post" name="test" enctype="multipart/form-data">
	<input type="hidden" name="member_id" value="${mylist.id }">
	<table border="1">
		<tr>
			<th>이미지</th>
			<td>
				<input type="file" name="pet_image" multiple accept="image/*">
			</td>
		</tr>
		<tr>
			<th>이름</th>
			<td>
				<input type="text" name="name" required>
			</td>
		</tr>
		<tr>
			<th>나이</th>
			<td>
				<input type="number" name="age" >
			</td>
		</tr>
		<tr>
			<th>동물종</th>
			<td>
				<select name="type" id="select">
			 		<option value="강아지">강아지</option>			 		
			 		<option value="고양이">고양이</option>
			 		<option value="물고기">물고기</option>			 		
			 		<option value="토끼">토끼</option>
			 		<option value="햄스터">햄스터</option>			 		
			 		<option value="파충류">파충류</option>
			 	</select>
			</td>
		</tr>
		<tr>
			<th>설명</th>
			<td>
				<textarea name="ect"></textarea>
			</td>
		</tr>
		<tr>
			<th colspan="2">
				<input type="submit" value="펫추가"><input type="reset" value="취소" id="cancel">
			</th>
		</tr>
	</table>
</form>
</div>
<br><br><br>
