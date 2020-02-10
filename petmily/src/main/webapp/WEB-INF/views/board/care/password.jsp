<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<head>

<style>
  .modal{
  	position: fixed;
  	top:0;
  	left:0;
  	right:0;
  	bottom:0;
	background-color: black;
  }
  
  .modal > .modal-view{
  	position: fixed;
  	width: 300px;
  	height:100px;
  	background-color: white;
  	
  	top: 50%;
  	left: 50%;
  	margin-left: -150px;
  	margin-top:-50px;
  }
</style>

</head>


<body>

<!-- 비밀번호 검사 모달창 -->
<div class="modal">
	<div class="modal-view">
		<form action="password" method="post"> 
			<table class="mom" align="center">
				<tr>
					<td align="center">돌봄 방 ${care_board_no } 비밀번호 입력</td>
				</tr>
				<tr>
					<td align="center">
							<input type="hidden" name="care_board_no" value="${care_board_no }">
							<input type="password" required name="care_pw">
					</td>
				</tr>
				<tr>
					<td align="center">
						<input type="submit" value="입력">
					</td>
				</tr>
			</table>
		</form>
	</div>
</div>

</body>