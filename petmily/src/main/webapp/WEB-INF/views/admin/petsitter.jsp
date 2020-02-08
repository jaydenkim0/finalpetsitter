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
	<br>
	<a href="${pageContext.request.contextPath}/admin/"><button>메인으로</button></a>
	<a href="${pageContext.request.contextPath}/admin/petsitter/option"><button>펫시터 옵션 등록하기</button></a>
	
	<br><br>
	<hr>
	<br><br>
	
	
	<h2> 펫시터 리스트 </h2>
	
				<!-- 펫시터 검색 -->
				펫시터 검색 : 
				<form action="petsitterSearch" method="post">	
					<select name="type">
						<option value="id">아이디</option>
						<option value="name" >이름</option>
						<option value="nick">닉네임</option>
					</select>		
					<input type="text" name="keyword" placeholder="검색명을 입력해주세요" required>
					<input type="submit" value="검색" >	
				</form>		
				<br>

	<c:forEach var="petsitter" items="${petsitterList}">	
			<a href="${pageContext.request.contextPath}/admin/petsitter/petsitterdetail?pet_sitter_no=${petsitter.pet_sitter_no}">
					<h3>펫시터 ID : ${petsitter.sitter_id},
					펫시터 상태(정상, 휴면) : ${petsitter.sitter_status},
					펫시터 서비스 유형 (방문, 돌봄, 둘다) : ${petsitter.sitter_matching_type}
					</h3>
			</a>							
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
	
				<!-- 펫시터 검색 -->
				펫시터 신청 검색 : 
				<form action="petsitterSearchApply" method="post">	
					<select name="type">
						<option value="id">아이디</option>
						<option value="name" >이름</option>
						<option value="nick">닉네임</option>
					</select>		
					<input type="text" name="keyword" placeholder="검색명을 입력해주세요" required>
					<input type="submit" value="검색" >	
				</form>		
				<br>		
		
	<c:forEach var="petsitterapply" items="${petsitterApplyList}" >	
			<c:choose>			
					<c:when test="${empty member.black_content}">	
						<a href="${pageContext.request.contextPath}/admin/petsitter/petsitterdetailapply?pet_sitter_no=${petsitterapply.pet_sitter_no}">
								<h3>
									펫시터 Id : ${petsitterapply.id},
									펫시터 이름: ${petsitterapply.name},
									펫시터 닉네임 : ${petsitterapply.nick},
									펫시터 전화번호: ${petsitterapply.phone},
									펫시터 가입신청일 : ${petsitterapply.joindate}			
								</h3>						
							</a>			
							<!-- 펫시터 승인 버튼 -->			
							<form action="apply" method="post">
										<input type="hidden" name="sitter_id" value="${petsitterapply.sitter_id}">	
										<button type="submit" > 펫시터 승인</button>
							</form>				
							<!-- 펫시터 거부 버튼 -->
					 		<form   class="petnegative"  action="negative" method="post">
										<input type="hidden" name="sitter_id" value="${petsitterapply.sitter_id}">
										<input type="hidden" name="email" value="${petsitterapply.email}">
										<input type="hidden" name="pet_sitter_no" value="${petsitterapply.pet_sitter_no}">			
										<button type="submit" id="nega-btn"> 펫시터 거부</button>
							</form> 
					</c:when>
					<c:otherwise>
						<a href="${pageContext.request.contextPath}/admin/petsitter/petsitterdetailapply?pet_sitter_no=${petsitterapply.pet_sitter_no}"
						style="color:#ff8d00;">
								<h3>
									펫시터 Id : ${petsitterapply.id},
									펫시터 이름: ${petsitterapply.name},
									펫시터 닉네임 : ${petsitterapply.nick},
									펫시터 전화번호: ${petsitterapply.phone},
									펫시터 가입신청일 : ${petsitterapply.joindate}			
								</h3>						
							</a>			
							<!-- 펫시터 승인 버튼 -->			
							<form action="apply" method="post">
										<input type="hidden" name="sitter_id" value="${petsitterapply.sitter_id}">	
										<button type="submit" > 펫시터 승인</button>
							</form>				
							<!-- 펫시터 거부 버튼 -->
					 		<form   class="petnegative"  action="negative" method="post">
										<input type="hidden" name="sitter_id" value="${petsitterapply.sitter_id}">
										<input type="hidden" name="email" value="${petsitterapply.email}">
										<input type="hidden" name="pet_sitter_no" value="${petsitterapply.pet_sitter_no}">			
										<button type="submit" id="nega-btn"> 펫시터 거부</button>
							</form> 	
					</c:otherwise>	
			</c:choose>			
	</c:forEach>
	
	
	<br><br>
	<hr>
	<br><br>
	
	<h2> 휴면 페시터 회원 </h2>	

				<!-- 펫시터 검색 -->
				휴면 펫시터 검색 : 
				<form action="petsitterSearchSleep" method="post">	
					<select name="type">
						<option value="id">아이디</option>
						<option value="name" >이름</option>
						<option value="nick">닉네임</option>
					</select>		
					<input type="text" name="keyword" placeholder="검색명을 입력해주세요" required>
					<input type="submit" value="검색" >	
				</form>		
				<br>
	
	<c:forEach var="petsitterSleepList" items="${petsitterSleepList}">		
			<c:choose>			
				<c:when test="${empty petsitterSleepList.black_content}">
						<a href="${pageContext.request.contextPath}/admin/petsitter/petsitterdetailsleep?pet_sitter_no=${petsitterSleepList.pet_sitter_no}">
							<h3>펫시터 ID : ${petsitterSleepList.sitter_id},
							펫시터 상태(정상, 휴면) : ${petsitterSleepList.sitter_status},
							펫시터 서비스 유형 (방문, 돌봄, 둘다)${petsitterSleepList.sitter_matching_type}
							</h3>
							</a>			
							<!-- 펫시터 상태 변경 버튼 -->
						<form action="petstatus" method=post>			
								<input type="hidden" name="sitter_id" value="${petsitterSleepList.sitter_id}">
								<input type="hidden" name="sitter_status" value="정상">					
								<button type="submit" >펫시터 정상 변경</button>						
						</form>
				</c:when>		
				<c:otherwise>		
							<a href="${pageContext.request.contextPath}/admin/petsitter/petsitterdetailsleep?pet_sitter_no=${petsitterSleepList.pet_sitter_no}"
							style="color: red">
							<h3>펫시터 ID : ${petsitterSleepList.sitter_id},
							펫시터 상태(정상, 휴면) : ${petsitterSleepList.sitter_status},
							펫시터 서비스 유형 (방문, 돌봄, 둘다)${petsitterSleepList.sitter_matching_type}
							</h3>
							</a>			
							<!-- 펫시터 상태 변경 버튼 -->
						<form action="petstatus" method=post>			
								<input type="hidden" name="sitter_id" value="${petsitterSleepList.sitter_id}">
								<input type="hidden" name="sitter_status" value="정상">					
								<button type="submit" >펫시터 정상 변경</button>						
						</form>					
				</c:otherwise>
			</c:choose>	 		
	</c:forEach>
	
	
	<br><br>
	<hr>
	<br><br>
	