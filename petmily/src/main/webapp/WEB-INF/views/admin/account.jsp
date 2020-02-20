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