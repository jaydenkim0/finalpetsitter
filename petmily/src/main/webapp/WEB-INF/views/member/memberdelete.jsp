<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

	<!-- 프론트엔드 암호화 불러오기 -->
	<script src="${pageContext.request.contextPath}/resources/js/secom.js"></script>
    
    
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
		<form action="memberdelete" class="secure-form"  method="post"> 
			<table align="center">
				<tr>
					<td align="center">비밀번호 입력</td>
				</tr>
				<tr>
					<td align="center">
							<input type="hidden" name="id" value="${id }">
							<input type="password" required name="password">
					</td>
				</tr>
				<tr>
					<td align="center">
						<input type="submit" value="제출">
					</td>
				</tr>
			</table>
		</form>
	</div>
</div>

</body>