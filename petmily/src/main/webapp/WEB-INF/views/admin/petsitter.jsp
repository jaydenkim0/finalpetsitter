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
    <style>
	.scrollbox{
	    height: auto;
    	max-height: 500px;
	    background: rgba(202, 82, 38, 0.1);
	    width: 70%;
	    padding: 20px;
	    overflow-y: auto;
	    box-shadow: inset 1px 1px 7px rgba(0,0,0,0.1);
	}
    </style>
    
    
	<h1>펫시터 관리페이지</h1>
	<br>
	<a href="${pageContext.request.contextPath}/admin/"><button>메인으로</button></a>
	<a href="${pageContext.request.contextPath}/admin/petsitter/option"><button>펫시터 옵션 등록하기</button></a>
	
	<br><br>
	<hr>
	<br><br>
	
	<h2> <a href="${pageContext.request.contextPath}/admin/list/petsitter">펫시터 리스트</a> </h2>
	
		<!-- 	펫시터 검색
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
				<br> -->

	<div class="scrollbox">
	<c:forEach var="petsitter" items="${petsitterList}">	
		<c:choose>			
				<c:when test="${petsitter.black_count  > 0}">		
					<a href="${pageContext.request.contextPath}/admin/petsitter/petsitterdetail?pet_sitter_no=${petsitter.pet_sitter_no}"
					style="color: red">
							<h3>
							펫시터 ID : ${petsitter.sitter_id} |
							펫시터 상태 : ${petsitter.sitter_status} |
							펫시터 서비스 유형  : ${petsitter.sitter_matching_type}
							</h3>
					</a>							
					<!-- 펫시터 상태 변경 버튼 -->			
					<form action="petstatus" method=post>			
							<input type="hidden" name="sitter_id" value="${petsitter.sitter_id}">
							<input type="hidden" name="sitter_status" value="휴면">					
							<button type="submit" >펫시터  휴면 변경</button>						
					</form>
				</c:when>	
			<c:otherwise>
					<a href="${pageContext.request.contextPath}/admin/petsitter/petsitterdetail?pet_sitter_no=${petsitter.pet_sitter_no}">
							<h3>
							펫시터 ID : ${petsitter.sitter_id} |
							펫시터 상태 : ${petsitter.sitter_status} |
							펫시터 서비스 유형  : ${petsitter.sitter_matching_type}
							</h3>
					</a>							
					<!-- 펫시터 상태 변경 버튼 -->			
					<form action="petstatus" method=post>			
							<input type="hidden" name="sitter_id" value="${petsitter.sitter_id}">
							<input type="hidden" name="sitter_status" value="휴면">					
							<button type="submit" >펫시터  휴면 변경</button>						
					</form>
			</c:otherwise>
		</c:choose>						
	</c:forEach>			
	</div>
	
	<br><br>
	<hr>
	<br><br>
	
	<h2> <a href="${pageContext.request.contextPath}/admin/list/petsitterapply">펫시터 신청 리스트</a>  </h2>	
	
		<!-- 	펫시터 검색
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
				 -->
	<!-- 
		조건 1 일반회원 (black_content 가 null 값이면 일반회원)
		조건 2 블랙리스트 회원  (black_content 가 null 값이 아니면 블랙리스트 회원)
		회원이 펫시터로 승인요청시 맴버일때 경고 받은 회원은 주황색으로 표시
	 -->			
	<div class="scrollbox">
	<c:forEach var="petsitterapply" items="${petsitterApplyList}" >	
			<c:choose>			
					<c:when test="${petsitterapply.black_count >0 }">							
						<a href="${pageContext.request.contextPath}/admin/petsitter/petsitterdetailapply?pet_sitter_no=${petsitterapply.pet_sitter_no}"
						style="color:#ff8d00;">
								<h3>
									 Id : ${petsitterapply.id} |
									이름: ${petsitterapply.name} |
									닉네임 : ${petsitterapply.nick} |
									전화번호: ${petsitterapply.phone} |
									가입신청일 : ${petsitterapply.joindate}			
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
						<a href="${pageContext.request.contextPath}/admin/petsitter/petsitterdetailapply?pet_sitter_no=${petsitterapply.pet_sitter_no}">
								<h3>
									Id : ${petsitterapply.id} |
									이름: ${petsitterapply.name} |
									닉네임 : ${petsitterapply.nick} |
									전화번호: ${petsitterapply.phone} |
									가입신청일 : ${petsitterapply.joindate}											
								</h3>								
							</a>			
				<%-- 	<!-- 펫시터 승인 버튼 -->			
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
							</form> 	 --%>			
					</c:otherwise>	
			</c:choose>			
	</c:forEach>
	</div>
	
	<br><br>
	<hr>
	<br><br>
	
	<h2> <a href="${pageContext.request.contextPath}/admin/list/petsittersleep"> 휴면 펫시터 리스트</a>  </h2>	

		<!--  펫시터 검색
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
				<br> -->
	<!-- 
		조건 1 일반 휴면 펫시터 (black_content 가 null 값이면 일반회원)
		조건 2 블랙리스트 휴면 펫시터  (black_content 가 null 값이 아니면 블랙리스트 펫시터)
		펫시터 경고를 받게 되면 바로 펫시터 상태가 '휴면'으로 변경되어 검색 노출이 안됨
	 -->
	<div class="scrollbox">
	<c:forEach var="petsitterSleepList" items="${petsitterSleepList}">		
			<c:choose>			
				<c:when test="${petsitterSleepList.black_count  > 0}">				
							<a href="${pageContext.request.contextPath}/admin/petsitter/petsitterdetailsleep?pet_sitter_no=${petsitterSleepList.pet_sitter_no}"
							style="color: red">
							<h3>
							ID : ${petsitterSleepList.sitter_id} |
							펫시터 상태 : ${petsitterSleepList.sitter_status} |
							펫시터 서비스 유형 : ${petsitterSleepList.sitter_matching_type}
							</h3>
							</a>		
							<!-- 블랙리스트 등록 펫시터는 삭제 버튼 노출 -->
							<form action="sitter_delete" method="get">			
										<input type="hidden" name="sitter_id" value="${petsitterSleepList.sitter_id}">	
										<input type="hidden" name="sitter_no" value="${petsitterSleepList.pet_sitter_no}">			
							<button type="submit" >경고 펫시터 탈퇴</button>						
							</form>		
							<!-- 펫시터 상태 변경 버튼 -->
							<form action="petstatus" method=post>			
										<input type="hidden" name="sitter_id" value="${petsitterSleepList.sitter_id}">
										<input type="hidden" name="sitter_status" value="정상">					
										<button type="submit" >펫시터 정상 변경</button>						
							</form>			
				</c:when>		
				<c:otherwise>								
							<a href="${pageContext.request.contextPath}/admin/petsitter/petsitterdetailsleep?pet_sitter_no=${petsitterSleepList.pet_sitter_no}">
							<h3>
							ID : ${petsitterSleepList.sitter_id} |
							펫시터 상태 : ${petsitterSleepList.sitter_status} |
							펫시터 서비스 유형 : ${petsitterSleepList.sitter_matching_type}
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
	</div>
	
	<br><br>
	<hr>
	<br><br>
	