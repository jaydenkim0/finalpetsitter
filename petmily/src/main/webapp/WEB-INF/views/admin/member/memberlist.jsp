<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
	<h3>회원 리스트</h3>
	
	<c:forEach var="List" items="${list}">
		<h3>${List}</h3>	
	</c:forEach>
	<h3>count : ${count}</h3>	
	<h3>searchPtion : ${searchPtion }</h3>
	<h3>keyword : ${keyword}</h3>
	<h3>navi : ${navi}</h3>