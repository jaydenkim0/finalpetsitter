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
<script>
$(function(){
	
});
</script>
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
	padding-top:250px;
	padding-bottom:100px;
		
	}
	th{
	width:6%;	
	}
	td{
	width:40%;
	}


</style>


<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>
<section class="section-content">

<div align="center">

	<table border="1" >
		<tr>
			<th>리뷰 번호</th>
			<td>${review.review_no }</td>
		</tr>
		<tr>
			<th rowspan="2">펫시터</th>
			<td>
				<img src = "petmily/board/care/member/image?member_image_member_id=${review.sitter_id }" style="max-width: 15%; height: auto;"onerror="this.onerror=null; this.src='/petmily/resources/img/기본프로필.jpeg';">
			</td>
		</tr>
		<tr>
			<td>${review.sitter_id }</td>
		</tr>
		<tr>
			<th>제목</th>
			<td>${review.review_title }</td>
		</tr>
		<tr>
			<th>별점</th>
			<td>
				<c:choose>
					<c:when test="${review.review_star==3 }">
						<img src="/petmily/resources/img/3.png" style="width: auto; height: 20px;">
					</c:when>
					<c:when test="${review.review_star==2 }">
						<img src="/petmily/resources/img/2.png" style="width: auto; height: 20px;">
					</c:when>
					<c:otherwise>
						<img src="/petmily/resources/img/1.png" style="width: auto; height: 20px;">
					</c:otherwise>
				</c:choose>
			</td>
		</tr>
		<tr>
			<th>작성일자</th>
			<td>${review.writedateWithFormat }</td>
		</tr>
		<tr>
			<th>내용</th>
			<td>${review.review_content }</td>
		</tr>
	</table>

</div>

</section>

	<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>    