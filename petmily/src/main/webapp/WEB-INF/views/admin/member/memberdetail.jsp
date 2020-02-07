<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
	<h3> 회원 정보 </h3>
	
	<a href="${pageContext.request.contextPath}/admin/member"><button>멤버 페이지로 이동</button></a>
	
	<h3>	회원	</h3>		
	${member}
	
	
	<H3></H3>
	${pets}