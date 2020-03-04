<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
     <style>
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
	 
    
	<h1>정산 관리 페이지</h1>
	<br>
	<a href="${pageContext.request.contextPath}/admin/"><button>메인으로</button></a>
	<a href="${pageContext.request.contextPath}/admin/accountoption"><button>가격 옵션 설정</button></a>
	
	
	<br><br>
	기간 선택 : 오늘, 어제, 지난주, 지난 달 , 기간 선택(지도 API 사용)
	
	<br><br>
	1. 토탈 결제 금액 : 
	<br><br>
	2. 토탈 환불 금액 : 
	<br><br>
	3. 견적신청 건수 : 
		1. 견적 승인 건수 : 
		2. 견적 대기 건수 :
		<br><br> 
	4. 결제 완료 건수 :
	<br><br> 
	5. 결제 취소 건수 : 
	<br><br>
	
	※매달 1일 오전 9시 정산기능 실행 (스케쥴러) : 
	<br><br>
	※ 펫시터 정산리스트 (높은 금액 순으로 정렬)
	<br><br>
	6. 펫시터 정산 리스트로 이동
	
	