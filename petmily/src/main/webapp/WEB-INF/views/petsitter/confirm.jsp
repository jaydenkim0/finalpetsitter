<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  

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
								alert("이베일 발송 완료");
								location.reload();
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
							alert("이베일 발송 완료");
							location.reload();
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


<h1>펫시터 견적확인 페이지</h1>
			<span>예약 번호 : ${reservationList.reservation_no}</span><br>
			<span>예약 회원 : ${reservationList.member_id}</span><br>
			<span>예약 날짜 : ${reservationList.matching_time}</span><br>
			<span>이용 시간 : ${usageTime}시간</span><br>
			<span>시작 시간 : ${startTime}시</span><br>
			
			<c:forEach var="skill" items="${reservationList.list}">
				<span>예약 스킬 : ${skill.payname}</span><br>
			</c:forEach>
			
			<img src="${pageContext.request.contextPath}/petsitter/pet/image?pet_no=${reservationList.pet_no}" style="width: 20%; height: auto;" onerror="no_image()" id="pet_image">
			<br><span>반려동물 이름 : ${reservationList.pet_name}</span><br>
			<span>반려동물 나이 : ${reservationList.age}살</span><br>
			<span>반려동물 종류 : ${reservationList.type}</span><br>
			<span>반려동물 특이사항 : ${reservationList.pet_ect}</span><br><br>
			
			<!-- 승인시 -->
			<form class="confirm_apply" action="confirm" method="post">
					<input type="hidden" name="id" value="${reservationList.member_id}">
					<input type="hidden" name="sitter_no" value="${reservationListt.reservation_sitter_no}">
					<input type="hidden" name="check" value="승인">
					<input type="hidden" name="reservation_no" value="${reservationList.reservation_no}">
					<button id="approval_btn">승인</button>
			</form>
			<!-- 거절 -->
			<form class="confirm_refusal" action="confirm" method="post">
			<input type="hidden" name="id" value="${reservationList.member_id}">
					<input type="hidden" name="sitter_no" value="${reservationList.reservation_sitter_no}">
					<input type="hidden" name="check" value="거절">	
					<input type="hidden" name="reservation_no" value="${reservationList.reservation_no}">	
					<button type="button" id="refusal_btn">거절사유작성</button>
					<!-- 숨겨진 페이지 -->					
								<div class="modalfade">			                    							  
					                <label>거절 사유를 간단하게 작성해주세요</label>
					                <input type="text" name="content"  required>
					                <br/>
					                <input type="submit" id="sendEmail"  value="거절">		            
					            </div>
			</form>
		
		<span>예약 이용 시간 : ${usageTime}시간</span><br>
		<span>예약 총 금액 :${payMent}원</span><br><br>

