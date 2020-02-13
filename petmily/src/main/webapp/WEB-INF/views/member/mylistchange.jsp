<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

	<head>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	<script>
		$(function(){
			$(".memberdelete_btn").click(function(){
				var url = $(".memberdelete").attr("action");
				var method = $(".memberdelete").attr("method");
				var data = $(".memberdelete").serialize();
				
				$.ajax({
					url:url,
					type:method,
					data:data
				});
			});
		});
	</script>
	</head>

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
				<input type="text"  name="extra_addr" value=${member.extra_addr}><br><br>
				
				
				<button type="submit" >회원정보수정</button><br><br>
			</form>
			
			<hr>
			
			<a href="memberdelete?id=${member.id}"><button>회원탈퇴</button></a>

			<c:if test="${not empty fail }">
				<p>탈퇴 실패</p>
			</c:if>
			
			<hr>
			
			<a href="mylist">
				<button type="button">취소</button>
			</a>
		
	</body>
	
</html>