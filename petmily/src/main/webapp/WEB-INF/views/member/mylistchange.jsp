<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>


	<body>
		
			<form action="mylistchange?id=${member.id}" method="post">
			    
				성명:
				<input type="text"  name="name" value=${member.name}><br>
				닉네임:
				<input type="text"  name="nick" value=${member.nick}><br>
				이메일:
				<input type="text" name="email" value=${member.email}><br>
				전화번호:
				<input type="text"  name="phone" value=${member.phone}><br>
				우편번호:
				<input type="text"  name="post" value=${member.post}><br>
				기본주소:
				<input type="text"  name="basic_addr" value=${member.basic_addr}><br>
				상세주소:
				<input type="text"  name="extra_addr" value=${member.extra_addr}><br>
				
				
				<button type="submit" >회원정보수정</button><br><br>
			</form>
			
			<form action="memberdelete" method="post">
				<input type="hidden" name="id" value="${member.id }">
				<input type="password" name="password"><br>
				<input type="submit" value="회원탈퇴">		
			</form>
			
			<a href="mylist">
				<button type="button">취소</button>
			</a>
		
	</body>
	
</html>