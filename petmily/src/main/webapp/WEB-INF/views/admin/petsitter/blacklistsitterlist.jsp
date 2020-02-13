<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
    <script>
		// 원하는 페이지로 이동시 검색조건, 키워드 값을 유지하기 위해 생성
		function list(page){
			location.href="${pageContext.request.contextPath}/admin/list/blacklistsitter?curPage="+page+"&searchOption=${searchOption}"+"&keyword=${keyword}";
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
     
	<h3> 경고 펫시터 리스트</h3>	
	
	<a href="${pageContext.request.contextPath}/admin/"><button>메인으로 이동</button></a>
	
	<!-- 검색 기능 -->
	<form method="post" action="${pageContext.request.contextPath}/admin/list/blacklistsitter">
		<select name="searchOption" >		
			<option value="black_id"  >아이디</option>
			<option value="black_name"  >이름</option>
		</select>		
		<input  name="keyword" value="${keyword}" id="keyword">
		<input type="submit" value="검색">
	</form>
	
	
	${count}개의 게시물이 있습니다.	


	<!-- 리스트 내용 -->
	 ※경고 페시터의 경우 회원과 펫시터 리스트에서  <span style="color:red;">붉은색</span>으로 표시
    <c:forEach var="petblacklist" items="${list}" >
    	<a href="${pageContext.request.contextPath}/admin/blackListdetail?id=${petblacklist.black_id}" style="color:red;">
    	<h3>아이디 : ${petblacklist.black_id},    	
		    이름 : ${petblacklist.black_name},    	
		    전화번호 : ${petblacklist.black_phone},    	
		    등급 : ${petblacklist.black_grade}	
		    </h3>
		    </a>
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