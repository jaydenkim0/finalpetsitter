<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
	<h1>회원 관리페이지</h1>
	<!-- 메인으로 돌아가는 버튼 -->
	<br>
	<a href="${pageContext.request.contextPath}/admin/"><button>메인으로</button></a>
	
	
	
	<c:forEach var="member"  items="${memberList}">
					<h5>아이디 : ${member.id},
					이름 : ${member.name},
					닉네임 : ${member.nick},
					이메일 : ${member.email}</h5>
					<hr>
	</c:forEach>