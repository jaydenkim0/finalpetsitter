<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
    <script>
	// 원하는 페이지로 이동시 검색조건, 키워드 값을 유지하기 위해 
	function list(page){
		location.href="${pageContext.request.contextPath}/admin/list/member?curPage="+page+"&searchOption=${searchOption}"+"&keyword=${keyword}";
		}
	</script>
     
	<h3>회원 리스트</h3>
	

	
	
		<form method="post" action="${pageContext.request.contextPath}/admin/list/member">
			<select name="searchOption">
				<!-- 검색조건을 검색처리후 결과화면에 보여주기위해  c:out 출력태그 사용, 삼항연산자 -->
				<option value="id"  >아이디</option>
				<option value="name"  >이름</option>
				<option value="nick"  >닉네임</option>
				<option value="grade" >등급</option>
			</select>
			<input name="keyword" value="${keyword}">
			<input type="submit" value="조회">
		</form>
		
		
		${count}개의 게시물이 있습니다.
	
	
		<!-- 정리해야되는 내용  -->
		<c:forEach var="List" items="${list}">
			<h3>${List}</h3>	
		</c:forEach>
		<h3>count : ${count}</h3>	
		<h3>searchOption : ${searchOption }</h3>
		<h3>keyword : ${keyword}</h3>
		<h3>navi : ${navi}</h3>
	
	
	
	
	
	
		<!-- 페이징 -->
		<tr>
			<td colspan="5">
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
			</td>
		</tr>
		<!-- 페이징 -->