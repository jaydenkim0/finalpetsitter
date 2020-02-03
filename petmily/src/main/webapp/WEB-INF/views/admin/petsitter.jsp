<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
	<h1>펫시터 관리페이지</h1>
	
	<br><br>
	
	<h2> 펫시터 리스트 </h2>
	
	<c:forEach var="petsitter" items="${petsitterList}">
					<h3>${pesitter}</h3>
	</c:forEach>
	
	
	<br><br>
	
	<h2> 페시터 신청 회원 </h2>
	
	
	