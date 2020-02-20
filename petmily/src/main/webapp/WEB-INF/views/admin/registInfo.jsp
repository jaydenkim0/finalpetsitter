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
	 h3{
	 	padding:20px;
	 }
	 
	 </style>
	 
	 <h3> 등록 현황 </h3>
	 

    <a href="${pageContext.request.contextPath}/admin/"><button>메인으로</button></a>	 

	
	<h3> 총 등록 수 (회원, 펫시터, 관리자 포함) : ${mtotal} 명 </h3>
	<h3 style="background:#f2f2f2;"> 총 회원 : ${member} 명 </h3> 
	<h3 style="background: #bbbbbb;"> 총 펫시터 : ${ptotal} 명 </h3>
	<h3 style="background:rgba(96, 125, 139, 0.7);"> 총 관리자 : ${atotal} 명 </h3>
	
	<br>
	<hr>
	<br>
	
	<h3 style="background:#f2f2f2;">	어제 가입한 맴버의 수 : ${mlist+slist} 명</h3>
	<h3 style="background: #bbbbbb;"> 어제 가입한 회원 수 :  ${mlist} 명</h3>
	<h3 style="background:rgba(96, 125, 139, 0.7);">	어제 펫시터 신청 수 :  ${slist} 명</h3>
	
	<br>
	<hr>
	<br>
	
	<h3>	어제 신고 게시글 수 : ${listBqna} 회</h3>
	<h3 style="background: #bbbbbb;"> 어제 경고 당한 회원의 수 :  ${listBm} 명</h3>
	<h3 style="background:rgba(96, 125, 139, 0.7);"> 어제 경고 당한 펫시터의 수 : ${listBs} 명</h3> 
	