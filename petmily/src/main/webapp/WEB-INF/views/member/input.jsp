<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>





	  <script>
    	$(function () {
    		// 펫시터 거부 버튼 클릭시 발생
			$(".emailsend").submit(function(e) {
				// 이벤트 정지
				e.preventDefault();				
				// 버튼 속성 및 내용 변경
				$("#pwchange").prop("disabled", true);
				$("#pwchange").text("이메일 발송중");				
				
				var url = $(this).attr("action"); 
				var method = $(this).attr("method");
				var data = $(this).serialize();
				
					$.ajax({
						url:url,
						type:"post",
						data:data,
						success:function(resp){
							console.log(resp);
							if(resp == "success"){
								alert("이메일 발송 완료");								
								location.href = '${pageContext.request.contextPath}/member/result';
							}
							else{
								alert("아이디 및 이메일을 확인바랍니다");								
								$("#pwchange").prop("disabled", false);
								$("#pwchange").text("이메일 보내기");
								location.href = '${pageContext.request.contextPath}/member/input?error';
							}
						}
					});
				});						
			});	
    </script>

<div align="center">

<br><br>
<h1>비밀번호 변경</h1>
<br>

<form class="emailsend"  action="input" method="post">
	<input type="text" name="id" placeholder="아이디 입력" required><br><br>
	<input type="email" name="email" placeholder="이메일 입력" required><br><br>
	<input id="pwchange" type="submit" value="이메일 보내기">
</form>

	<c:if test="${param.error != null}">
		입력하신 아이디 및 이메일로 가입된 내역이 없습니다<br>
		다시한번 확인해주세요
	</c:if>
</div>