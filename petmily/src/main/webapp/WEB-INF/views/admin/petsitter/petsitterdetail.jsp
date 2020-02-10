<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
	<h3> 펫시터 정보 </h3>
	<!-- 현재 페이지에서 펫시터 상태 휴면으로 전환가능 -->
	
	<a href="${pageContext.request.contextPath}/admin/petsitter"><button>펫시터페이지로 이동</button></a>
		
	<table>
			<tbody>
				<tr>			
					<td>아이디 : ${petsitter.sitter_id}</td>					
				</tr>
				<tr>			
					<td>닉네임 : ${petsitter.nick}</td>					
				</tr>
				<tr>			
					<td>이메일 : ${petsitter.email}</td>					
				</tr>
				<tr>			
					<td>우편번호 : ${petsitter.post}</td>
					<td>주소 : ${petsitter.basic_addr}, ${petsitter.extra_addr}</td>						
				</tr>
				<tr>			
					<td> 반려동물 경험 유무   : ${petsitter.sitter_pets}</td>					
				</tr>
				<tr>			
					<td> 펫시터 가입일   : ${petsitter.sitter_joindate}</td>					
				</tr>
				<tr>			
					<td> 펫시터 마지막로그인  : ${petsitter.lastlogin}</td>					
				</tr>
				
				<tr>			
					<td> 펫시터 정보   : ${petsitter.info}</td>					
				</tr>
				
				<tr>			
					<td> 펫시터 상태 (정상, 휴면)   : ${petsitter.sitter_status}</td>					
				</tr>
				
				<tr>			
					<td> 펫시터 서비스 종류 (방문, 돌봄, 둘다)   : ${petsitter.sitter_matching_type}</td>					
				</tr>
				
				<tr>			
					<td>등급 : ${petsitter.grade}</td>					
				</tr>			
				
				<tr>			
					<td>포인트 : ${petsitter.point}</td>					
				</tr>	
							
			<hr>
			
		
				<!-- 서비스 가능지역  -->
				<h4>서비스 가능지역</h4>
				<c:forEach var="petlocation" items="${petlocation}">
					
					광역시 : ${petlocation.city}, 
					지역 : ${petlocation.area}
			
				</c:forEach>
				
			<hr>
			
				<!-- 돌봄 가능 동물종류  -->
				<h4>돌봄 가능 동물 종류</h4>
				<c:forEach var="pettypename" items="${pettypename}">
					 ${pettypename.care_type}
				</c:forEach>
				
			<hr>
				
				<!-- 서비스 가능 스킬  -->
				<h4> 서비스 가능 스킬 </h4>
				<c:forEach var="petskill" items="${petskill}">
					${petskill.skill_name}
				</c:forEach>
				
			<hr>
			
				<!-- 펫시터 환경  -->
				<h4>펫시터 돌봄 가능 환경</h4>
				<c:forEach var="petcondition" items="${petcondition}">
					${petcondition.care_condition_name}
				</c:forEach>
				
			<hr>
			</tbody>	
	</table>
			
		<c:choose>			
			<c:when test="${empty petsitterSleepList.black_count}">	
				<!-- 펫시터 상태 변경 -->
				<form action="${pageContext.request.contextPath}/admin/petstatus" method=post>			
						<input type="hidden" name="sitter_id" value="${petsitter.sitter_id}">
						<input type="hidden" name="sitter_status" value="휴면">					
						<button type="submit" >펫시터  휴면 변경</button>						
				</form>		
				<!-- 펫시터 경고 등록 버튼 -->	
				<form action="${pageContext.request.contextPath}/admin/sitter_blacklist_content" method="get">			
						<input type="hidden" name="sitter_id" value="${petsitter.sitter_id}">				
						<button type="submit" >경고 펫시터 등록</button>						
				</form>
			</c:when>
			<c:otherwise>
			<h3>※아래와 같은 사유로 경고를 받은 펫시터입니다</h3>
			<h3>경고 사유 : ${petsitter.black_content}</h3>					
			<!-- 블랙리스트 등록 회원은 삭제 버튼 노출 -->
			<form action="${pageContext.request.contextPath}/admin/sitter_delete" method="get">			
					<input type="hidden" name="sitter_id" value="${petsitter.sitter_id}">	
					<input type="hidden" name="sitter_no" value="${petsitter.pet_sitter_no}">				
					<button type="submit" >경고 펫시터 탈퇴</button>						
			</form>	
			<!-- 블랙리스트 디테일 페이지로 이동 -->
			<form action="${pageContext.request.contextPath}/admin/blackListdetail" method="get">			
					<input type="hidden" name="id" value="${petsitter.sitter_id}">										
					<button type="submit" >블랙리스트 세부사항으로 이동</button>						
			</form>	
			</c:otherwise>
		</c:choose>

	
	
	