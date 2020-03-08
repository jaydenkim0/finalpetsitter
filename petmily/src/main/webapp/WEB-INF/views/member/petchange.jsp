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

 body{
 
 
 }

	#petchbtn{
	display: white;
   width: 70px;
   height: 30px;
   line-height: 20px;
   border: 1px #3399dd solid;
   background-color: white;
   text-align: center;
   font-size: 12px;
   cursor: pointer;
   color: #1482e0;
   transition: all 0.9s, color 0.3;
   border-radius:10px;
	
	}
	
		input{
	width:180px;
	height:35px;
	BORDER-BOTTOM: teal 1px solid;
		BORDER-LEFT: medium none;
		BORDER-RIGHT: medium none;
		BORDER-TOP: medium none;
		FONT-SIZE: 9pt;
		BORDER-STYLE:none;     
		border-bottom:solid 1px #cacaca;
		border-collapse:collapse;
		HEIGHT:40PX;
	
	
	}
	
</style>
<body>
<div class="chtab" align="center">
<form action="petchange?pet_no=${pet.pet_no }" method="post" name="test" enctype="multipart/form-data">
<input type="hidden" name="pet_no" value=${pet.pet_no }>
	<table >
		<tr>
			<th>이미지</th>
			<td>
			<c:choose>
				<c:when test="${pet.pet_image_no<1 }">
					<img src="/petmily/resources/img/기본프로필.jpeg" style="width: 150px; height: 150px;"><Br><br>
				</c:when>
				<c:otherwise>	
					<img src="${pageContext.request.contextPath }/member/pet/image?pet_no=${pet.pet_no}" style="width: 150px; height: 150px;" onerror="no_image()" id="pet_image"><br><Br>
				</c:otherwise>
			</c:choose>
				<input type="file" name="pet_image" accept="image/*">
			</td>
		</tr>
		<tr>
			<th>Name</th>
			<td>
				<input type="text" name="name" value=${pet.name }>
			</td>
		</tr>
		<tr>
			<th>Age</th>
			<td>
				<input type="number" name="age" value=${pet.age }>
			</td>
		</tr>
		<tr>
			<th>Type</th>
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
			<th>etc</th>
			<td>
				<textarea name="ect">${pet.ect }</textarea>
			</td>
		</tr>
		
		<tr>
		
			<th colspan="2">
				<input type="submit" value="수정" id="petchbtn">
			</th>
		</tr>
	</table>
</form>
</div>
</body>