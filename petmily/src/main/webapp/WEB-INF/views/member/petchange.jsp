<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<head>
<script>
</script>
</head>

<body>

<form action="petchange?pet_no=${pet.pet_no }" method="post" name="test">
<input type="hidden" name="pet_no" value=${pet.pet_no }>
	<table border="1">
		<tr>
			<th>name</th>
			<td>
				<input type="text" name="name" value=${pet.name }>
			</td>
		</tr>
		<tr>
			<th>age</th>
			<td>
				<input type="text" name="age" value=${pet.age }>
			</td>
		</tr>
		<tr>
			<th>type</th>
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
			<th>ect</th>
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