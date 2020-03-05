<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core" %>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="context" value="${pageContext.request.contextPath}"></c:set>

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
		width:135px;
		text-align: left;
		}
	td{
	width:400px;
	text-align:left;
	color:gray;
	font-size:12pt;
	font-weight:bold;
	}

  button, #updatebtn,#cancel{
   display: white;
   width: 70px;
   height: 30px;
   line-height: 20px;
   border: 1px #3399dd solid;
   background-color: white;
   text-align: center;
   font-size: 12px;
   cursor: pointer;
   color: #1482e0;
   transition: all 0.9s, color 0.3;
   border-radius:10px;
   }

   .button:hover{
	color: white;
	}
	
	.hover:hover{
	background-color: #1482e0;
	}
      
body{
background-color:#FAFAFA;
padding-left:10%;
padding-top:3%;
} 	
.tab0{
 font-size:15pt;
}
.tab1{
height:150px;

}
.tab2{
   padding-left:20%;
   position: relative;
   left: 100px;
   bottom:580px;
   height:150px;
}
.tab3{
padding-left:20%;
   position: relative;
   left: 100px;
   bottom:550px;
   height:170px;
}
.tab4{
padding-left:20%;
   position: relative;
   left: 100px;
   bottom:600px;
   height:150px;
}
.hr1{
padding-left:20%;
   position: relative;
   left: 100px;
   bottom:580px;
   }
.hr2{
padding-left:20%;
   position: relative;
   left: 100px;
   bottom:570px;
}
.img2{
padding-left:20%;
   position: relative;
   left: 100px;
   bottom:560px;
}
a{

   position: relative;
   left: 550px;
   bottom:800px;
}
#add_btn{
position: relative;
   left: 510px;
   bottom:965px;
}
h2{
padding-left:20%;
   position: relative;
   left: 100px;
   bottom:800px;
}
h1{
padding-left:20%;
   position: relative;
   left: 100px;
   bottom:550px;
}
</style>
<body>
<div align="left">

<br>
<img src="${pageContext.request.contextPath }/member/member/image?member_image_no=${member_image_no}"  style="width: 350px; height: 350px;" onerror="no_image2()" id="2">
<br><br>
<table class="tab0">
	<tr>
		<th>${mylist.nick }</th>
		<td>${mylist.id }</td>
	</tr>
</table>
<hr width="350px" align="left" style="border: solid #dedede; border-width: 1px 0 0;">
<!-- 정보수정 -->
<form action="mylistchange" method="get">
	<input type="hidden" name="id" value="${mylist.id}">
<input type="submit" value="수정" id="updatebtn" >
</form>

<!-- 	<tr> -->
<!-- 		<th>아이디&emsp;</th> -->
<%-- 		<td >${mylist.id }</td> --%>
<!-- 	</tr> -->
<!-- 	<tr> -->
<!-- 		<th>이름&emsp;</th> -->
<%-- 		<td>${mylist.name }</td> --%>
<!-- 	</tr> -->
<table class="tab1">
	<tr>
		<th>Point :</th>
		<td>${mylist.point }</td>
	</tr>
	<tr>
		<th>JoinDate :</th>		
		<td>${mylist.total_joindateWithFormat }</td>
		</tr>
		<tr>
			<th>LastLogin :</th>		
			<td>${mylist.final_loginWithFormat }</td>
	</tr>
	<tr>
		<th>Pets :</th>
		<td>${mylistpet.size() }마리</td>
	</tr>
</table>


<hr width="700px" align="center" color="#1482e0" class="hr1">

<table class="tab2">

        <tr>
		<th>Phone  :</th>
		<td>${mylist.phoneWithFormat }</td>
		</tr>
		<tr>
		<th>Address :</th>		
		<td>${mylist.total_addr }</td>	
		</tr>
		<tr>
		<th>Email :</th>
		<td>${mylist.email }</td>
		</tr>
</table>

<h2>About</h2>
<h1>Pets</h1>

<hr width="700px" align="center" color="#1482e0" class="hr2">
<div align="left">
<c:if test="${mylist.pets eq '예'}">
	<c:forEach var="pet"  items="${mylistpet }">
	
	
	<c:choose>
					<c:when test="${pet.pet_image_no<1 }">
						<img src="/petmily/resources/img/기본프로필.jpeg" style="width: 90px; height: 90px;" class="img2">
					</c:when>
					<c:otherwise>
						<img src="${pageContext.request.contextPath }/member/pet/image?pet_no=${pet.pet_no}" style="width: 90px; height: 90px;" class="img2">			
					</c:otherwise>
				</c:choose>		
			<table class="tab3">
			
		<tr>
			<th width="50%">Name :&emsp;</th>
			<td width="50%">${pet.name }</td>
		</tr>
		<tr>
			<th>Age :&emsp;</th>
			<td>${pet.age } 살</td>
		</tr>
		<tr>
			<th>Type :&emsp;</th>
			<td>${pet.type }</td>
		</tr>
		<tr>
			<th>Etc :&emsp;</th>
			<td>${pet.ect }</td>
		</tr>
	</table>
	<br>
	<a href="petchange?pet_no=${pet.pet_no }"><button >수정</button></a>
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
	<table class="tab4">
		<tr>
			<th width="50%">이미지&emsp;</th>
			<td width="50%">
				<input type="file" name="pet_image" multiple accept="image/*">
			</td>
		</tr>
		<tr>
			<th>이름</th>
			<td>
				<input type="text" name="name" required>
			</td>
		</tr>
		<tr>
			<th>나이</th>
			<td>
				<input type="number" name="age" >
			</td>
		</tr>
		<tr>
			<th>동물종</th>
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
			<th>소개</th>
			<td>
				<textarea name="ect"></textarea>
			</td>
		</tr>
		<tr>
		    <th>
				<input type="submit" value="펫추가" id="updatebtn"><br>
				<input type="reset" value="취소" id="cancel">
			</th>
			</tr>
	</table>
</form>
</div>
<br><br><br>

</div>
</body>