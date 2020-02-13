<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
    <script>
		// 원하는 페이지로 이동시 검색조건, 키워드 값을 유지하기 위해 생성
		function list(page){
			location.href="${pageContext.request.contextPath}/admin/list/member?curPage="+page+"&searchOption=${searchOption}"+"&keyword=${keyword}";
			}
	</script>
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
     
	<h3>회원 리스트</h3>	
	
	<a href="${pageContext.request.contextPath}/admin/"><button>메인으로 이동</button></a>
	
	<!-- 검색 기능 -->
	<form method="post" action="${pageContext.request.contextPath}/admin/list/member">
		<select name="searchOption" onchange="doChange(this, 'selTwo')">		
			<option value="id"  >아이디</option>
			<option value="name"  >이름</option>
			<option value="nick"  >닉네임</option>
			<option value="grade" >등급</option>
		</select>		
		<input  name="keyword" value="${keyword}" id="keyword">
		<input type="submit" value="검색">
	</form>
	
	
	${count}개의 게시물이 있습니다.	


	<!-- 리스트 내용 -->
	<c:forEach var="member"  items="${list}">		
		<c:choose>				
			<c:when test="${member.grade eq 'petsitter' && member.black_count > 0}">
					<a href="${pageContext.request.contextPath}/admin/memberdetail?id=${member.id}" 
					style="color:red;">
					<h4>아이디 : ${member.id},
					이름 : ${member.name},
					닉네임 : ${member.nick},
					이메일 : ${member.email}
					(${member.black_count})
					</h4>						
					</a>						
			</c:when>				
			<c:when test="${member.grade eq 'member' && member.black_count > 0}">
					<a href="${pageContext.request.contextPath}/admin/memberdetail?id=${member.id}" 
					style="color:#ff8d00;">
					<h4>아이디 : ${member.id},
					이름 : ${member.name},
					닉네임 : ${member.nick},
					이메일 : ${member.email}
					(${member.black_count})
					</h4>						
					</a>						
			</c:when>					
			<c:otherwise>
					<a href="${pageContext.request.contextPath}/admin/memberdetail?id=${member.id}" >
					<h4>아이디 : ${member.id},
					이름 : ${member.name},
					닉네임 : ${member.nick},
					이메일 : ${member.email}
					</h4>						
					</a>		
			</c:otherwise>
			</c:choose>							
	</c:forEach>		



	<!-- 페이징 -->
			<!-- 처음페이지로 이동 : 현재 페이지가 1보다 크면  [처음]하이퍼링크를 화면에 출력-->
			<c:if test="${navi.curBlock > 1}">
				<a href="javascript:list('1')">[처음]</a>
			</c:if>			
			<!-- 이전페이지 블록으로 이동 : 현재 페이지 블럭이 1보다 크면 [이전]하이퍼링크를 화면에 출력 -->
			<c:if test="${navi.curBlock > 1}">
				<a href="javascript:list('${navi.prevPage}')">[이전]</a>
			</c:if>			
			<!-- **하나의 블럭 시작페이지부터 끝페이지까지 반복문 실행 -->
			<c:forEach var="num" begin="${navi.blockBegin}" end="${navi.blockEnd}">
				<!-- 현재페이지이면 하이퍼링크 제거 -->
				<c:choose>
					<c:when test="${num == navi.curPage}">
						<span style="color: red">${num}</span>&nbsp;
					</c:when>
					<c:otherwise>
						<a href="javascript:list('${num}')">${num}</a>&nbsp;
					</c:otherwise>
				</c:choose>
			</c:forEach>			
			<!-- 다음페이지 블록으로 이동 : 현재 페이지 블럭이 전체 페이지 블럭보다 작거나 같으면 [다음]하이퍼링크를 화면에 출력 -->
			<c:if test="${navi.curBlock <= navi.totBlock}">
				<a href="javascript:list('${navi.nextPage}')">[다음]</a>
			</c:if>			
			<!-- 끝페이지로 이동 : 현재 페이지가 전체 페이지보다 작거나 같으면 [끝]하이퍼링크를 화면에 출력 -->
			<c:if test="${navi.curPage <= navi.totPage}">
				<a href="javascript:list('${navi.totPage}')">[끝]</a>
			</c:if>	
	<!-- 페이징 -->