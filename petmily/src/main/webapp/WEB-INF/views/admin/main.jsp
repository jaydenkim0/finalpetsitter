<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

	<h1>관리자 메인페이지</h1>
	
	
	<a href="member"><button>회원관리</button></a>
	<a href="petsitter"><button>펫시터관리</button></a>
	<a href="account"><button>정산관리</button></a>
	<a href="blackList"><button>차단펫시터관리</button></a>
	
	<br><br>
	<h3> 총 등록 수 (회원, 펫시터, 관리자 포함) : ${mtotal} 명 </h3><br><br>
	<h3> 총 회원 : ${member} 명 </h3> <br><br>
	<h3> 총 펫시터 : ${ptotal} 명 </h3> <br><br>
	<h3> 총 관리자 : ${atotal} 명 </h3> <br><br>