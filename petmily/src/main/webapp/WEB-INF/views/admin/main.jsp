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
	 
	<h1>관리자 메인페이지</h1>
	
	
	<a href="registInfo"><button>회원 및 펫시터 등록 현황</button></a>
	<a href="member"><button>회원 관리</button></a>
	<a href="petsitter"><button>펫시터 관리</button></a>
	<a href="account"><button>정산관리</button></a>
	<a href="blackList"><button>경고 회원 및 펫시터 관리</button></a>
	
	<br><br>
	<h3> 총 등록 수 (회원, 펫시터, 관리자 포함) : ${mtotal} 명 </h3>
	<h3 style="background:#f2f2f2;"> 총 회원 : ${member} 명 </h3> 
	<h3 style="background:rgba(96, 125, 139, 0.7);"> 총 펫시터 : ${ptotal} 명 </h3>
	<h3> 총 관리자 : ${atotal} 명 </h3>