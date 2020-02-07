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
			
			<tfoot>
			
					<!-- 펫시터 상태 변경 -->
					<form action="${pageContext.request.contextPath}/admin/petstatus" method=post>			
							<input type="hidden" name="sitter_id" value="${petsitter.sitter_id}">
							<input type="hidden" name="sitter_status" value="휴면">					
							<button type="submit" >펫시터  휴면 변경</button>						
					</form>
						
					<!-- 펫시터 차단 버튼 -->	
					<form action="${pageContext.request.contextPath}/admin/blacklist_content" method="get">			
							<input type="hidden" name="sitter_id" value="${petsitter.sitter_id}">				
							<button type="submit" >차단 펫시터 등록</button>						
					</form>
			
			</tfoot>
	</table>
	
	