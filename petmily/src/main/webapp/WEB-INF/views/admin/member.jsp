<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
    
    <script>
    $()
    
    </script>
    
    
    
	<h1>회원 관리페이지</h1>
	<!-- 메인으로 돌아가는 버튼 -->
	<br>
	<a href="${pageContext.request.contextPath}/admin/"><button>메인으로</button></a>
	
	<br>	
	
	<!-- 검색 -->
	<form action="member" method="post">	
		<select name="type">
			<option value="id">아이디</option>
			<option value="name" >이름</option>
			<option value="nick">닉네임</option>
		</select>		
		<input type="text" name="keyword" placeholder="검색명을 입력해주세요" required>
		<input type="submit" value="검색" >	
	</form>		
	<br>
	
		<c:forEach var="member"  items="${memberList}">					
						<%-- 	
						<-- 조건식 : black_content 가 null 이면 일반회원 -->		
						<c:if test="${member.black_content == null }">
						<a href="${pageContext.request.contextPath}/admin/memberdetail?id=${member.id}" >
						<h5>아이디 : ${member.id},
						이름 : ${member.name},
						닉네임 : ${member.nick},
						이메일 : ${member.email},
						블랙리스트 : ${member.black_content}
						</h5>
						<hr>
						</a>	  
				</c:if>
						<c:if test="${member.black_content != null }">
						<a href="${pageContext.request.contextPath}/admin/memberdetail?id=${member.id}" 
						style="color:red; ">
						<h5>아이디 : ${member.id},
						이름 : ${member.name},
						닉네임 : ${member.nick},
						이메일 : ${member.email},
						블랙리스트 : ${member.black_content}
						</h5>
						<hr>
						</a>	  
				</c:if> --%>				
				
				<%-- 
				<-- 조건식 : black_content 가 null 이면 일반회원 -->		
				<c:choose>			
				<c:when test="${empty member.black_content}">
						<a href="${pageContext.request.contextPath}/admin/memberdetail?id=${member.id}" >
						<h5>아이디 : ${member.id},
						이름 : ${member.name},
						닉네임 : ${member.nick},
						이메일 : ${member.email}</h5>
						<hr>
						</a>						
				</c:when>				
				<c:otherwise>
						<a href="${pageContext.request.contextPath}/admin/memberdetail?id=${member.id}" 
						style="color:red; ">
						<h5>아이디 : ${member.id},
						이름 : ${member.name},
						닉네임 : ${member.nick},
						이메일 : ${member.email}</h5>
						<hr>
						</a>		
				</c:otherwise>
				</c:choose>	 
				 --%>
				
		<!-- 
			조건식1 경고 펫시터 : 등급이 '펫시터'이면서 black_content 가 null 이 아닌 사람
			조건식1 경고 회원 : 등급이 '회원'이면서 black_content 가 null 이 아닌 사람
			그외 : 일반회원
		 -->
		<c:choose>				
				<c:when test="${member.grade eq 'petsitter' && member.black_count > 0}">
						<a href="${pageContext.request.contextPath}/admin/memberdetail?id=${member.id}" 
						style="color:red;">
						<h5>아이디 : ${member.id},
						이름 : ${member.name},
						닉네임 : ${member.nick},
						이메일 : ${member.email}</h5>
						<hr>
						</a>						
				</c:when>				
				<c:when test="${member.grade eq 'member' && member.black_count > 0}">
						<a href="${pageContext.request.contextPath}/admin/memberdetail?id=${member.id}" 
						style="color:#ff8d00;">
						<h5>아이디 : ${member.id},
						이름 : ${member.name},
						닉네임 : ${member.nick},
						이메일 : ${member.email}</h5>
						<hr>
						</a>						
				</c:when>					
				<c:otherwise>
						<a href="${pageContext.request.contextPath}/admin/memberdetail?id=${member.id}" >
						<h5>아이디 : ${member.id},
						이름 : ${member.name},
						닉네임 : ${member.nick},
						이메일 : ${member.email}</h5>
						<hr>
						</a>		
				</c:otherwise>
				</c:choose>							
		</c:forEach>							
	