<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
	<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
 	<c:set var="context" value="${pageContext.request.contextPath}"></c:set>
 	
<!-- 
기본 CSS
:	font css
	confirm css
-->
    <!-- font css -->
    <link rel="stylesheet" href="${context}/resources/css/font.css"/>
    <!-- confirm css -->
    <link rel="stylesheet" href="${context}/resources/css/confirm.css"/>   	
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

    <script>    
   	    $(document).ready(function () {
	    	$(".modalfade").hide();	            
	        $("#refusal_btn").click(function () {						         
	        	$(this).next().fadeToggle();
	        });				
		        
    	$(function () {    		
    		// 펫시터 승인 버튼 클릭시 발생
			$(".confirm_apply").submit(function(e) {
				// 이벤트 정지
				e.preventDefault();				
				// 버튼 속성 및 내용 변경
				$(this).find("#approval_btn").prop("disabled", true);
				$(this).find("#approval_btn").text("승인 진행중");
			
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
								location.href = '${pageContext.request.contextPath}/';
							}
							else{
								alert("이메일 발송 실패");								
								$("#approval_btn").prop("disabled", false);
								$("#approval_btn").text("승인");
							}
						}
					});
				});						
			});

		// 펫시터 거절 버튼 클릭시 발생
		$(".confirm_refusal").submit(function(e) {
			// 이벤트 정지
			e.preventDefault();				
			// 버튼 속성 및 내용 변경
			$(this).find("#refusal_btn").prop("disabled", true);
			$(this).find("#refusal_btn").text("거절 진행중");
			$(this).find("#sendEmail").prop("disabled", true);
			$(this).find("#sendEmail").text("거절 진행중");
		
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
							location.href = '${pageContext.request.contextPath}/';
						}
						else{
							alert("이메일 발송 실패");								
							$("#refusal_btn").prop("disabled", false);
							$("#refusal_btn").text("거절 사유작성");
							$(this).find("#sendEmail").prop("disabled", false);
							$(this).find("#sendEmail").text("거절");
						}
					}
				});
			});	
		});	
    </script>

<!-- header 불러오기 -->
	<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>
	
<section class="section-content">
	<div class="confirm-wrap" align="center">
			<div id="align-left">
				<h1>펫시터 견적확인 페이지</h1>
					<div id="step1">
						<img src="${context}/resources/img/estimate_step2.png" alt="step1">
					</div>
					
					<br><br>
					<span id="large-text">예약 번호</span><br>
					<hr>
					<span>${reservationList.reservation_no}</span>

					<br><br>
					<span id="large-text">예약 회원</span><br>
					<hr>
					<span id="large-text">${reservationList.member_id}</span>

					<br><br>
					<span id="large-text">예약 날짜</span><br>
					<hr>
					<span>${reservationList.getTotalMatchingTimeWithFormat()}</span>

					<br><br>
					<span id="large-text">시작 시간 ~ 마지막 시간</span><br>
					<hr>
					<span>${startTime}시 ~ ${lastTime} 시까지</span>
					
					<br><br>
					<span id="large-text">예약 이용 시간</span><br> 
					<hr>
					<span>${usageTime} 시간</span>					
										
					<br><br>
					<span id="large-text">신청내용</span><br> 
					<hr>
					<span>${reservationList.ect}</span>
					
					
					
					<br><br>
					<span id="large-text">견적 승인 펫시터</span><br>
					<hr>
					<span id="large-text">${sitter_id}</span>
				
					<br><br>
					<br><br>
					<span id="large-text">예약 스킬</span><br> 
					<hr>	
						
					<c:forEach var="skill" items="${payinfo}">
						<span>${skill.payname}</span><br>
					</c:forEach>
					
					<br><br>
					<c:forEach var="pets"  items="${petinfo}"  varStatus="status">
					<hr>
					<br><br>
					<span id="large-text"> 반려동물  ${status.count} </span>
					<br><br>
						<img src="${pageContext.request.contextPath}/petsitter/pet/image?pet_no=${pets.pet_no}" style="width: 20%; height: auto;" onerror="no_image()" id="pet_image">
					<br>

						<span id="large-text">예약한 반려동물 이름</span><br> 
						<hr>
						<span>${pets.name}</span>
						
						<br><br>
						<span id="large-text">예약한 반려동물 나이</span><br> 
						<hr>
						<span>${pets.age}살</span>
	
						<br><br>
						<span id="large-text">예약한 반려동물 종류</span><br> 
						<hr>
						<span>${pets.type}</span>
						
						<br><br>
						<span id="large-text">예약한 반려동물 특이사항</span><br> 
						<hr>
						<span>${pets.ect}</span>
						<br><br>				
					</c:forEach>
					


					<br><br>
					<hr>
					<div align="right">
						<span id="extra-large-text">	총 
						<fmt:formatNumber type="number" maxFractionDigits="3" value="${payMent}"/>
						 원 </span><br> 
					</div>
			</div>
			
				<br><br>
				<div align="center">
				<!-- 승인시 -->
				<form class="confirm_apply" action="confirm" method="post">
						<input type="hidden" name="id" value="${reservationList.member_id}">
						<input type="hidden" name="sitter_no" value="${reservationList.reservation_sitter_no}">
						<input type="hidden" name="check" value="승인">
						<input type="hidden" name="reservation_no" value="${reservationList.reservation_no}">
						<button id="approval_btn">승인</button>
				</form>
				<!-- 거절 -->
				<form class="confirm_refusal" action="confirm" method="post">
					<input type="submit" id="sendEmail"  value="거절">							
						<input type="hidden" name="id" value="${reservationList.member_id}">
						<input type="hidden" name="sitter_no" value="${reservationList.reservation_sitter_no}">
						<input type="hidden" name="check" value="거절">	
						<input type="hidden" name="reservation_no" value="${reservationList.reservation_no}">	
						
						<br>
	
						<!-- 숨겨진 페이지 -->					
						<button type="button" id="refusal_btn">거절 사유 작성</button>
						<div class="modalfade">			                    							  
							<input id="refusal_text" type="text" name="content" placeholder="  거절 사유" required>
						</div>
				</form>
			</div>
	</div>
</section>

	<br><br>
	<!-- footer 불러오기 -->
	<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>
