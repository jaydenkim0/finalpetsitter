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
				
				
		<%-- 		<c:if test="${member.black_content == null }">
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
						
		</c:forEach>							
	