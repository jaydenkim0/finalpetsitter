<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<h1>펫시터 정보 조회</h1>
<c:forEach var="petsitterVO" items="${list}">
<div>
<h5>${petsitterVO.pet_sitter_no}</h5>
<a href="info?pet_sitter_no=${petsitterVO.pet_sitter_no}"><span>닉네임 : ${petsitterVO.nick}</span></a><br>
	<span>소개글 : ${petsitterVO.info}</span><br><br>
</div>
</c:forEach>
