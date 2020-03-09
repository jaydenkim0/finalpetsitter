<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <c:set var="context" value="${pageContext.request.contextPath}"></c:set>       
    
		<meta charset="UTF-8">
		<title>등록현황</title>
	
		  	
	 	<style>
		 a button{
		 	background: #146fbd;
		    padding: 7px 14px;
		    color: #fff;
		    border: 0;
		    font-weight: bold;
		    border-radius:3px;
		 }
		  a:hover button{
		 	background: #10538c;
		 }
		 h4{
		 	padding:20px;
		 }	 
		 </style> 		 

	 
	
	<div>
		<!-- <a href="registInfo"><button> 등록 현황</button></a> -->
		<a href="${pageContext.request.contextPath}/admin/list/reservationstatus"><button> 예약 현황</button></a>
		<a href="account"><button>정산 관리</button></a>
		<a href="${pageContext.request.contextPath}/board/review/list"><button>리뷰 관리</button></a>
		<a href="${pageContext.request.contextPath}/admin/list/member"><button>회원 관리 (리스트)</button></a>	
		<a href="petsitter"><button>펫시터 관리 (모아보기)</button></a>
			<a href="${pageContext.request.contextPath}/admin/list/petsitter"><button> 펫시터 관리 (리스트)</button></a>	
			<a href="${pageContext.request.contextPath}/admin/list/petsitterapply"><button>펫시터 신청 관리 (리스트)</button></a>	
			<a href="${pageContext.request.contextPath}/admin/list/petsittersleep"><button>휴면 펫시터 관리 (리스트)</button></a>	
		<a href="blackList"><button>경고 회원 및 펫시터 관리</button></a>
		<a href="${pageContext.request.contextPath}"><button> 메인페이지로 이동</button></a>	
	</div>

	<div >	
		
		<h4>총 등록 수 (회원, 펫시터, 관리자 포함) : ${mtotal} 명</h4> 
		<h4 style="background:#f2f2f2;"> 총 회원 : ${member} 명 </h4> 
		<h4 style="background: #bbbbbb;"> 총 펫시터 : ${ptotal} 명 </h4>
		<h4 style="background:rgba(96, 125, 139, 0.7);"> 총 관리자 : ${atotal} 명 </h4>		
	
		<hr>
	
		<h4 style="background:#f2f2f2;">	어제 가입한 맴버의 수 : ${mlist+slist} 명</h4>
		<h4 style="background: #bbbbbb;"> 어제 가입한 회원 수 :  ${mlist} 명</h4>
		<h4 style="background:rgba(96, 125, 139, 0.7);">	어제 펫시터 신청 수 :  ${slist} 명</h4>		
	
		<hr>	
		
		<h4 style="background:#f2f2f2;">	어제 신고 게시글 수 : ${listBqna} 회</h4>
		<h4 style="background: #bbbbbb;"> 어제 경고 당한 회원의 수 :  ${listBm} 명</h4>
		<h4 style="background:rgba(96, 125, 139, 0.7);"> 어제 경고 당한 펫시터의 수 : ${listBs} 명</h4> 
	</div>
	
	

						
	