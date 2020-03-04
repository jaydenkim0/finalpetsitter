<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	
	<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	
	
	    <style>
    img{
    	max-width:50%;
    }
    .box-container{
    	padding: 17px 10px;
	    border-bottom: 1px dashed #ddd;
	    
    }
    .box-container:nth-of-type(even){
    	background: #f2f2f2;
    }
    
    .box-container h4,
    .box-container h3{
    	margin-top:0;
    }
    /***button***/
    a{
     	color:#333;
     }
	 a button,
	 button{
	 	background: #146fbd;
	    padding: 7px 14px;
	    color: #fff;
	    border: 0;
	    font-weight: bold;
	    border-radius:3px;
	 }
	  a:hover button,
	  button:hover{
	 	background: #10538c;
	 }
	 /***table****/
	 table{
		 width: 100%;
	    border-top: 2px solid #808080;
	    margin-top: 17px;
	    border-bottom: 2px solid #808080;
	    /* padding: 17px 0; */
	    margin-bottom: 17px;
	    border-collapse:collapse;
    }
    table tr{
    	border-bottom: 1px solid #ddd;
    	/*text-align:center;*/
    }
    
    table tr th {
	    background: rgba(20, 111, 189, 0.2);
	    border-bottom: 1px solid #ddd;
	    padding: 10px 0;
	    border-right: 1px solid #fff;
	    color:#333;
	}
	table tr th:last-child,
	table tr td:last-child{
		border-right:0;
	}
	table tr td {
	    border-right: 1px solid #ddd;
	    padding: 10px 0;
	    color:#333;
	    padding-left:15px;
	}
	table tr td a{
		color:#333;
	}
    </style>
	
	<div class="box-container first">
		<h3>예약 디테일 페이지</h3>
	</div>
	

	
		<table>
			<tbody>			
				<tr>
					<tr>			
						<td> 신청 회원 : ${acountOne.member_id} |
							<a  href="${pageContext.request.contextPath}/admin/memberdetail?id=${acountOne.member_id}">
								회원 정보
							</a>
						</td>					
					</tr>
					<tr>			
						<td> 견적승인 펫시터 : ${sitter_id} |
							<a href="${pageContext.request.contextPath}/admin/petsitter/petsitterdetail?pet_sitter_no=${acountOne.reservation_sitter_no}"> 
								펫시터 정보
							</a>
						</td>					
					</tr>
					<tr>			
						<td> 예약 시간 : ${acountOne.matching_time}</td>					
					</tr>
					<tr>			
						<td> 이용 시작 시간 : ${startTime}</td>					
					</tr>
					<tr>			
						<td> 사용 시간 : ${usageTime}</td>											
					</tr>
					<tr>			
						<td> 결제 금액 :  ${payMent} </td>					
					</tr>
					<tr>			
						<td> 견적 신청 상태 : ${acountOne.status}</td>					
					</tr>
					
					<c:if test="${payinfo != null }">				
						<c:forEach var="pay" items="${payinfomation}">
							<tr>			
								<td> 결제 신청 상태 : ${pay.status}</td>	
								<c:if test="${pay.status eq '완료' and status eq 0}">							
										<!-- 결제 취소 버튼 -->
										<form action="${pageContext.request.contextPath}/pay/revoke" method="get">
											<input type="hidden" name="pay_no" value="${pay.pay_no}">										
											<button>결제 취소</button>
										</form>						
								</c:if>						
						</tr>						
						<tr>			
								<td> 승인 시간 : ${pay.process_time}</td>					
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