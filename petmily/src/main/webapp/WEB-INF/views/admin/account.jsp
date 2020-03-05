<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
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
	 h3{
	 	padding:20px;
	 }	 
	 /***form search****/
	 form{
	 	margin-top:16px;
	 } 
	 form select{
	 	height:30px;
	 	line-height:30px;
	 	vertical-align:middle;
	 }
	  form input[name="keyword"]{
	  	height:30px;
	  	line-height:30px;
	  	color:#333;
	  }
	 form input[type="submit"]{
	     background: #146fbd;
	    color: #fff;
	    /* padding: 7px 14px; */
	    border: 0;
	    border-radius: 3px;
	    height: 30px;
	    line-height: 30px;
	    box-sizing: border-box;
	    padding: 0 16px;
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
    	text-align:center;
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
	}
	table tr td a{
		color:#333;
	}
	
	/*page navigation*/
	.page-nivi-container{ 
		text-align: center;
	}
	.page-nivi-container a{
		color: #333;
	}
	
	h5 {
    display: block;
    font-size: 0.83em;
    margin-block-start: 1.67em;
    margin-block-end: 1.67em;
    margin-inline-start: 2px;
    margin-inline-end: 7px;
    font-weight: bold;
	 </style>
    
	 
    
	<h1>정산 관리 페이지</h1>
	<br>
	<a href="${pageContext.request.contextPath}/admin/"><button>메인으로</button></a>
	<a href="${pageContext.request.contextPath}/admin/accountoption"><button>가격 옵션 설정</button></a>
	
	
	<br><br>
	<div style="display: flex;">
		<h5>기간 선택 :</h5> 
		<form action="${pageContext.request.contextPath}/admin/account" method="post">
			<input type="hidden" name="type" value="1">
			<input type="hidden" name="SearchType" value="오늘">
			<button>오늘</button>
		</form> 
		<form action="${pageContext.request.contextPath}/admin/account" method="post">
			<input type="hidden" name="type" value="2">
			<input type="hidden" name="SearchType" value="어제">
			<button>어제</button>
		</form> 
		<form action="${pageContext.request.contextPath}/admin/account" method="post">
			<input type="hidden" name="type" value="3">
			<input type="hidden" name="SearchType" value="전월">
			<button>전월</button>
		</form> 
	</div>
	
	
	<h3> [ ${SearchType} ] 기준 검색</h3>
	
	<table>
		<tr>
			<th>토탈 결제 금액</th>
			<th>토탈 환불 금액</th>
			<th>견적 신청 수</th>
			<th>견적 승인 수</th>
			<th>견적 대기 수</th>
			<th>결제 완료 수</th>
			<th>결제 취소 수</th>
		</tr>
		<tr>
			<td> ${totalInfo.totalPayment} 원 </td>		
			<td> ${totalInfo.totalCancelPayment} 원 </td>	
			<td> ${totalInfo.reservatToTalCount} 회 </td>
				<td> ${totalInfo.reservatApplyToTalCount} 회 </td>
				<td> ${totalInfo.reservatWaitToTalCount} 회 </td>	
			<td>${totalInfo.totalPaymentCount} 회 </td>	
			<td> ${totalInfo.totalPaymentCancelCount} 회 </td>
		</tr>
	</table>
	
	※매달 1일 오전 9시 정산기능 실행 (스케쥴러) : 
	<br><br>
	※ 펫시터 정산리스트 (높은 금액 순으로 정렬)
	<br><br>
	
	<scrollbox>
	
	</scrollbox>
	6. 펫시터 정산 리스트로 이동
	
	