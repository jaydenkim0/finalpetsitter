<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script>
	$(function(){
		
		$("#user_id").blur(function(){
			var user_id = $("#user_id").val();
			
			$.ajax({
				url:'${pageContext.request.contextPath}/board/care/idCheck?userId='+user_id,
				type:'get',
				success:function(data){
					if(data==0){
						$(".id_check").text("존재하지 않는 펫시터입니다");
						$('.id_check').css('color','red');
						$("#submit").attr("disabled",true);
					}else{
						$(".id_check").text("");
						$("#submit").attr("disabled",false);
					}
				}
			});
		});
	});
	
	function prevent(){
	    var tag = document.querySelector(".password");
	    var text = tag.value;
	    var len = text.length;
	    if(len > 4){
	        text = text.substring(0, 4);
	        tag.value = text;
	    }
	}
</script>

</head>

<body>
<h1>돌봄방 생성</h1>
<table border="1">
	<form action="write" method="post">
		<tr>
			<th>작성자 아이디</th>
			<td><input type="text" readonly value=${id } name="care_member_id"></td>
		</tr>
		<tr>
			<th>펫시터 아이디</th>
			<td>
				<input type="text" name="care_sitter_id" class="sitter_id_check" id="user_id" list="depList" oninput="checkId()">
				<datalist id="depList">
					<c:forEach var="data" items="${list }">
						<option value="${data }">${data }</option>
					</c:forEach>
				</datalist>
				<div class="id_check"></div>
			</td>
		</tr>
		<tr>
			<th>방 제목</th>
			<td><input type="text" name="care_board_content"></td>
		</tr>
		<tr>
			<th>방 비밀번호</th>
			<td><input class="password" oninput="prevent();" type="number" name="care_pw" placeholder="4자리 숫자"></td>
		</tr>
		<tr>
			<th colspan="2">
				<input type="submit" value="생성" id="submit">
			</th>
		</tr>
	</form>
</table>
</body>

