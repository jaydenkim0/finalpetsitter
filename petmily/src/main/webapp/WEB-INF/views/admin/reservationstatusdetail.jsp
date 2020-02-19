<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	
	<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	
	<h3>예약기능 디테일 페이지</h3>
	
	<h3>	회원	정보</h3>		
		<table>
			<tbody>			
				<tr>
					<tr>			
						<td> 신청 회원 : ${acountOne.member_id}</td>					
					</tr>
					<tr>			
						<td> 견적승인 펫시터  : ${sitter_id}</td>					
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
					<tr>			
						<td> 결제 신청 상태 : ${acountOne.kakaopaystatus}</td>					
					</tr>
					<tr>			
						<td> 신청 내용  : ${acountOne.ect}</td>					
					</tr>					
					<tr>			
						<td> 결제 시간 : ${acountOne.pay_joindate}</td>					
					</tr>		
					
					<c:forEach var="paynameAll" items="${payinfo}">
						<tr>			
							<td> 요청 서비스 : ${paynameAll.payname}</td>					
						</tr>		
					</c:forEach>
			</tbody>	
	</table>