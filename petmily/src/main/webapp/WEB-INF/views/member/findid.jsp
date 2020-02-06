<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<h1>findid.jsp</h1>

<form action="findid" method="post">
	이름 : <input type="text" name="name" required>
	이메일 : <input type="email" name="email" required>
	전화번호 : <input type="tel" name="phone" required>
	<input type="submit" value="아이디 찾기">
</form>