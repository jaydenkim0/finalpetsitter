<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
	<title>Home</title>
</head>
<body>
<h1>
	Hello PetMily world!  
</h1>

<P>  show me the money </P>

<p>로그인 아이디 : ${id} <br>
로그인 등급 : ${grade} <br><p>
<c:if test="${not empty id }">
	<a href="member/logout">
			<input type="button" value="로그아웃">
	</a>
</c:if>


</body>
</html>
