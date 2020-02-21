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
<script>
function no_image2(){
	$("#2").attr("src", "/petmily/resources/img/기본프로필.jpeg");
}
</script>
<style>
	th{
		text-align: right;
	}
</style>
<div align="center">
<h1>내정보조회</h1>
<table width="100%">
	<tr>
		<th width="50%">아이디&emsp;</th>
		<td width="50%">${mylist.id }</td>
	</tr>
	<tr>
		<th>프로필사진&emsp;</th>
		<td>
			<img src="${pageContext.request.contextPath }/member/member/image?member_image_no=${member_image_no}" style="width: 20%; height: auto;" onerror="no_image2()" id="2">
		</td>
	</tr>
	<tr>
		<th>이름&emsp;</th>
		<td>${mylist.name }</td>
	</tr>
	<tr>
		<th>닉네임&emsp;</th>
		<td>${mylist.nick }</td>
	</tr>
	<tr>
		<th>전화번호&emsp;</th>
		<td>${mylist.phone }</td>
	</tr>
	<tr>
		<th>주소&emsp;</th>
		<td>${mylist.total_addr }</td>
	</tr>
	<tr>
		<th>포인트&emsp;</th>
		<td>${mylist.point }점</td>
	</tr>
	<tr>
		<th>가입일&emsp;</th>
		<td>${mylist.total_joindateWithFormat }</td>
	</tr>
	<tr>
		<th>최종로그인&emsp;</th>
		<td>${mylist.final_loginWithFormat }</td>
	</tr>
	<tr>
		<th>반려동물&emsp;</th>
		<td>${mylistpet.size() }마리</td>
	</tr>
</table>
<br>
<!-- 정보수정 -->
<form action="mylistchange" method="get">
	<input type="hidden" name="id" value="${mylist.id}">
	<input type="submit" value="정보수정">
</form>

<c:if test="${mylist.pets eq '예'}">
<div align="center">
	<c:forEach var="pet"  items="${mylistpet }">
	<br><hr><br>
	<table width="100%">
		<tr>
			<th width="50%">이름&emsp;</th>
			<td width="50%">${pet.name }</td>
		</tr>
		<tr>
			<th>펫프로필사진&emsp;</th>
			<td>
				<c:choose>
					<c:when test="${pet.pet_image_no<1 }">
						<img src="/petmily/resources/img/기본프로필.jpeg" style="width: 20%; height: auto;">
					</c:when>
					<c:otherwise>
						<img src="${pageContext.request.contextPath }/member/pet/image?pet_no=${pet.pet_no}" style="width: 20%; height: auto;">			
					</c:otherwise>
				</c:choose>
			</td>
		</tr>
		<tr>
			<th>나이&emsp;</th>
			<td>${pet.age }</td>
		</tr>
		<tr>
			<th>동물종&emsp;</th>
			<td>${pet.type }</td>
		</tr>
		<tr>
			<th>소개&emsp;</th>
			<td>${pet.ect }</td>
		</tr>
	</table>
	<br>
		<a href="petchange?pet_no=${pet.pet_no }"><button>펫정보수정</button></a>
		<a href="pet_delete?pet_no=${pet.pet_no }"><button>삭제</button></a>
	<br>
	</c:forEach>
</div>
</c:if>
<br>
<hr>
<br>
<button id="add_btn">펫 추가</button>
<div id="add_content">
<form action="pet_regist" method="post" name="test" enctype="multipart/form-data">
	<input type="hidden" name="member_id" value="${mylist.id }">
	<table>
		<tr>
			<th width="50%">이미지&emsp;</th>
			<td width="50%">
				<input type="file" name="pet_image" multiple accept="image/*">
			</td>
		</tr>
		<tr>
			<th>이름&emsp;</th>
			<td>
				<input type="text" name="name" required>
			</td>
		</tr>
		<tr>
			<th>나이&emsp;</th>
			<td>
				<input type="number" name="age" >
			</td>
		</tr>
		<tr>
			<th>동물종&emsp;</th>
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
			<th>소개&emsp;</th>
			<td>
				<textarea name="ect"></textarea>
			</td>
		</tr>
	</table>
				<input type="submit" value="펫추가">
				<input type="reset" value="취소" id="cancel">
</form>
</div>
<br><br><br>

</div>