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
								alert("이메일 발송 완료");
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
	  a button{
	 	background: #ad3a11;
	    padding: 7px 14px;
	    color: #fff;
	    border: 0;
	    font-weight: bold;
	 }
	  a:hover button{
	 	background: rgba(173, 58, 17, 0.78);
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

	<div class="scrollbox">
	<table>
		<tr>
			<th> 펫시터 아이디 </th>
			<th> 펫시터 상태 </th>
			<th> 펫시터 서비스 유형 </th>
			<th> 비고 </th>			
			<th> 버튼 </th>
		</tr>	 	
			<c:forEach var="petsitter" items="${petsitterList}">	
				<c:choose>			
						<c:when test="${petsitter.black_count  > 0}">		
						<tr>
							<td>
								<a href="${pageContext.request.contextPath}/admin/petsitter/petsitterdetail?pet_sitter_no=${petsitter.pet_sitter_no}"
								style="color: red;">															
										${petsitter.sitter_id} 
								</a>
							</td>								
							<td style="color: red;"> ${petsitter.sitter_status} </td>	
							<td style="color: red;"> ${petsitter.sitter_matching_type} </td>	
							<td style="color: red;"> (${petsitter.black_count}) </td>	
							<td>		
							<!-- 펫시터 상태 변경 버튼 -->	
								<form action="petstatus" method=post>			
										<input type="hidden" name="sitter_id" value="${petsitter.sitter_id}">
										<input type="hidden" name="sitter_status" value="휴면">					
										<button type="submit" >펫시터  휴면 변경</button>						
								</form>
							</td>	
						</tr>		
						</c:when>	
					<c:otherwise>
						<tr>
							<td>
								<a href="${pageContext.request.contextPath}/admin/petsitter/petsitterdetail?pet_sitter_no=${petsitter.pet_sitter_no}">															
										${petsitter.sitter_id} 
								</a>
							</td>								
							<td>	${petsitter.sitter_status} </td>	
							<td>	${petsitter.sitter_matching_type} </td>	
							<td> </td>	
							<td>		
							<!-- 펫시터 상태 변경 버튼 -->	
								<form action="petstatus" method=post>			
										<input type="hidden" name="sitter_id" value="${petsitter.sitter_id}">
										<input type="hidden" name="sitter_status" value="휴면">					
										<button type="submit" >펫시터  휴면 변경</button>						
								</form>
							</td>	
						</tr>		
					</c:otherwise>
				</c:choose>						
			</c:forEach>
		</table>			
	</div>
	
	<br><br>
	<hr>
	<br><br>
	
	<h2> <a href="${pageContext.request.contextPath}/admin/list/petsitterapply">펫시터 신청 리스트</a>  </h2>	
	

	<!-- 
		조건 1 일반회원 (black_content 가 null 값이면 일반회원)
		조건 2 블랙리스트 회원  (black_content 가 null 값이 아니면 블랙리스트 회원)
		회원이 펫시터로 승인요청시 맴버일때 경고 받은 회원은 주황색으로 표시
	 -->			
	<div class="scrollbox">
	<table>
		<tr>
			<th> 아이디 </th>
			<th> 이름 </th>
			<th> 닉네임 </th>
			<th> 전화번호 </th>			
			<th> 가입신청일 </th>
			<th> 비고 </th>
			<th> 버튼 </th>
		</tr>	 		
		<c:forEach var="petsitterapply" items="${petsitterApplyList}" >	
				<c:choose>			
						<c:when test="${petsitterapply.black_count >0 }">		
							<tr>	
								<td>			
									<a href="${pageContext.request.contextPath}/admin/petsitter/petsitterdetailapply?pet_sitter_no=${petsitterapply.pet_sitter_no}"
									style="color:#ff8d00;">								
										${petsitterapply.id} 
									</a>			
								</td>				 
								<td style="color:#ff8d00;">	${petsitterapply.name}</td>	 
								<td style="color:#ff8d00;">	${petsitterapply.nick}	 </td>	 
								<td style="color:#ff8d00;">	${petsitterapply.phone}	</td>	 
								<td style="color:#ff8d00;">	${petsitterapply.getPetsitterdateWithFormat()}</td>	
								<td style="color:#ff8d00;">	(${petsitterapply.black_count})	</td>						
								<td>
									<!-- 펫시터 거부 버튼 -->
							 		<form   class="petnegative"  action="negative" method="post">
												<input type="hidden" name="sitter_id" value="${petsitterapply.sitter_id}">
												<input type="hidden" name="email" value="${petsitterapply.email}">
												<input type="hidden" name="pet_sitter_no" value="${petsitterapply.pet_sitter_no}">			
												<button type="submit" id="nega-btn"> 펫시터 거부</button>
									</form> 	
								</td>			
							</tr>							
						</c:when>
						<c:otherwise>			
							<tr>
								<td>
									<a href="${pageContext.request.contextPath}/admin/petsitter/petsitterdetailapply?pet_sitter_no=${petsitterapply.pet_sitter_no}">									
										${petsitterapply.id}
									</a>				
								</td>			
								<td> ${petsitterapply.name} </td> 
								<td>	${petsitterapply.nick} </td> 
								<td>	${petsitterapply.phone} </td>
								<td>	${petsitterapply.getPetsitterdateWithFormat()} </td>		
								<td> </td>
								<td> </td>									
							</tr>									
						</c:otherwise>	
				</c:choose>			
		</c:forEach>
	</table>
	</div>
	
	<br><br>
	<hr>
	<br><br>
	
	<h2> <a href="${pageContext.request.contextPath}/admin/list/petsittersleep"> 휴면 펫시터 리스트</a>  </h2>	

	<!-- 
		조건 1 일반 휴면 펫시터 (black_content 가 null 값이면 일반회원)
		조건 2 블랙리스트 휴면 펫시터  (black_content 가 null 값이 아니면 블랙리스트 펫시터)
		펫시터 경고를 받게 되면 바로 펫시터 상태가 '휴면'으로 변경되어 검색 노출이 안됨
	 -->
	<div class="scrollbox">
	<table>
		<tr>
			<th> 아이디 </th>
			<th> 펫시터 상태 </th>
			<th> 펫시터 서비스 유형 </th>
			<th> 비고 </th>			
			<th> 버튼 </th>	
		</tr>	 	
		<c:forEach var="petsitterSleepList" items="${petsittersleepList}">		
				<c:choose>			
					<c:when test="${petsitterSleepList.black_count  > 0}">		
							<tr>
								<td>
									<a href="${pageContext.request.contextPath}/admin/petsitter/petsitterdetailsleep?pet_sitter_no=${petsitterSleepList.pet_sitter_no}"
									style="color: red">							
										${petsitterSleepList.sitter_id} 
									</a>		
								</td>	
								<td style="color: red">	${petsitterSleepList.sitter_status} </td>
								<td style="color: red">	${petsitterSleepList.sitter_matching_type} </td>
								<td style="color: red">	(${petsitterSleepList.black_count}) </td>								
								<td>				
								<!-- 펫시터 상태 변경 버튼 -->
									<form action="petstatus" method=post>			
												<input type="hidden" name="sitter_id" value="${petsitterSleepList.sitter_id}">
												<input type="hidden" name="sitter_status" value="정상">					
												<button type="submit" >펫시터 정상 변경</button>						
									</form>
								</td>
							</tr>				
					</c:when>		
					<c:otherwise>		
							<tr>	
								<td>			
									<a href="${pageContext.request.contextPath}/admin/petsitter/petsitterdetailsleep?pet_sitter_no=${petsitterSleepList.pet_sitter_no}">							
										${petsitterSleepList.sitter_id} 
									</a>	
								</td>	
								<td>	${petsitterSleepList.sitter_status} </td>
								<td> ${petsitterSleepList.sitter_matching_type}</td>
								<td>		</td>						
								<td>
								<!-- 펫시터 상태 변경 버튼 -->
									<form action="petstatus" method=post>			
											<input type="hidden" name="sitter_id" value="${petsitterSleepList.sitter_id}">
											<input type="hidden" name="sitter_status" value="정상">					
											<button type="submit" >펫시터 정상 변경</button>						
									</form>	
								</td>	
							</tr>			
					</c:otherwise>
				</c:choose>	 		
		</c:forEach>
	</table>
	</div>
	
	<br><br>
	<hr>
	<br><br>
	