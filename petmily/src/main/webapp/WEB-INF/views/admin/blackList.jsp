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
    	<table>
    		<tr>
    			<td> 아이디 </td>
    			<td> 이름 </td>
    			<td> 전화번호 </td>
    			<td> 등급 </td>
    			<td> 경고 횟수 </td>
    		</tr>
			<c:forEach var="memberblacklist" items="${MBlist}"> 
				<tr>
					<td>     
				        <a href="blackListdetail?id=${memberblacklist.black_id}" style="color:#ff8d00;"> 	    
				    		${memberblacklist.black_id},    	
					    </a> 
				    </td> 	
				   	<td style="color:#ff8d00;"> ${memberblacklist.black_name} </td> 		
				    <td style="color:#ff8d00;"> ${memberblacklist.black_phone} </td> 	    	
				    <td style="color:#ff8d00;"> ${memberblacklist.black_grade} </td> 	
				    <td style="color:#ff8d00;"> (${memberblacklist.black_count}) </td> 	    	
			    </tr>	
			</c:forEach>
		</table>
	</div>
    

    
    
	<h3><a href="${pageContext.request.contextPath}/admin/list/blacklistsitter">경고 펫시터 리스트</a></h3>
	※경고 페시터의 경우 회원과 펫시터 리스트에서  <span style="color:red;">붉은색</span>으로 표시
	
   
    <div class="scrollbox">
    	<table>
    		<tr>
    			<td> 아이디 </td>
    			<td> 이름 </td>
    			<td> 전화번호 </td>
    			<td> 등급 </td>
    			<td> 경고 횟수 </td>
    		</tr>
		    <c:forEach var="petblacklist" items="${PBlist}" >
		    	<tr>
		    		<td>
				    	<a href="blackListdetail?id=${petblacklist.black_id}" style="color:red;">		    	
				    		${petblacklist.black_id},    	
						 </a>
					 </td>
					 <td style="color:red;"> ${petblacklist.black_name}  </td>   	
					 <td style="color:red;"> ${petblacklist.black_phone}  </td>    	
					 <td style="color:red;"> ${petblacklist.black_grade}  </td>	
					 <td style="color:red;"> (${petblacklist.black_count})  </td>					    
				</tr>  
		    </c:forEach>
	    </table>
	</div>
	
	
  
	