<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	
	
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	
    <script>
    	$(function () {
    		// 펫시터 거부 버튼 클릭시 발생
			$(".petnegative").submit(function(e) {
				// 이벤트 정지
				e.preventDefault();				
				// 버튼 속성 및 내용 변경
				$(this).find("#nega-btn").prop("disabled", true);
				$(this).find("#nega-btn").text("이메일 발송중");
				
				 // 비동기 통신으 이용하요 작성한 데이터 댓글을 수정 페이지로 전달
                //  [1] 보내는 주소를 어떻게 구할 것인가?
                // - form에 작성된 action을 불러올 수 있는가?
                // - form에 작성된 method를 불러올 수 있는가?
                //  [2] 비동기 통신으로 데이터를 어떻게 보내는가?
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
								$("#nega-btn").prop("disabled", false);
								$("#nega-btn").text("펫시터 거부");
							}
						}
					});
				});						
			});
    		

    </script>
    
    
    
	<h1>펫시터 관리페이지</h1>
	
	<a href="${pageContext.request.contextPath}/admin/">메인으로</a>
		<a href="${pageContext.request.contextPath}/admin/petsitter/option">펫시터 옵션 등록하기</a>
	
	<br><br>
	<hr>
	<br><br>
	
	<h2> 펫시터 리스트 </h2>
	
	<c:forEach var="petsitter" items="${petsitterList}">			
			<h3>${petsitter}</h3>
					
			<!-- 펫시터 상태 변경 버튼 -->
			<form action="petstatus" method=post>			
					<input type="hidden" name="sitter_id" value="${petsitter.sitter_id}">
					<input type="hidden" name="sitter_status" value="휴면">					
					<button type="submit" >펫시터  휴면 변경</button>						
			</form>
				
			<!-- 펫시터 차단 버튼 -->	
			<form action="blacklist_content" method="get">			
					<input type="hidden" name="sitter_id" value="${petsitter.sitter_id}">				
					<button type="submit" >차단 펫시터 등록</button>						
			</form>					
	</c:forEach>	
	
	
	<br><br>
	<hr>
	<br><br>
	
	<h2> 페시터 신청 회원 </h2>	
		
	<c:forEach var="petsitterapply" items="${petsitterApplyList}" >	
			<h3>${petsitterapply}</h3>						
			
			<!-- 펫시터 승인 버튼 -->			
			<form action="apply" method="post">
						<input type="hidden" name="sitter_id" value="${petsitterapply.sitter_id}">	
						<button type="submit" > 펫시터 승인</button>
			</form>		
			
			<!-- 펫시터 거부 버튼 -->
	 		<form   class="petnegative"  action="negative" method="post">
						<input type="hidden" name=sitter_id value="${petsitterapply.sitter_id}">
						<input type="hidden" name=email value="${petsitterapply.email}">				
						<button type="submit" id="nega-btn"> 펫시터 거부</button>
			</form> 	
	</c:forEach>
	
	
	<br><br>
	<hr>
	<br><br>
	
	<h2> 휴면 페시터 회원 </h2>	
	
	<c:forEach var="petsitterSleep" items="${petsitterSleepList}">
		
			<h3>${petsitterSleep}</h3>
			
				<!-- 펫시터 상태 변경 버튼 -->
			<form action="petstatus" method=post>			
					<input type="hidden" name="sitter_id" value="${petsitterSleep.sitter_id}">
					<input type="hidden" name="sitter_status" value="정상">					
					<button type="submit" >펫시터 정상 변경</button>						
			</form>
	
	</c:forEach>
	
	<br><br>
	<hr>
	<br><br>
	