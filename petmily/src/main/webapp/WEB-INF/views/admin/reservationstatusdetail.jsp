<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	
	<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	
	<h3>예약기능 디테일 페이지</h3>
	
	<h3>	회원	정보</h3>		
		<table>
			<tbody>			
				<tr>
					<tr>			
						<td> 신청 회원 : 
							<a  href="${pageContext.request.contextPath}/admin/memberdetail?id=${acountOne.member_id}">
								${acountOne.member_id}
							</a>
						</td>					
					</tr>
					<tr>			
						<td> 견적승인 펫시터  :
							<a href="${pageContext.request.contextPath}/admin/petsitter/petsitterdetail?pet_sitter_no=${acountOne.reservation_sitter_no}"> 
								${sitter_id}
							</a>
						</td>					
					</tr>
					<tr>			
						<td> 예약 시간 : ${acountOne.matching_time}</td>					
					</tr>
					<tr>			
						<td> 사용 시간 : ${usage_time}</td>											
					</tr>
					<tr>			
						<td> 결제 금액 :  ${acountOne.total_amount} </td>					
					</tr>
					<tr>			
						<td> 견적 신청 상태 : ${acountOne.status}</td>					
					</tr>
					
					<c:if test="${payinfo != null }">				
						<c:forEach var="pay" items="${payinfomation}">
							<tr>			
								<td> 결제 신청 상태 : ${pay.status}</td>					
							</tr>
							<tr>			
								<td> 결제 시간 : ${pay.process_time}</td>					
							</tr>							
						</c:forEach>
					</c:if>
					
					<tr>			
						<td> 신청 내용  : ${acountOne.ect}</td>					
					</tr>	
										
					<c:forEach var="paynameAll" items="${payinfo}">
						<tr>			
							<td> 요청 서비스 : ${paynameAll.payname}</td>					
						</tr>		
					</c:forEach>
					
			</tbody>	
	</table>