<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core" %>
<head>
<script>
function no_image() {
	$("#pet_image").hide();
 }
</script>
</head>
<style>
 .chtab{
 width:35%;
 }
</style>
<body>

<form action="petchange?pet_no=${pet.pet_no }" method="post" name="test" enctype="multipart/form-data">
<input type="hidden" name="pet_no" value=${pet.pet_no }>
	<table border="1" class="chtab" align="center">
		<tr>
			<th>이미지</th>
			<td>
			<c:choose>
				<c:when test="${pet.pet_image_no<1 }">
					<img src="/petmily/resources/img/기본프로필.jpeg" style="width: 100px; height: 100px;">
				</c:when>
				<c:otherwise>	
					<img src="${pageContext.request.contextPath }/member/pet/image?pet_no=${pet.pet_no}" style="width: 100px; height: 100px;" onerror="no_image()" id="pet_image">
				</c:otherwise>
			</c:choose>
				<input type="file" name="pet_image" accept="image/*">
			</td>
		</tr>
		<tr>
			<th>이름</th>
			<td>
				<input type="text" name="name" value=${pet.name }>
			</td>
		</tr>
		<tr>
			<th>나이</th>
			<td>
				<input type="number" name="age" value=${pet.age }>
			</td>
		</tr>
		<tr>
			<th>동물 종류</th>
			<td>
				<select name="type" id="select">
			 		<option value="강아지">강아지</option>			 		
			 		<option value="고양이">고양이</option>
			 		<option value="물고기">물고기</option>			 		
			 		<option value="토끼">토끼</option>
			 		<option value="햄스터">햄스터</option>			 		
			 		<option value="파충류">파충류</option>
			 	</select>
			 	<script>document.test.type.value='${pet.type}';</script>
			</td>
		</tr>
		<tr>
			<th>설명</th>
			<td>
				<textarea name="ect">${pet.ect }</textarea>
			</td>
		</tr>
		<tr>
			<th colspan="2">
				<input type="submit" value="펫정보수정">
			</th>
		</tr>
	</table>
</form>

</body>