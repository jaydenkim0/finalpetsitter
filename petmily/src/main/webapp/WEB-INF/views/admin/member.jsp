<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
	<h1>회원 관리페이지</h1>
	
	<c:forEach var="member" items="${memberList}">
					<h3>${member}</h3>
	</c:forEach>