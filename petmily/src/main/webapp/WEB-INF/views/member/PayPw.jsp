<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- 새로운 형태로 디자인 -->
<article class="w-40">
	<div class="row">
		<h2>결제 비밀번호 확인</h2>
	

	</div>
	<div class="row">
		<input class="block-item input-item" type="password" name="pw" placeholder="Password" required>
	</div>
	<div class="row-right">
		<input class="btn" type="submit" value="Login">
	</div>
	<%if(request.getParameter("error") != null){ %>
	<div class="row">
		<!-- error라는 이름의 파라미터가 있다면 오류 메시지를 출력 -->
		<h5><font color="red">입력하신 정보가 일치하지 않습니다</font></h5>
	</div>
	<%} %>	
</article>

</form>