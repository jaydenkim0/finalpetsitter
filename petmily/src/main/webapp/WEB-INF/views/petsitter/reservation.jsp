<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<!-- 
기본 CSS
:	font css
-->
    <!-- font css -->
    <link rel="stylesheet" href="${context}/resources/css/font.css"/>

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
	padding-top:150px;
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


<!-- header 불러오기 -->
	<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>
	
<section class="section-content">   
	<h1>펫시터 예약 조회</h1>
		<c:forEach var="rlist" items="${reservationList}">
				<span>예약 번호 : ${rlist.reservation_no}</span><br>
				<span>예약 회원 : ${rlist.member_id}</span><br>
				<span>예약 날짜 : ${rlist.matching_time}</span><br>
				<span>예약 이용 시간 : ${usageTime}시간</span><br>
				<span>시작 시간 : ${startTime}시</span><br>
				
				<c:forEach var="skill" items="${rlist.list}">
					<span>예약 스킬 : ${skill.payname}</span><br>
				</c:forEach>
				
				
				
				<img src="${pageContext.request.contextPath}/petsitter/pet/image?pet_no=${rlist.pet_no}" style="width: 20%; height: auto;" onerror="no_image()" id="pet_image">
				<br><span>반려동물 이름 : ${rlist.pet_name}</span><br>
				<span>반려동물 나이 : ${rlist.age}살</span><br>
				<span>반려동물 종류 : ${rlist.type}</span><br>
				<span>반려동물 특이사항 : ${rlist.pet_ect}</span><br>
		
			<c:forEach var="pay" items="${payList}">
				<span>결제 상태 : ${pay.status}</span>
				<span>총 ${pay.total_amount}원</span>
			</c:forEach>
	
				<hr>			
		</c:forEach>	
</section>

	<br><!-- footer 불러오기 -->
	<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>    
	
	
		
		
		
