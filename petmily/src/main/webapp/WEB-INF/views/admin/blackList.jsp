<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core" %>
       <!-- 
    	이용약관에
    	-> 차단 회원 및 페시터가 되면 2년간 정보가 보관되며
    		해당 아이디 이름 전화번호로 재가입이 불가함을 고지
    		
    	-> 일반회원, 펫시터 블랙리스트에 등록된 (아이디, 이름, )
     -->
     <br>
    <a href="${pageContext.request.contextPath}/admin/"><button>메인으로</button></a>
    <br>
    
    <h1>차단 등록 회원</h1>
    <!-- 강제 탈퇴 -->
      <c:forEach var="memberblacklist" items="${MBlist}">
    	<h3>아이디 : ${memberblacklist.black_id}    	
	    	이름 : ${memberblacklist.black_name}    	
	    	전화번호 : ${memberblacklist.black_phone}    	
	    	등급 : ${memberblacklist.black_grade}    	
	    	블랙리스트 사유 : ${memberblacklist.black_content}   
	    	블랙리스트 등록일 : ${memberblacklist.black_wdate} </h3>  	
    </c:forEach>
    
    <br><br>
    <hr>
    <br><br>
    
	<h1>차단 등록 펫시터</h1>
    <!-- 검색상태 휴면으로 변경  -->
    <c:forEach var="petblacklist" items="${PBlist}">
    	<h3>아이디 : ${petblacklist.black_id},    	
		    이름 : ${petblacklist.black_name},    	
		    전화번호 : ${petblacklist.black_phone},    	
		    등급 : ${petblacklist.black_grade},    	
		    블랙리스트 사유 : ${petblacklist.black_content},   
		    블랙리스트 등록일 : ${petblacklist.black_wdate} </h3>
    </c:forEach>
	
	