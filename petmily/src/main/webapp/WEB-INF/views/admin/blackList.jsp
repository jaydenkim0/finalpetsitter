<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core" %>
    
    
    
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
       <!-- 
    	이용약관에
    	-> 차단 회원 및 페시터가 되면 2년간 정보가 보관되며
    		해당 아이디 이름 전화번호로 재가입이 불가함을 고지
    		
    	-> 일반회원, 펫시터 블랙리스트에 등록된 (아이디, 이름, )
     -->
    <br>
    <a href="${pageContext.request.contextPath}/admin/"><button>메인으로</button></a>
    <a href="${pageContext.request.contextPath}/admin/list/blackreport"><button>신고게시판</button></a>
    <br>
    
    <h3><a href="${pageContext.request.contextPath}/admin/list/blacklistmember">경고 회원 리스트</a></h3>
    ※경고 회원은 회원 리스트에서 <span style="color:#ff8d00;">주황색</span>으로 표시
    

    <div class="scrollbox">
      <c:forEach var="memberblacklist" items="${MBlist}">      
        <a href="blackListdetail?id=${memberblacklist.black_id}" style="color:#ff8d00;"> 
    	<h3>
    		아이디 : ${memberblacklist.black_id},    	
	    	이름 : ${memberblacklist.black_name},   	
	    	전화번호 : ${memberblacklist.black_phone},    	
	    	등급 : ${memberblacklist.black_grade} 
	    	  (${memberblacklist.black_count})     	
	    	</h3>
	    	</a>  	
    </c:forEach>
   </div>
    
    
    <br><br>
    
    <br><br>
    
    
	<h3><a href="${pageContext.request.contextPath}/admin/list/blacklistsitter">경고 펫시터 리스트</a></h3>
	※경고 페시터의 경우 회원과 펫시터 리스트에서  <span style="color:red;">붉은색</span>으로 표시
	
   
    <div class="scrollbox">
    <c:forEach var="petblacklist" items="${PBlist}" >
    	<a href="blackListdetail?id=${petblacklist.black_id}" style="color:red;">
    	<h3>
    		아이디 : ${petblacklist.black_id},    	
		    이름 : ${petblacklist.black_name},    	
		    전화번호 : ${petblacklist.black_phone},    	
		    등급 : ${petblacklist.black_grade}	
		    (${petblacklist.black_count})
		    </h3>
		    </a>
    </c:forEach>
	</div>
	
	
    <br><br>

    <br><br>
	