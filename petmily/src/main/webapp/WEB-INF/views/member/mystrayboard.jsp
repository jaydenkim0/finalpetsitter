<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="context" value="${pageContext.request.contextPath}"></c:set>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
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
    
    <!-- footer css -->
    <link rel="stylesheet" href="${context}/resources/css/footer.css"/>  
    <!-- Required meta tags -->
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <!-- 아이콘을 사용하기 위해 추가로 불러오는 CSS -->
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css" integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ" crossorigin="anonymous">
<style>


li{
   display: inline-block;
   margin-left: 10px;
    padding: 5px 10px; 
   font-size:15px;
   font-weight: 600;	
   	list-style-type:none;
   	margin-left:20px;	

}
.straytab {
   width: 72%;
   border-top: 1px solid #444444;
   border-collapse: collapse;
   border-color: #BDBDBD;
}




a {
   text-decoration: none;
   color: black;
}

   
 button{
    display: white;
   width: 80px;
   height: 30px;
   line-height: 20px;
   border: 1px #3399dd solid;
   background-color: white;
   text-align: center;
   font-size: 12px;
   cursor: pointer;
   color: #1482e0;
   transition: all 0.9s, color 0.3;
   
}


th, td {
	border-bottom: 1px solid #444444;
	padding: 10px;
	text-align: center;
	border-color : #BDBDBD;
}

a {
	text-decoration: none;
	color: black;
}

.right_mar {
	margin-right: 15%;
}

.page-navigator li {
	display: inline-block;
}

.page-navigator li.active>a {
	color: #1482e0;
	}
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
	padding-top:150px;
	}
}




</style>


<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>
<section class="section-content">



<div align="center">

<Br><br>
<h1>나의 Save the Pets ! </h1>
<Br>
<section>
<table class="straytab" >



	<tr>
		<td>글번호</td>
		<td>제목</td>
		<td>게시일자</td>
	</tr>
	<c:forEach var="strayboard" items="${strayboard_list }">
		<tr>
			<td>${strayboard.stray_no }</td>
			
			<td align="left">
				<c:forEach var="i" begin="1" end="${strayboard.depth}">
					&nbsp;&nbsp;&nbsp;&nbsp;
				</c:forEach> 
				<!-- 답글은 이미지를 추가 --> 
				<c:if test="${strayboard.depth > 0}">
					<img src="${context}/resources/img/reply.png" width="20" height="10">
				</c:if> 
				<font color="#1482e0"> [${strayboard.stray_title}] </font> 
				<a href="${context }/board/stray/view?stray_no=${strayboard.stray_no}"> 
					<!-- 제목 출력 -->
					${strayboard.stray_head}
				</a> 
				<c:if test="${strayboard.replycount > 0}">
					<!-- 댓글수 출력 -->
					<font color="red"> [${strayboard.replycount}] </font>
				</c:if>
			</td>
			
			<td>${strayboard.writedateWithFormat }</td>
			
		</tr>
	</c:forEach>
</table>

		<br>

		<div align="right" class="right_mar">
			<a href="${context}/board/stray/write">
				<button type="button" id="btnwrite" >글쓰기</button>
			</a>
		</div>

<br>

	<!-- 네비게이터(navigator) -->
	<jsp:include page="/WEB-INF/views/member/navigator_mystrayboard.jsp">
		<jsp:param name="pno" value="${pno}"/>
		<jsp:param name="count" value="${count}"/>
		<jsp:param name="navsize" value="${navsize}"/>
		<jsp:param name="pagesize" value="${pagesize}"/>
		<jsp:param name="care_board_no" value="${care_board_no }"/>
	</jsp:include>


</section>

</div>

</section>

	<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>    