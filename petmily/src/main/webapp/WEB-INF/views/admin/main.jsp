<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	
	
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
	 h3{
	 	padding:20px;
	 }
	 
	 </style>
	 
	
	
	<a href="registInfo"><button> 등록 현황</button></a>
	<a href="${pageContext.request.contextPath}/admin/list/reservationstatus"><button> 예약 현황</button></a>
	<a href="account"><button>정산 관리</button></a>
	<a href="${pageContext.request.contextPath}/board/review/list"><button>리뷰 관리</button></a>
	<a href="${pageContext.request.contextPath}/admin/list/member"><button>회원 관리 (리스트)</button></a>	
	<a href="petsitter"><button>펫시터 관리 (모아보기)</button></a>
		<a href="${pageContext.request.contextPath}/admin/list/petsitter"><button> 펫시터 관리 (리스트)</button></a>	
		<a href="${pageContext.request.contextPath}/admin/list/petsitterapply"><button>펫시터 신청 관리 (리스트)</button></a>	
		<a href="${pageContext.request.contextPath}/admin/list/petsittersleep"><button>휴면 펫시터 관리 (리스트)</button></a>	
	<a href="blackList"><button>경고 회원 및 펫시터 관리</button></a>
	<a href="${pageContext.request.contextPath}"><button>펫시터 메인페이지로 이동</button></a>
	
	<h1>관리자 메인페이지</h1>

	
	<h3>
	펫시터 메인 화면입니다 
	※ 삭제할 페이지
	</h3>
	

						
	