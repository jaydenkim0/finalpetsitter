<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core" %>
<h1>mylist.jsp</h1>
<c:forEach var="mylist" items="${mylist}">
	<h1>아이디 : ${mylist.id }</h1><br>
	<h3>이름 : ${mylist.name }</h3>
	<h3>닉네임 : ${mylist.nick }</h3>
	<h3>전화번호 : ${mylist.phone }</h3>
	<h3>우편번호 : ${mylist.post }</h3>
	<h3>기본주소 : ${mylist.basic_addr }</h3>
	<h3>상세주소 : ${mylist.extra_addr }</h3>
	<h3>포인트 : ${mylist.point }</h3>
	<h3>반려동물여부 : ${mylist.pets }</h3>
	<h3>가입일 : ${mylist.joindate }</h3>
	<h3>최종로그인 : ${mylist.lastlogin }</h3>
</c:forEach>