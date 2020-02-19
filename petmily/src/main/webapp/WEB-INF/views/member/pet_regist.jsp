<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<h1>${member_id } 님의 pet_regist.jsp</h1>
<head>
<script>
</script>
</head>

<body>

<form action="pet_regist?member_id=${member_id }" method="post" name="test" enctype="multipart/form-data">
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
				<input type="text" name="name">
			</td>
		</tr>
		<tr>
			<th>나이</th>
			<td>
				<input type="text" name="age" >
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
				<input type="submit" value="펫추가">
			</th>
		</tr>
	</table>
</form>

</body>