<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>  
<script>
$(function(){
	$(function () {
		// 펫시터 거부 버튼 클릭시 발생
		$(".confirm_status").submit(function(e) {
			// 이벤트 정지
			e.preventDefault();				
			// 버튼 속성 및 내용 변경
			$(this).find("#approval_btn").prop("disabled", true);
			$(this).find("#approval_btn").text("승인 이메일 발송중");
		
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
							alert("승인 이메일 발송 완료");
							location.reload();
						}
						else{
							alert("승인 이메일 발송 실패");								
							$("#approval_btn").prop("disabled", false);
							$("#approval_btn").text("승인 이메일 전송 실패");
						}
					}
				});
				
				$(this).find("#refusal_btn").prop("disabled", true);
				$(this).find("#refusal_btn").text("거절 이메일 발송중");
			
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
								alert("거절 이메일 발송 완료");
								location.reload();
							}
							else{
								alert("거절 이메일 발송 실패");								
								$("#refusal_btn").prop("disabled", false);
								$("#refusal_btn").text("거절 이메일 전송 실패");
							}
						}
					});
			});						
		});
});
</script>
<h1>펫시터 견적확인 페이지</h1>
<form class="confirm_status" action="confirm" method="post">
<c:forEach var="rlist" items="${reservationList}">
	<span>예약 번호 : ${rlist.reservation_no}</span><br>
	<span>예약 회원 : ${rlist.member_id}</span><br>
	<span>예약 날짜 : ${rlist.matching_time}</span><br>
	<c:forEach var="skill" items="${rlist.list}">
	<span>예약 스킬 : ${skill.payname}</span><br>
	<span>이용 시간 : ${skill.usage_time}시간</span><br>
	</c:forEach>
	
	<img src="${pageContext.request.contextPath}/petsitter/pet/image?pet_no=${list.pet_no}" style="width: 20%; height: auto;" onerror="no_image()" id="pet_image">
	<br><span>반려동물 이름 : ${rlist.pet_name}</span><br>
	<span>반려동물 나이 : ${rlist.age}살</span><br>
	<span>반려동물 종류 : ${rlist.type}</span><br>
	<span>반려동물 특이사항 : ${rlist.pet_ect}</span><br><br>
</c:forEach>

<span>예약 총 금액 :${payMent}</span><br><br>

<button id="approval_btn">승인</button>
<button id="refusal_btn">거절</button>
</form>


