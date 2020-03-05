<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core" %>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script>
	$(function(){
		$("#add_content").hide();
		
		//펫 추가 버튼 눌렀을 시
		$("#add_btn").click(function(){
			$(this).hide();
			$("#add_content").show();
		});
		
		//취소 버튼 눌렀을 시
		$("#cancel").click(function(){
			$("#add_content").hide();
			$("#add_btn").show();
		});
	});
</script>
<script>
function no_image2(){
	$("#2").attr("src", "/petmily/resources/img/기본프로필.jpeg");
}
</script>
<style>
	th{
		width:100px;
		text-align: left;
		
		
	}
	

	img {
    border-radius: 75px; 
	
	}
	td{
	width:200px;
	text-align:left;
	}


  button, #updatebtn,#cancel{
   display: white;
   width: 100px;
   height: 40px;
   line-height: 20px;
   border: 1px #3399dd solid;
   background-color: white;
   text-align: center;
   font-size: 12px;
   cursor: pointer;
   color: #1482e0;
   transition: all 0.9s, color 0.3;
   
   }
   
   .button:hover{
	color: white;
	}

	
	.hover:hover{
	background-color: #1482e0;
	}
   
   

  
   
   }
body{
background-color:#FAFAFA;
}   

	
</style>
<body>
<div align="center">

<h1>${mylist.name }님의 PETMILY 기본정보</h1>
<br>
<img src="${pageContext.request.contextPath }/member/member/image?member_image_no=${member_image_no}"  style="width: 150px; height: 150px;" onerror="no_image2()" id="2">
<br><br><br>
<table >
	<tr>
		<th>아이디&emsp;</th><td >${mylist.id }</td><th>이름&emsp;</th><td>${mylist.name }<br></td>
		
	</tr>
	
	<tr>
		<th>닉네임&emsp;</th><td>${mylist.nick }</td><th>휴대폰번호&emsp;</th><td>${mylist.phoneWithFormat }</td>
			</tr>
	
	<tr>
		<th>주소&emsp;</th>		<td>${mylist.total_addr }</td>	<th>포인트&emsp;</th>		<td>${mylist.point }점</td>
	</tr>
	<tr>
		<th>가입일&emsp;</th>		<td>${mylist.total_joindateWithFormat }</td>	<th>최종로그인&emsp;</th>		<td>${mylist.final_loginWithFormat }</td>
	</tr>
	<tr>
		<th>반려동물&emsp;</th>
		<td>${mylistpet.size() }마리</td>
	</tr>
</table>

<br>
<!-- 정보수정 -->
<form action="mylistchange" method="get">
	<input type="hidden" name="id" value="${mylist.id}">
<input type="submit" value="정보수정" id="updatebtn" >
</form>


    <h3>반려동물 정보</h3>
<div align="center">
<c:if test="${mylist.pets eq '예'}">
	<c:forEach var="pet"  items="${mylistpet }">
	
	
	<c:choose>
					<c:when test="${pet.pet_image_no<1 }">
						<img src="/petmily/resources/img/기본프로필.jpeg" style="width: 20%; height: auto;">
					</c:when>
					<c:otherwise>
						<img src="${pageContext.request.contextPath }/member/pet/image?pet_no=${pet.pet_no}" style="width: 100px; height: 100px;" >			
					</c:otherwise>
				</c:choose>		
			<table>
			
		<tr>
			<th width="50%">이름&emsp;</th>
			<td width="50%">${pet.name }</td>
		</tr>
		<tr>
			<th>나이&emsp;</th>
			<td>${pet.age }</td>
		</tr>
		<tr>
			<th>동물종&emsp;</th>
			<td>${pet.type }</td>
		</tr>
		<tr>
			<th>소개&emsp;</th>
			<td>${pet.ect }</td>
		</tr>
	</table>
	<br>
	<a href="petchange?pet_no=${pet.pet_no }"><button >펫 정보수정</button></a>
		<a href="pet_delete?pet_no=${pet.pet_no }"><button >삭제</button></a>
	<br>
	</c:forEach>
	</c:if>
</div>



<br>
<br>
<button id="add_btn">펫 추가</button>
<div id="add_content">
<form action="pet_regist" method="post" name="test" enctype="multipart/form-data">
	<input type="hidden" name="member_id" value="${mylist.id }">
	<table>
		<tr>
			<th width="50%">이미지&emsp;</th>
			<td width="50%">
				<input type="file" name="pet_image" multiple accept="image/*">
			</td>
		</tr>
		<tr>
			<th>이름&emsp;</th>
			<td>
				<input type="text" name="name" required>
			</td>
		</tr>
		<tr>
			<th>나이&emsp;</th>
			<td>
				<input type="number" name="age" >
			</td>
		</tr>
		<tr>
			<th>동물종&emsp;</th>
			<td>
				<select name="type" id="select">
			 		<option value="강아지">강아지</option>			 		
			 		<option value="고양이">고양이</option>
			 		<option value="물고기">물고기</option>			 		
			 		<option value="토끼">토끼</option>
			 		<option value="햄스터">햄스터</option>			 		
			 		<option value="파충류">파충류</option>
			 	</select>
			</td>
		</tr>
		<tr>
			<th>소개&emsp;</th>
			<td>
				<textarea name="ect"></textarea>
			</td>
		</tr>
	</table>
				<input type="submit" value="펫추가" id="updatebtn">
				<input type="reset" value="취소" id="cancel">
</form>
</div>
<br><br><br>

</div>
</body>