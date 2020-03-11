<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script> 
<c:set var="context" value="${pageContext.request.contextPath}"></c:set>

	<!-- jquery js -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>

<!-- 
기본 CSS
:	font css
-->
    <!-- font css -->
    <link rel="stylesheet" href="${context}/resources/css/font.css"/>
     
    <!-- list css -->
	<link rel="stylesheet" href="${context}/resources/css/list.css"/>   


<!-- 
HEADER 이용 시 넣어야할 요소 
:	jquery js,
	header css, 
	header script
-->
  <!-- header css -->
  <link rel="stylesheet" href="${context}/resources/css/header.css">
   <!-- header script -->
   <script>
      $(function() {
          $('body').addClass('js');
          $('#masthead').addClass('color');
          
          var $hamburger = $('.hamburger'),
              $nav = $('#site-nav'),
              $masthead = $('#masthead');

          $hamburger.click(function() {
            $(this).toggleClass('is-active');
            $nav.toggleClass('is-active');
            $masthead.toggleClass('is-active');
            return false; 
          })
      });
    </script>
    <!-- header style -->
    <style>
	#masthead:after {
	  content: '';
	  position: absolute;
	  top: 0;
	  width: 100%;
	  height: 130px;
	  background-color: #fff;
	  opacity: 100;
	  transition: opacity 0.3s ease;
	}
	
	#masthead.is-active{
	 background-color: #fff;
	}
	
	.section-content{
		padding-top:165px;
	}
	</style>

<!-- 
FOOTER 이용 시 넣어야할 요소 
:	jquery js,
	footer css, 
	Required meta tags, 
	Bootstrap CSS,
	아이콘을 사용하기 위해 추가로 불러오는 CSS
-->
  	<!-- footer css -->
    <link rel="stylesheet" href="${context}/resources/css/footer.css"/>  
    <!-- Required meta tags -->
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <!-- 아이콘을 사용하기 위해 추가로 불러오는 CSS -->
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css" integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ" crossorigin="anonymous">



<script>
	$(function(){
		$("#add_content").hide();
		
		//펫 추가 버튼 눌렀을 시
		$("#add_btn").click(function(){
			$("#add_div").hide();
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
	
.mylistwrap th{
		width:135px;
		text-align: left;
		}
.mylistwrap td{
	width:400px;
	text-align:left;
	color:gray;
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
      
.mylistwrap {
background-color:#FAFAFA;
padding-left:10%;
padding-top:3%;
} 	
.tab0{
 font-size:15pt;
}
.mylistwrap .tab1{
height:70px;
font-size:9pt;

}
.mylistwrap .tab2{
   padding-left:20%;
   position: relative;
   left: 500px;
   bottom:515px;
   height:200px;
}
.mylistwrap .tab3{
padding-left:20%;
   position: relative;
   left: 500px;
   bottom:500px;
   height:100px;
}
.mylistwrap .tab4{
padding-left:20%;
   position: relative;
   left: 100px;
   bottom:535px;
   height:150px;
}
.mylistwrap .hr1{
padding-left:20%;
   position: relative;
   left: 100px;
   bottom:515px;
   }
.mylistwrap .hr2{
padding-left:20%;
   position: relative;
   left: 100px;
   bottom:505px;
}

.mylistwrap a{

   position: relative;
   left: 550px;
   bottom:660px;
}
.mylistwrap #add_btn{
position: relative;
   left: 1400px;
   bottom:923px;
}
.mylistwrap h2{
padding-left:20%;
   position: relative;
   left: 100px;
   bottom:780px;
}
.mylistwrap h1{
padding-left:20%;
   position: relative;
   left: 100px;
   bottom:485px;
}
.mylistwrap select{
	width:100px;
	padding: .4em .4em;
	border: 1px solid #999;
	font-family : inherit;
	}
	
.box {
    width: 350px;
    height: 350px; 
    }
    .imagecss{
   	  border-radius: 14px;
   }  

.mylistwrap h3{
position:relative;
bottom:750px;
left:800px;
}

.mylistwrap .img2{
  position: relative;
   left: 490px;
   bottom:495px;
}

.mylistwrap .add_content{
position: relative;
left:400px;
}
</style>

    
<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>
<section class="section-content">

	
<div class="mylistwrap" align="left">

<br>
<div class="box" style="background: #BDBDBD;">
<img src="${pageContext.request.contextPath }/member/member/image?member_image_no=${member_image_no}"  style="width: 350px; height: 350px;" onerror="no_image2()" id="2" class="imagecss">
</div>
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
		<th>JoinDate :</th>		
		<td>${mylist.total_joindateWithFormat }</td>
		</tr>
		<tr>
			<th>LastLogin :</th>		
			<td>${mylist.final_loginWithFormat }</td>
	</tr>
</table>


<hr width="700px" align="center" color="#1482e0"  class="hr1">

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
		<tr>
		<th>Pets :</th>
		<td>${mylistpet.size() }마리</td>
	</tr>
	<tr>
		<th>Point :</th>
		<td>${mylist.point}점</td>
	</tr>
</table>

<h2>About</h2>
<h1>Pet</h1>

<hr width="700px" align="center" color="#1482e0" class="hr2">
<div align="left">
<c:if test="${mylist.pets eq '예'}">
	<c:forEach var="pet"  items="${mylistpet }">
	<table class="tab3">
		<tr>	
			<c:choose>
				<c:when test="${pet.pet_image_no<1 }">
						<img src="/petmily/resources/img/기본프로필.jpeg" style="width: 150px; height: 150px;" class="mylistwrap.img2 imagecss">
				</c:when>
				<c:otherwise>
						<img src="${pageContext.request.contextPath }/member/pet/image?pet_no=${pet.pet_no}" style="width: 150px; height: 150px;" class="img2 imagecss">				
				</c:otherwise>
			</c:choose>
			<br>&emsp;
		</tr>	
			
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
	&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;<a href="petchange?pet_no=${pet.pet_no }"><button >수정</button></a>
		<a href="pet_delete?pet_no=${pet.pet_no }"><button >삭제</button></a>
	<br>
	</c:forEach>
	</c:if>
</div>



<br>
<br>
<div id="add_div">
	<button id="add_btn">펫 추가</button>
	<a href="${context}"><button id="add_btn">홈으로</button></a>
	
</div>
<div id="add_content" class="add_content">
<form action="pet_regist" method="post" name="test" enctype="multipart/form-data">
	<input type="hidden" name="member_id" value="${mylist.id }">
	<table class="tab4">
		<tr>
			<th width="50%">Image :</th>
			<td width="50%">
				<input type="file" name="pet_image" multiple accept="image/*" >
			</td>
		</tr>
		<tr>
			<th><p>&emsp;</p>Name :</th>
			<td>
				<p>&emsp;</p><input type="text" name="name" required>
			</td>
		</tr>
		<tr>
			<th><p>&emsp;</p>Age :</th>
			<td>
				<p>&emsp;</p><input type="number" name="age" >
			</td>
		</tr>
		<tr>
			<th><p>&emsp;</p>Type :</th>
			<td>
				<p>&emsp;</p><select name="type" id="select">
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
			<th><p>&emsp;</p>Etc :</th>
			<td>
				<p>&emsp;</p><textarea name="ect"></textarea>
			</td>
		</tr>
		<tr>
		    <th></th>
			<td><br><input type="submit" value="펫추가" id="updatebtn">
				<input type="reset" value="취소" id="cancel">
			</td>
			</tr>
	</table>
</form>
</div>
<br><br><br>

</div>

</section>
<br>
<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>   