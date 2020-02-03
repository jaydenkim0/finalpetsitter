<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>



<div align="center">
	
	<h2>회원가입</h2>
	
	<form action="regist" method="post">
	<table border="1">
		<tr>
			<th>아이디</th>
			<td>
				<input type="text" name="id" placeholder="아이디" required>
			</td>
		</tr>
		<tr>
			<th>비밀번호</th>
			<td>
				<input type="password" name="pw" placeholder="비밀번호" required>
			</td>
		</tr>
		<tr>
			<th>이름</th>
			<td>
				<input type="text" name="name" placeholder="이름" required>
			</td>
		</tr>
		
		<tr>
			<th>닉네임</th>
			<td>
				<input type="text" name="nick" placeholder="닉네임" required>
			</td>
		</tr>
		
		<tr>
			<th>이메일</th>
			<td>
				<input type="text" name="email" placeholder="이메일" required>
			</td>
		</tr>
		
		
		<tr>
			<th>전화번호</th>
			<td>
				<input type="tel" name="phone" placeholder="전화번호" required>
			</td>
		</tr>
		
		<tr>
			<th rowspan="3">주소</th>
			<td>
				<input type="text" name="post" size="6" placeholder="우편번호">
				<input type="button" value="우편번호 찾기">
			</td>
		</tr>
		<tr>
			<td>
				<input type="text" name="basic_addr" size="50" placeholder="기본주소">
			</td>
		</tr>
		<tr>
			<td>
				<input type="text" name="extra_addr" size="50" placeholder="상세주소">
			</td>
		</tr>
		
		
		<tr>
			<th rowspan="3">반려동물 유뮤</th>
			<td>				
			 		<select name="pets">
			 			<option>예</option>
			 			<option>아니오</option>			 		
			 		</select>
					
			</td>
		</tr>		
		
		
		<tr> 
			<th colspan="2">
				<input type="submit" value="가입하기">
				<input type="reset" value="지우기">
			</th>
		</tr>
	</table>
	</form>
	
</div>

<br><br><br>

