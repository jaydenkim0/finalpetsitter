<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core" %>
<h1>mylist.jsp</h1>
<h1>아이디 : ${mylist.id }</h1><br>
<a></a>
<h3>이름 : ${mylist.name }</h3>
<h3>닉네임 : ${mylist.nick }</h3>
<h3>전화번호 : ${mylist.phone }</h3>
<h3>우편번호 : ${mylist.post }</h3>
<h3>기본주소 : ${mylist.basic_addr }</h3>
<h3>상세주소 : ${mylist.extra_addr }</h3>
<h3>포인트 : ${mylist.point }점</h3>
<h3>반려동물 : ${mylistpet.size() }마리</h3>
<c:if test="${mylist.pets eq '예'}">
	<c:forEach var="pet"  items="${mylistpet }">
----------------------------------------------------
		<h3>이름 : ${pet.name }</h3>
		<h3>나이 : ${pet.age }</h3>
		<h3>동물종 : ${pet.type }</h3>
		<h3>${pet.ect }</h3>
----------------------------------------------------	
	</c:forEach>
</c:if>
<h3>가입일 : ${mylist.joindate }</h3>
<h3>최종로그인 : ${mylist.lastlogin }</h3>

<!-- 정보수정 -->
<form action="mylistchange" method="get">
	<input type="hidden" name="id" value="${mylist.id}">
	<input type="submit" value="정보수정">
</form>
