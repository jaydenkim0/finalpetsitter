<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div align="center">
<br><br>
<c:choose>
    <c:when test="${not empty id}">
		<h2>회원님의 아이디는 ${id} 입니다</h2>
		<br>
		<a href="login">
			<input type="button" value="로그인">
		</a>
		&emsp;
		<a href="/petmily/">
			<button>홈</button>
		</a>
    </c:when>
    <c:otherwise>
		<h2>입력하신 정보에 해당하는 회원이 없습니다</h2>
		<br>
		<a href="findid">
			<input type="button" value="아이디찾기">
		</a>
		&emsp;
		<a href="/petmily/">
			<button>홈</button>
		</a>
    </c:otherwise>
</c:choose>
</div>