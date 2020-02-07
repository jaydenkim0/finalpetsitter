<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<h1>돌봄 방 ${care_board_no }</h1><br>
<a href="contentchange?care_board_no=${care_board_no }"><button>방 수정</button></a><br><br>
<table border="1" width="100%">
	<tr>
		<th>방번호</th>
		<td>${list.care_board_no }</td>
	</tr>
	<tr>
		<th>생성자</th>
		<td>${list.care_member_id }</td>
	</tr>
	<tr>
		<th>펫시터</th>
		<td>${sitter_id }</td>
	</tr>
	<tr>
		<th>방 제목</th>
		<td>${list.care_board_content }</td>
	</tr>
	<tr>
		<th>생성일</th>
		<td>${list.wdate.substring(0,16) }</td>
	</tr>
</table>
