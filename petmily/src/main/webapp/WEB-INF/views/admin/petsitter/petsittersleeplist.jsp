<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
    <script>
		// 원하는 페이지로 이동시 검색조건, 키워드 값을 유지하기 위해 생성
		function list(page){
			location.href="${pageContext.request.contextPath}/admin/list/petsittersleep?curPage="+page+"&searchOption=${searchOption}"+"&keyword=${keyword}";
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
     
	<h3>휴면 펫시터 리스트</h3>	
	
	<a href="${pageContext.request.contextPath}/admin/"><button>메인으로 이동</button></a>
	
	<!-- 검색 기능 -->
	<form method="post" action="${pageContext.request.contextPath}/admin/list/petsittersleep">
		<select name="searchOption" >		
			<option value="id"  >아이디</option>
			<option value="name"  >이름</option>
			<option value="nick"  >닉네임</option>
		</select>		
		<input  name="keyword" value="${keyword}" id="keyword">
		<input type="submit" value="검색">
	</form>
	
	
	${count}개의 게시물이 있습니다.	

	<table>
		<tr>
			<th> 아이디 </th>
			<th> 펫시터 상태 </th>
			<th> 펫시터 서비스 유형 </th>
			<th> 비고 </th>			
		</tr>	 
		<!-- 리스트 내용 -->
		<c:forEach var="petsitterSleepList" items="${list}">		
			<c:choose>			
					<c:when test="${petsitterSleepList.black_count  > 0}">	
						<tr>	
							<td>	
								<a href="${pageContext.request.contextPath}/admin/petsitter/petsitterdetailsleep?pet_sitter_no=${petsitterSleepList.pet_sitter_no}"
								style="color: red">							
									${petsitterSleepList.sitter_id}
								</a>		
							</td>		
							<td style="color: red">	${petsitterSleepList.sitter_status} </td>	
							<td style="color: red">	${petsitterSleepList.sitter_matching_type} </td>	
							<td style="color: red">	(${petsitterSleepList.black_count}) </td>								
						</tr>			
					</c:when>		
					<c:otherwise>		
						<tr>	
							<td>				
								<a href="${pageContext.request.contextPath}/admin/petsitter/petsitterdetailsleep?pet_sitter_no=${petsitterSleepList.pet_sitter_no}">							
									ID : ${petsitterSleepList.sitter_id} 
								</a>		
							</td>		
							<td>	${petsitterSleepList.sitter_status} </td> 
							<td>	${petsitterSleepList.sitter_matching_type} </td>
							<td>	</td>
						</tr>				
					</c:otherwise>
				</c:choose>	 		
		</c:forEach>
	</table>


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