	<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

 	
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

	 

    <a href="${pageContext.request.contextPath}/admin/"><button>메인으로</button></a>	 

	
	<h4>총 등록 수 (회원, 펫시터, 관리자 포함) : ${mtotal} 명</h4> 
	<h4 style="background:#f2f2f2;"> 총 회원 : ${member} 명 </h4> 
	<h4 style="background: #bbbbbb;"> 총 펫시터 : ${ptotal} 명 </h4>
	<h4 style="background:rgba(96, 125, 139, 0.7);"> 총 관리자 : ${atotal} 명 </h4>
	

	<hr>

	<h4 style="background:#f2f2f2;">	어제 가입한 맴버의 수 : ${mlist+slist} 명</h4>
	<h4 style="background: #bbbbbb;"> 어제 가입한 회원 수 :  ${mlist} 명</h4>
	<h4 style="background:rgba(96, 125, 139, 0.7);">	어제 펫시터 신청 수 :  ${slist} 명</h4>
	

	<hr>

	
	<h3>	어제 신고 게시글 수 : ${listBqna} 회</h3>
	<h4 style="background: #bbbbbb;"> 어제 경고 당한 회원의 수 :  ${listBm} 명</h4>
	<h4 style="background:rgba(96, 125, 139, 0.7);"> 어제 경고 당한 펫시터의 수 : ${listBs} 명</h4> 
	
	
     
	